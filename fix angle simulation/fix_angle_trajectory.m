% Define the initial northwest (NW) latitude and longitude
% Define the initial northwest (NW) latitude and longitude
nw_lat = 32.92556; % Enter initial latitude coordinate
nw_lon = -97.2696; % Enter initial longitude coordinate
% Number of target 
% Number of target regions to create
num_regions = 5;

%number of trajectories to generate
num_trajectories = 25;
generateTargetandAngles = true;

% Distance between regions in meters (non-overlapping)
d = 260; % Distance in meters (equivalent to 256m x 256m square region)

% Earth radius in meters
R = 6371 * 1000;

% Initialize arrays to store the NW coordinates for each target region
nw_lat_list = zeros(1, num_regions);
nw_lon_list = zeros(1, num_regions);

% Set the first region's NW coordinates
nw_lat_list(1) = nw_lat;
nw_lon_list(1) = nw_lon;

% Calculate delta for 256 meters in latitude and longitude
delta_lat = (d / R) * (180 / pi);
delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);

% Generate the remaining non-overlapping NW coordinates for each region
for i = 2:num_regions
    % Move 256 meters south and east to get the next NW coordinate
    nw_lat_list(i) = nw_lat_list(i-1) - delta_lat;
    nw_lon_list(i) = nw_lon_list(i-1) + delta_lon;
end

env_num = 0;    
% 
for k = 1 : length(nw_lat_list)
    for l = 1 : length(nw_lon_list)
