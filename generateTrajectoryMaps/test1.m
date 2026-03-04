
% Define the initial northwest (NW) latitude and longitude
nw_lat = 29.83387; % Enter initial latitude coordinate
nw_lon = -95.4289; % Enter initial longitude coordinate
% Number of target regions to create
num_regions = 10;
%number of trajectories to generate
num_trajectories = 50;
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
        tic
        env_num = env_num + 1 + 0;
        disp(env_num)
        directory_name = 'dataset_'+string(env_num);
        % Check if the directory exists
        if ~exist(directory_name, 'dir')
            % If the directory doesn't exist, create it
            mkdir(directory_name);
        end
        
        nw_lat = nw_lat_list(k);
        nw_lon = nw_lon_list(l);
        
        % Constants
        R = 6371 * 1000; % Earth radius in meters
        d = 256; % Distance in meters
        
        % Calculate destination coordinates 256m away towards south and east
        delta_lat = (d / R) * (180 / pi);
        delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
        
        se_lat = nw_lat - delta_lat;
        se_lon = nw_lon + delta_lon;
        
        % Diagonal Distance
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
        
        osmAPI = "https://api.openstreetmap.org/api/0.6/map?bbox=";
        osmAPI = osmAPI + num2str(west) + "," + num2str(south) + "," + num2str(east) + "," + num2str(north);
        command = 'curl "' + osmAPI + '" > ' + directory_name + '/DatasetMapData.osm';
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
        
        state_space = stateSpaceSE2;
        state_validator = validatorOccupancyMap(state_space);
        occ_map = binaryOccupancyMap(occupancyMatrix);
        
        inflate(occ_map, 2);
        
        state_validator.Map = occ_map;
        maxNodeDistance = 1;
        maxNodesInPath = 50;
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
            traj_path = trajectory;
            randStart = randi(length(validStarts));
            traj_path.Start = validStarts{randStart};
            validEnds = {};
            for j = 1:width(validStarts)
                possibleEnd = validStarts{j};
                if traj_path.isValidEnd(possibleEnd(1), possibleEnd(2))
                    validEnds(end+1) = {possibleEnd};
                end
            end
            randEnd = randi(length(validEnds));
            traj_path.End = validEnds{randEnd};
        
            start = [traj_path.Start(1,1), traj_path.Start(1,2), 0];
            goal = [traj_path.End(1,1), traj_path.End(1,2), 0];
        
            try
                [pthObj,solnInfo] = planner.plan(start,goal);
                disp("Original path length (before truncation): " + string(pthObj.NumStates));
            catch
                i = i - 1;
                continue;
            end
        
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
            
            % --- 开始最终版采样逻辑 (固定步进范围) ---
            
            % 检查原始路径是否至少有50个点
            if pthObj.NumStates < maxNodesInPath
                disp("Path found is too short for fixed-step sampling: Reattempting")
                i = i - 1;
                continue;
            end

            % 定义你的最大间隔阈值
            max_jump = 10;
            
            pathEqualDistanceIndexes = zeros(1, maxNodesInPath);

            % 第一个点固定为原始路径的起点
            pathEqualDistanceIndexes(1) = 1;
            current_index = 1;

            % 循环选择剩下的49个点
            for node_idx = 2:maxNodesInPath
                % 计算随机步长
                jump = randi([1, max_jump]);
                
                % 计算下一个点的目标索引
                next_index = current_index + jump;
                
                % 安全检查：如果下一个点超出路径终点，则将其固定为终点
                if next_index > pthObj.NumStates
                    next_index = pthObj.NumStates;
                end
                
                % 更新当前索引
                current_index = next_index;
                pathEqualDistanceIndexes(node_idx) = current_index;
                
                % 如果已经到达终点，则后续所有点都设为终点，并提前结束循环
                if current_index == pthObj.NumStates
                    pathEqualDistanceIndexes(node_idx+1:end) = pthObj.NumStates;
                    break;
                end
            end
            
            % --- 采样逻辑结束 ---

            for node_num = 1:shortenedPathLength
                j = pathEqualDistanceIndexes(node_num);
                lat_idx = round(pathLats(j));
                lon_idx = round(pathLons(j));
                
                lat_idx = min(max(width(lat_range) - lat_idx, 1), width(lat_range));
                lon_idx = min(max(lon_idx, 1), length(lon_range));
            
                shortenedPathLats(node_num) = lat_range(lat_idx);
                shortenedPathLons(node_num) = lon_range(lon_idx);
            end
            
            pathgeopoints = geopointshape(shortenedPathLats, shortenedPathLons);
            traj_path.Geopoints = pathgeopoints;
            paths(i) = {traj_path};
        
        end
        trajectories = paths;
        sys_path = pwd;
        for i = 1 : length(trajectories)
            traj_path = trajectories{i};
            file_path= strcat(pwd,'\',directory_name, '\trajectory_', string(i), '.csv');
            writematrix(traj_path.getPath, file_path);
        end
        file_path= strcat(pwd,'\',directory_name, '\target_region.csv');
        writematrix(occupiedByBuilding, file_path)
        toc
    end
end
