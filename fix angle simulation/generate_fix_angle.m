% MATLAB Script for Signal Map Generation with Updated Parameters

% Iterate through all dataset folders
num_datasets = 25;
num_trajectories = 25;

for dataset = 1:num_datasets
    home_dir = "dataset" + num2str(dataset);
    osmFile = home_dir + "/DatasetMapData.osm";
    region = readmatrix(home_dir + "/target_region.csv");
    output_dir = home_dir + "/SignalMapData";
    
    % Create the output folder if it does not already exist
    if ~exist(output_dir, 'dir')
        mkdir(output_dir);
    end
    
    % Exclude points that fall inside buildings from the target region
    isWithinBuildingIndex = logical(region(:,3));
    region(isWithinBuildingIndex, :) = [];
    
    % Load building data for the site viewer (kept invisible during processing)
    siteviewer("Buildings", osmFile, 'Visible', 'off');

    % Process each trajectory in the current dataset
    for i_trajectory = 1:num_trajectories
        trajectory_maps_dir = output_dir + "/trajectory_maps_" + num2str(i_trajectory);
        
        % Create the trajectory-specific output folder if needed
        if ~exist(trajectory_maps_dir, 'dir')
            mkdir(trajectory_maps_dir);
        end
        
        % Load trajectory coordinates
        traj = readmatrix(home_dir + "/trajectory_" + num2str(i_trajectory) + ".csv");
        selected_latitudes = traj(:,1);
        selected_longitudes = traj(:,2);
        totalMaps = length(selected_latitudes);
        
        %% === Transmitter Configuration ===
        % These transmitter parameters are aligned with those used in the first script.
        
        transmitterFreq = 28e9;         % Carrier frequency in Hz
        transmitterPower = 1;           % Transmit power in Watts
        antennaHeight = 2;              % Antenna height in meters
        
        trajTargetAndAngles = readmatrix(home_dir + "/trajectory_" + num2str(i_trajectory) + "_targetAndAngles.csv");
        
        % Randomly choose a beamwidth within the specified range
        beamAngleMin = 6;
        beamAngleMax = 20;
        beamAngle = randi([beamAngleMin, beamAngleMax]);

        % Save the beamwidth used for the current trajectory to a CSV file
        beam_csv_file = fullfile(trajectory_maps_dir, "beamwidth.csv");
        writematrix(beamAngle, beam_csv_file);

        % Create one transmitter site for each trajectory point
        tx_names = "Tx" + (1:totalMaps);
        tx = txsite("Name", tx_names, ...
            "Latitude", selected_latitudes, ...
            "Longitude", selected_longitudes, ...
            "TransmitterFrequency", transmitterFreq, ...
            "TransmitterPower", transmitterPower, ...
            "AntennaHeight", antennaHeight);
            
        % Define the antenna array size
        size_array = [8 8];
        
        % Configure the antenna for each transmitter
        for tx_num = 1:totalMaps
            lambda = physconst("lightspeed") / tx(tx_num).TransmitterFrequency;
            
            % Create a Uniform Rectangular Array (URA)
            array = phased.URA('Size', size_array, ...
                               'Lattice', 'Rectangular', ...
                               'ArrayNormal', 'x');
            array.ElementSpacing = [0.5 0.5] * lambda;
            
            % Define the antenna element model
            elem = phased.GaussianAntennaElement;
            elem.FrequencyRange = [0 tx(tx_num).TransmitterFrequency];
            elem.Beamwidth = [beamAngle beamAngle];

            % Assign the antenna element to the array,
            % then attach the array to the transmitter
            array.Element = elem;
            tx(tx_num).Antenna = array;
            
            % Set the antenna orientation using the precomputed angle data
            % (angle values start from the 3rd row in the CSV file)
            tx(tx_num).AntennaAngle = trajTargetAndAngles(tx_num + 2);
        end
        
        %% === Receiver Grid and Signal Map Computation ===
        % Configure receiver sites over the filtered region.
        % Receiver sensitivity and antenna height are matched to the first script.
        rx = rxsite("Latitude", region(:,1), ...
                    "Longitude", region(:,2), ...
                    "ReceiverSensitivity", -100, ...
                    "AntennaHeight", 2);
                    
        %% === Compute Signal Strength for Each Transmitter ===
        % Use the same ray-tracing propagation model as in the first script.
        pm = propagationModel("raytracing", ...
                              "Method", "sbr", ...
                              "MaxNumReflections", 1, ...
                              "MaxNumDiffractions", 0);
        
        for tx_num = 1:totalMaps
            fprintf("Computing signal map %d of %d for trajectory %d...\n", ...
                    tx_num, totalMaps, i_trajectory);
            startTime = datetime('now');
            
            % Compute received signal strength over the receiver grid
            sigStre = sigstrength(rx, tx(tx_num), pm);
            
            % Store latitude, longitude, and signal power in a table
            T = table(region(:,1), region(:,2), sigStre', ...
                'VariableNames', {'Latitude', 'Longitude', 'Power'});
            
            % Save the signal map to an Excel file
            writetable(T, fullfile(trajectory_maps_dir, string(tx_num) + '.xlsx'));
            
            % Display the runtime for the current signal map computation
            elapsedTime = seconds(datetime('now') - startTime);
            disp(['Elapsed: ', num2str(elapsedTime), ' seconds']);
        end
    end
end

disp("All trajectories processed.");