% for k = 1 : 1
%     for l = 1 : 2


        tic
        env_num = env_num + 1 + 0;
        disp(env_num)
        directory_name = 'dataset'+string(env_num);
        % Check if the directory exists
        if ~exist(directory_name, 'dir')
            % If the directory doesn't exist, create it
            mkdir(directory_name);
        end

        % nw_lat = 29.83387; %  Enter initial latitude coordinate;
        % nw_lon = -95.4289;%  Enter initial longitude coordinate;
        nw_lat = nw_lat_list(k);
        nw_lon = nw_lon_list(l);
        %num_trajectories = 100;
        
        
        % Constants
        R = 6371 * 1000; % Earth radius in meters
        d = 256; % Distance in meters
        
        % Calculate destination coordinates 256m away towards south and eastdelta_lat = (d / R) * (180 / pi);
        delta_lat = (d / R) * (180 / pi);
        delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
        
        se_lat = nw_lat - delta_lat;
        se_lon = nw_lon + delta_lon;
        
        % Diagonal Distance
        nwLatRad = deg2rad(nw_lat);
        nwLonRad = deg2rad(nw_lon);
        seLatRad = deg2rad(se_lat);
        seLonRad = deg2rad(se_lon);
        deltaLat = seLatRad - nwLatRad;
        deltaLon = seLonRad - nwLonRad;
        a = sin(deltaLat/2)^2 + cos(nwLatRad) * cos(seLatRad) * sin(deltaLon/2)^2;
        c = 2 * atan2(sqrt(a), sqrt(1-a));
        % diagonalDistance = R * c; % so that the coverage area radius can be big enough to cover all the coordinates
        diagonalDistance = 364.3;
        
        % Generate grid of coordinates
        lat_range = linspace(nw_lat, se_lat, 256);
        lon_range = linspace(nw_lon, se_lon, 256);
        
        [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
        lat_lon_table = [reshape(lat_mesh, 1, []) ; reshape(lon_mesh, 1, [])]';
        
        
        west = nw_lon - (se_lon - nw_lon);
        south = nw_lat + (se_lat - nw_lat);
        east = nw_lon + (se_lon - nw_lon);
        north = nw_lat - (se_lat - nw_lat);
        
        osmAPI = "https://api.openstreetmap.org/api/0.6/map?bbox="; %add north lat, west long, south lat, east long
        osmAPI = osmAPI + num2str(west) + "," + num2str(south) + "," + num2str(east) + "," + num2str(north);
        command = 'wget "' + osmAPI + '" -O ' + directory_name + '/DatasetMapData.osm';
        system(command);

        disp('openstretmap api computation done')
        
        osmFile = directory_name + '/DatasetMapData.osm';
        buildings = readgeotable(osmFile, layer="buildings");
        
        occupiedByBuilding = zeros((256 * 256), 3);
        occupiedByBuilding(:,1) = lat_lon_table(:,1);
        occupiedByBuilding(:,2) = lat_lon_table(:,2);
        
        for bldgIndex = 1 : height(buildings)
            bldg = buildings(bldgIndex, 1);
            points = geopointshape(lat_lon_table(:, 1), lat_lon_table(:, 2));
            pointsInBuilding = isinterior(bldg.Shape, points);
            occupiedByBuilding(:,3) = occupiedByBuilding(:,3) + pointsInBuilding;
        end
        
        occupancyMatrix = zeros(256, 256);
        
        for i = 1:256
            last = 256 * i;
            start = last - 255;
            row = transpose(occupiedByBuilding(start:last, 3));
            occupancyMatrix(i, :) = row;
        end
        
        validStarts = {};
        
        for x = 1:256
            for y = 1:256
                if occupancyMatrix(y, x) == 0
                    validStarts(end+1) = {[x, y]};
                end
            end
        end
        

        %For Testing Only REMOVE THIS
        validStartsLats = 1:width(validStarts);
        validStartsLons = 1:width(validStarts);

        for i = 1:width(validStarts)
            validStartsLats(i) = validStarts{i}(2);
            validStartsLons(i) = validStarts{i}(1);
        end

        for i = 1:width(validStarts)
            validStartsLons(i) = lon_range(validStartsLons(i));
            validStartsLats(i) = lat_range(validStartsLats(i));
        end

        validStartsPoints = geopointshape(validStartsLats, validStartsLons);
        geoplot(validStartsPoints);
        
        %end of testing REMOVE ABOVE

        state_space = stateSpaceSE2;
        state_validator = validatorOccupancyMap(state_space);
        occ_map = binaryOccupancyMap(occupancyMatrix);
        
        inflate(occ_map, 2);
        
        state_validator.Map = occ_map;
        maxNodeDistance = 1;
        maxNodesInPath = 100;

        %settings
        state_validator.ValidationDistance = 4 + maxNodeDistance;
        state_space.StateBounds = [occ_map.XWorldLimits;occ_map.YWorldLimits; [-pi pi]];
        
        %create planner
        
        planner = plannerRRT(state_space,state_validator, "MaxIterations", 2e4);
        planner.MaxConnectionDistance = maxNodeDistance;
        
        paths = cell(num_trajectories);
        
        i = 0;
        while i ~= num_trajectories
            i = i + 1;
            disp(i)
            traj_path = trajectory();
            randStart = randi(width(validStarts));
            %set start and end positions
            traj_path.Start = validStarts{randStart};
            validEnds = {};
            for j = 1:width(validStarts)
                possibleEnd = validStarts{j};
                if traj_path.isValidEnd(possibleEnd(1), possibleEnd(2))
                    validEnds(end+1) = {possibleEnd};
                end
            end

            %{
            %For Testing Only REMOVE THIS
            validEndLats = 1:width(validEnds);
            validEndLons = 1:width(validEnds);

            for i = 1:width(validEnds)
                validEndLats(i) = validEnds{i}(2);
                validEndLons(i) = validEnds{i}(1);
            end

            for i = 1:width(validEnds)
                validEndLons(i) = lon_range(validEndLons(i));
                validEndLats(i) = lat_range(validEndLats(i));
            end

            validEndPoints = geopointshape(validEndLats, validEndLons);
            %geoplot(validEndPoints);
            %}
            %end of testing REMOVE ABOVE

            randEnd = randi(size(validEnds));
            traj_path.End = validEnds{randEnd};
        
            start = [traj_path.Start(1,1), traj_path.Start(1,2), 0];
            goal = [traj_path.End(1,1), traj_path.End(1,2), 0];
        
        
            try
                [pthObj,solnInfo] = planner.plan(start,goal);
            catch
                i = i - 1;
                continue;
            end
        
            if height(pthObj.States) == 0
                disp("No path found: Reattempting")
                i = i - 1;
                continue;
            end
        
            %convert path to geolocical cordinates
            
            %{
            pathLons = (pthObj.States(:,1) / 256) * (se_lon - nw_lon) + nw_lon;
            pathLats = (pthObj.States(:,2) / 256) * (nw_lat - se_lat) + se_lat;
            %}

            shortenedPathLength = min(maxNodesInPath, pthObj.NumStates);

            pathLons = round(pthObj.States(:,1));
            pathLats = round(pthObj.States(:,2));
            
            shortenedPathLons = 1:shortenedPathLength;
            shortenedPathLats = 1:shortenedPathLength;
            
            % Round and discretize the coordinates
            roundedStates = round(pthObj.States(:,1:2));  % [x, y]
            
            % Remove duplicate grid points
            [uniquePoints, ~, ~] = unique(roundedStates, 'rows', 'stable');
            
            % Check for sufficient unique points
            if size(uniquePoints, 1) < 100
                disp("Fewer than 100 unique points after deduplication. Skipping...");
                i = i - 1;
                continue;
            end
            
            % Randomly select 100 unique path points
            randIndexes = randperm(size(uniquePoints, 1), 100);
            selectedPoints = uniquePoints(randIndexes, :);  % [x, y]
            
            % Initialize arrays for lat/lon
            shortenedPathLons = zeros(1, 100);
            shortenedPathLats = zeros(1, 100);
            
            for node_num = 1:100
                nodeX = selectedPoints(node_num, 1);
                nodeY = selectedPoints(node_num, 2);
            
                % Convert to lat/lon
                nodeX = clip(nodeX, 1, length(lon_range));
                nodeY = clip(nodeY, 1, length(lat_range));
                shortenedPathLons(node_num) = lon_range(nodeX);
                shortenedPathLats(node_num) = lat_range(length(lat_range) - nodeY + 1);
            end
            
            % ------------------------ ANGLE + TARGET SECTION ------------------------
            if generateTargetandAngles
                % Find a valid target not overlapping with any selected path point
                validTargetFound = false;
                while ~validTargetFound
                    validTargetFound = true;
                    possibleTarget = validStarts{randi(width(validStarts))};
            
                    for nodeIndex = 1:100
                        if possibleTarget(1) == selectedPoints(nodeIndex, 1) && ...
                           possibleTarget(2) == selectedPoints(nodeIndex, 2)
                            validTargetFound = false;
                            break;
                        end
                    end
                end
            
                % Prepare the target and angle data
                targetCordsAndAngles = zeros(1, 102);
                targetCordsAndAngles(1) = lat_range(possibleTarget(2));
                targetCordsAndAngles(2) = lon_range(possibleTarget(1));
            
                for node_num = 1:100
                    nodeX = selectedPoints(node_num, 1);
                    nodeY = selectedPoints(node_num, 2);
                    deltaX = possibleTarget(1) - nodeX;
                    deltaY = -(possibleTarget(2) - nodeY);  % flip y
            
                    if deltaX == 0
                        angle = (deltaY > 0) * 90 + (deltaY < 0) * 270;
                    elseif deltaX > 0 && deltaY > 0
                        angle = atand(deltaY / deltaX);
                    elseif deltaX < 0 && deltaY < 0
                        angle = 180 + atand(deltaY / deltaX);
                    elseif deltaX < 0
                        angle = 180 - abs(atand(deltaY / deltaX));
                    else
                        angle = 360 - abs(atand(deltaY / deltaX));
                    end
            
                    targetCordsAndAngles(node_num + 2) = angle;
                end
            
                % Save the angles and target
                file_path = strcat(pwd,'/',directory_name, '/trajectory_', string(i), '_targetAndAngles.csv');                
                writematrix(targetCordsAndAngles, file_path);
            end
            
            % --------------------- Save trajectory path -----------------------
            pathgeopoints = geopointshape(shortenedPathLats, shortenedPathLons);
            traj_path.Geopoints = pathgeopoints;
            paths(i) = {traj_path};


            %{
            for j = 1:100
                shortenedPathLons(j) = pathLons(j * min(height(pathLons) - 1, floor(height(pathLons) / 100)));
                shortenedPathLats(j) = pathLats(j * min(height(pathLats) - 1, floor(height(pathLats) / 100)));
            end
            %}

            pathgeopoints = geopointshape(shortenedPathLats, shortenedPathLons);
            traj_path.Geopoints = pathgeopoints;
            paths(i) = {traj_path};
        
            %geoplot(traj_path.Geopoints)

        end
        trajectories = paths;
        sys_path = pwd;
        for i = 1 : size(trajectories)
            traj_path = trajectories{i};
            % file_path = strcat(sys_path, '\sample_trajectories\'trajectory_', string(i), '.csv');
            file_path= strcat(pwd,'/',directory_name, '/trajectory_', string(i), '.csv');
            % writematrix(path.getPath, fullfile(directory_name, 'trajectory_', string(i), '.csv'));
            writematrix(traj_path.getPath, file_path);
        end
        % file_path = strcat(pwd,'\sample_trajectories\target_region.csv');
        % writematrix(occupiedByBuilding, file_path)
        file_path= strcat(pwd,'/',directory_name, '/target_region.csv');
        % writematrix(selected_coordinates, file_path);
        writematrix(occupiedByBuilding, file_path)
        toc
    end
end

function y = clip(x, minVal, maxVal)
    y = min(max(x, minVal), maxVal);
end
