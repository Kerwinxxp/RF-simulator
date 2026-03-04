num_datasets = 1;
num_trajectories = 1;

for i = 1:num_datasets
    for j = 1:num_trajectories

        dataset_dir = "dataset" + num2str(i);
        data_dir = dataset_dir + "/SignalMapData";
        trajectory_dir = "/trajectory_maps_" + num2str(j);
        trajectory_i = readmatrix(dataset_dir + "/trajectory_" + num2str(j) + ".csv");
        map_dir = data_dir + trajectory_dir + "/mapPNGs";

        if ~exist(map_dir, 'dir')
            % If the directory doesn't exist, create it
            mkdir(map_dir);
        end

        %num_maps = height(trajectory_i);

        for k = 1:num_maps

            data = readtable(data_dir + trajectory_dir + "/" + num2str(k) + ".xlsx")

            % Create a figure
            myFigure = figure;

            % Set the desired pixel resolution
            desiredWidth = 256;
            desiredHeight = 256;

            % Calculate the aspect ratio of the figure
            aspectRatio = desiredWidth / desiredHeight;

            % Set the figure size based on the desired resolution and aspect ratio
            figPosition = get(myFigure, 'Position');
            figPosition(3) = aspectRatio * figPosition(4);
            set(myFigure, 'Position', figPosition);

            scatter(data.Longitude, data.Latitude, [], data.Power, 'filled');
            colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
            colorbar; % Display colorbar to show the mapping of power to colors

            % Save the figure as a PNG file with the desired resolution
            set(myFigure, 'PaperPositionMode', 'auto'); % Ensure no cropping

            outputFileName = map_dir + "/transmitter_" + num2str(k) + ".png";
            print(myFigure, outputFileName, '-dpng', '-r0'); % '-r0' specifies using screen resolution
        end
    end
end