% Define the latitude and longitude of the initial northwest (NW) corner
nw_lat = 29.83387;   % Initial latitude
nw_lon = -95.4289;   % Initial longitude

% Specify the number of target regions to generate
num_regions = 10;

% Specify the number of trajectories to generate for each region
num_trajectories = 50;

% Define the spacing between regions in meters to avoid overlap
d = 260;   % Approximate spacing for a 256m x 256m square region

% Earth radius in meters
R = 6371 * 1000;

% Preallocate arrays to store the NW corner coordinates of each region
nw_lat_list = zeros(1, num_regions);
nw_lon_list = zeros(1, num_regions);

% Assign the NW coordinates of the first region
nw_lat_list(1) = nw_lat;
nw_lon_list(1) = nw_lon;

% Convert the spacing distance from meters to latitude/longitude offsets
delta_lat = (d / R) * (180 / pi);
delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);

% Generate the NW corner coordinates for the remaining non-overlapping regions
for i = 2:num_regions
    % Shift each new region southward and eastward from the previous one
    nw_lat_list(i) = nw_lat_list(i-1) - delta_lat;
    nw_lon_list(i) = nw_lon_list(i-1) + delta_lon;
end

env_num = 0;

for k = 1 : length(nw_lat_list)
    for l = 1 : length(nw_lon_list)
        tic
        env_num = env_num + 1 + 0;
        disp(env_num)

        directory_name = 'dataset_'+string(env_num);

        % Create the dataset directory if it does not already exist
        if ~exist(directory_name, 'dir')
            mkdir(directory_name);
        end
        
        nw_lat = nw_lat_list(k);
        nw_lon = nw_lon_list(l);
        
        % Constants
        R = 6371 * 1000;   % Earth radius in meters
        d = 256;           % Side length of the target region in meters
        
        % Compute the southeast (SE) corner coordinates of the square region
        delta_lat = (d / R) * (180 / pi);
        delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
        
        se_lat = nw_lat - delta_lat;
        se_lon = nw_lon + delta_lon;
        
        % Length of the diagonal of the square region
        diagonalDistance = 364.3;
        
        % Generate a 256 x 256 coordinate grid over the target region
        lat_range = linspace(nw_lat, se_lat, 256);
        lon_range = linspace(nw_lon, se_lon, 256);
        
        [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
        lat_lon_table = [reshape(lat_mesh, 1, []) ; reshape(lon_mesh, 1, [])]';
        
        % Expand the bounding box to download a larger surrounding OSM area
        west = nw_lon - (se_lon - nw_lon);
        south = nw_lat + (se_lat - nw_lat);
        east = nw_lon + (se_lon - nw_lon);
        north = nw_lat - (se_lat - nw_lat);
        
        % Download map data from the OpenStreetMap API
        osmAPI = "https://api.openstreetmap.org/api/0.6/map?bbox=";
        osmAPI = osmAPI + num2str(west) + "," + num2str(south) + "," + num2str(east) + "," + num2str(north);
        command = 'curl "' + osmAPI + '" > ' + directory_name + '/DatasetMapData.osm';
        system(command);
        disp('OpenStreetMap API download completed')
        
        osmFile = directory_name + '/DatasetMapData.osm';
        buildings = readgeotable(osmFile, layer="buildings");
        
        % Initialize the occupancy table:
        % column 1 -> latitude
        % column 2 -> longitude
        % column 3 -> building occupancy flag
        occupiedByBuilding = zeros((256 * 256), 3);
        occupiedByBuilding(:,1) = lat_lon_table(:,1);
        occupiedByBuilding(:,2) = lat_lon_table(:,2);
        
        % Mark grid points that fall inside building polygons
        for bldgIndex = 1 : height(buildings)
            bldg = buildings(bldgIndex, 1);
            points = geopointshape(lat_lon_table(:, 1), lat_lon_table(:, 2));
            pointsInBuilding = isinterior(bldg.Shape, points);
            occupiedByBuilding(:,3) = occupiedByBuilding(:,3) + pointsInBuilding;
        end
        
        % Convert the occupancy information into a 256 x 256 occupancy matrix
        occupancyMatrix = zeros(256, 256);
        
        for i = 1:256
            last = 256 * i;
            start = last - 255;
            row = transpose(occupiedByBuilding(start:last, 3));
            occupancyMatrix(i, :) = row;
        end
        
        % Collect all valid start positions located outside buildings
        validStarts = {};
        
        for x = 1:256
            for y = 1:256
                if occupancyMatrix(y, x) == 0
                    validStarts(end+1) = {[x, y]};
                end
            end
        end
        
        % Define the SE(2) state space and occupancy-based state validator
        state_space = stateSpaceSE2;
        state_validator = validatorOccupancyMap(state_space);
        occ_map = binaryOccupancyMap(occupancyMatrix);
        
        % Inflate obstacles slightly to provide a safety margin
        inflate(occ_map, 2);
        
        state_validator.Map = occ_map;
        maxNodeDistance = 1;
        maxNodesInPath = 50;

        % Configure state validation and state bounds
        state_validator.ValidationDistance = 4 + maxNodeDistance;
        state_space.StateBounds = [occ_map.XWorldLimits; occ_map.YWorldLimits; [-pi pi]];
        
        % Create the RRT planner
        planner = plannerRRT(state_space, state_validator, "MaxIterations", 2e4);
        planner.MaxConnectionDistance = maxNodeDistance;
        
        % Preallocate trajectory storage
        paths = cell(num_trajectories);
        
        i = 0;
        while i ~= num_trajectories
            i = i + 1;
            disp(i)

            traj_path = trajectory;

            % Randomly select a valid start point
            randStart = randi(length(validStarts));
            traj_path.Start = validStarts{randStart};

            % Find all valid end points that satisfy the trajectory constraints
            validEnds = {};
            for j = 1:width(validStarts)
                possibleEnd = validStarts{j};
                if traj_path.isValidEnd(possibleEnd(1), possibleEnd(2))
                    validEnds(end+1) = {possibleEnd};
                end
            end

            % Randomly select one valid end point
            randEnd = randi(length(validEnds));
            traj_path.End = validEnds{randEnd};
        
            start = [traj_path.Start(1,1), traj_path.Start(1,2), 0];
            goal = [traj_path.End(1,1), traj_path.End(1,2), 0];
        
            % Attempt to plan a path using RRT
            try
                [pthObj, solnInfo] = planner.plan(start, goal);
                disp("Original path length (before truncation): " + string(pthObj.NumStates));
            catch
                i = i - 1;
                continue;
            end
        
            % Retry if no valid path is found
            if height(pthObj.States) == 0
                disp("No path found: Reattempting")
                i = i - 1;
                continue;
            end
        
            shortenedPathLength = min(maxNodesInPath, pthObj.NumStates);
            pathLons = round(pthObj.States(:,1));
            pathLats = round(pthObj.States(:,2));
            
            shortenedPathLons = 1:shortenedPathLength;
            shortenedPathLats = 1:shortenedPathLength;
            
            % --- Fixed-step path sampling logic ---
            % This section samples up to 50 points from the planned path
            % using a random step size within a fixed maximum jump range.
            
            % Ensure the original path is long enough for fixed-step sampling
            if pthObj.NumStates < maxNodesInPath
                disp("Path found is too short for fixed-step sampling: Reattempting")
                i = i - 1;
                continue;
            end

            % Define the maximum allowed jump between sampled points
            max_jump = 10;
            
            pathEqualDistanceIndexes = zeros(1, maxNodesInPath);

            % Always use the first point of the original path as the first sampled point
            pathEqualDistanceIndexes(1) = 1;
            current_index = 1;

            % Select the remaining sampled points
            for node_idx = 2:maxNodesInPath
                % Randomly choose the step size
                jump = randi([1, max_jump]);
                
                % Compute the candidate index of the next sampled point
                next_index = current_index + jump;
                
                % Clamp the index to the end of the path if it exceeds the limit
                if next_index > pthObj.NumStates
                    next_index = pthObj.NumStates;
                end
                
                % Update the current position in the path
                current_index = next_index;
                pathEqualDistanceIndexes(node_idx) = current_index;
                
                % If the end of the path is reached, fill the rest with the final point
                if current_index == pthObj.NumStates
                    pathEqualDistanceIndexes(node_idx+1:end) = pthObj.NumStates;
                    break;
                end
            end
            
            % --- End of path sampling logic ---

            % Convert sampled grid indices back into geographic coordinates
            for node_num = 1:shortenedPathLength
                j = pathEqualDistanceIndexes(node_num);
                lat_idx = round(pathLats(j));
                lon_idx = round(pathLons(j));
                
                lat_idx = min(max(width(lat_range) - lat_idx, 1), width(lat_range));
                lon_idx = min(max(lon_idx, 1), length(lon_range));
            
                shortenedPathLats(node_num) = lat_range(lat_idx);
                shortenedPathLons(node_num) = lon_range(lon_idx);
            end
            
            % Store the sampled path as geographic points
            pathgeopoints = geopointshape(shortenedPathLats, shortenedPathLons);
            traj_path.Geopoints = pathgeopoints;
            paths(i) = {traj_path};
        end

        trajectories = paths;
        sys_path = pwd;

        % Save all generated trajectories to CSV files
        for i = 1 : length(trajectories)
            traj_path = trajectories{i};
            file_path = strcat(pwd,'\',directory_name, '\trajectory_', string(i), '.csv');
            writematrix(traj_path.getPath, file_path);
        end

        % Save the target region occupancy information
        file_path = strcat(pwd,'\',directory_name, '\target_region.csv');
        writematrix(occupiedByBuilding, file_path)

        toc
    end
end
