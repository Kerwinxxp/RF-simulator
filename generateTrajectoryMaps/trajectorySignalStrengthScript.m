% MATLAB Script for Signal Map Generation with Updated Parameters

% Loop through each dataset directory
num_datasets = 1;
num_trajectories = 50;
for dataset = 1:num_datasets
    home_dir = "dataset_" + num2str(dataset);
    osmFile = home_dir + "/DatasetMapData.osm";
    region = readmatrix(home_dir + "/target_region.csv");
    output_dir = home_dir + "/SignalMapData";
    
    % Create the output directory if it doesn't exist
    if ~exist(output_dir, 'dir')
        mkdir(output_dir);
    end
    
    % Remove building coordinates from the region data
    isWithinBuildingIndex = logical(region(:,3));
    region(isWithinBuildingIndex, :) = [];
    
    % Loop through each trajectory
    for i_trajectory = 1:num_trajectories
        trajectory_maps_dir = output_dir + "/trajectory_maps_" + num2str(i_trajectory);
        
        % Create the trajectory-specific directory if it doesn't exist
        if ~exist(trajectory_maps_dir, 'dir')
            mkdir(trajectory_maps_dir);
        end
        
        % Read trajectory data
        traj = readmatrix(home_dir + "/trajectory_" + num2str(i_trajectory) + ".csv");
        selected_latitudes = traj(:,1);
        selected_longitudes = traj(:,2);
        totalMaps = length(selected_latitudes);
        
        %% === Transmitter Configuration (MODIFIED) ===
        % The following parameters are now identical to your first script.
        
        transmitterFreq = 28e9;         % MODIFIED: Was 5.9e9
        transmitterPower = 1;           % MODIFIED: Was 23 (dBm), now in Watts
        antennaHeight = 2;              % MODIFIED: Was 5
        
        siteviewer("Buildings", osmFile, 'Visible', 'off');
        
        tx_names = "Tx" + (1:totalMaps);
        tx = txsite("Name", tx_names, ...
            "Latitude", selected_latitudes, ...
            "Longitude", selected_longitudes, ...
            "TransmitterFrequency", transmitterFreq, ...
            "TransmitterPower", transmitterPower, ...
            "AntennaHeight", antennaHeight);
            
        size_array = [8 8]; % Using 'size_array' for clarity, same as [8 8]
        
        % Configure antenna for each transmitter
        for tx_num = 1:totalMaps
            lambda = physconst("lightspeed") / tx(tx_num).TransmitterFrequency;
            
            % Create a Uniform Rectangular Array (URA)
            array = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
            array.ElementSpacing = [0.5 0.5] * lambda;
            
            % Define the antenna element
            elem = phased.GaussianAntennaElement;
            elem.FrequencyRange = [0 tx(tx_num).TransmitterFrequency];
            elem.Beamwidth = [20 10]; % MODIFIED: Was [10 10]
            
            % Assign the element to the array and the array to the transmitter
            array.Element = elem;
            tx(tx_num).Antenna = array;
            
            % Assign a random antenna angle
            tx(tx_num).AntennaAngle = rand() * 360;
        end
        
        %% === Receiver Grid and Signal Map Computation (MODIFIED) ===
        % Added ReceiverSensitivity and AntennaHeight to match the first script.
        rx = rxsite("Latitude", region(:,1), ...
                    "Longitude", region(:,2), ...
                    "ReceiverSensitivity", -100, ... % ADDED
                    "AntennaHeight", 2);             % ADDED
                    
        %% === Compute Signal Strength for Each Transmitter ===
        % Propagation model is the same as in the first script.
        pm = propagationModel("raytracing", "Method", "sbr", "MaxNumReflections", 1, "MaxNumDiffractions", 0);
        
        for tx_num = 1:totalMaps
            fprintf("Computing signal map %d of %d for trajectory %d...\n", tx_num, totalMaps, i_trajectory);
            startTime = datetime('now');
            
            % Calculate signal strength
            sigStre = sigstrength(rx, tx(tx_num), pm);
            
            % Create and save the results table
            T = table(region(:,1), region(:,2), sigStre', ...
                'VariableNames', {'Latitude', 'Longitude', 'Power'});
            writetable(T, fullfile(trajectory_maps_dir, string(tx_num) + '.xlsx'));
            
            elapsedTime = seconds(datetime('now') - startTime);
            disp(['Elapsed: ', num2str(elapsedTime), ' seconds']);
        end
    end
end

disp("All trajectories processed.");
