
startTime_env = datetime('now');

%% Target Region Computation
nw_lat = 33.2141;
nw_lon = -97.1443;
env_num = 1;

directory_name = 'dataset'+string(env_num);
% Check if the directory exists
if ~exist(directory_name, 'dir')
    % If the directory doesn't exist, create it
    mkdir(directory_name);
end

% Constants
R = 6371 * 1000; % Earth radius in meters
d = 256; % Distance in meters

% Calculate destination coordinates 256m away towards south and eastdelta_lat = (d / R) * (180 / pi);
delta_lat = (d / R) * (180 / pi);
delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);

se_lat = (nw_lat - delta_lat);
se_lon = (nw_lon + delta_lon);


% Diagonal Distance
nwLatRad = deg2rad(nw_lat);
nwLonRad = deg2rad(nw_lon);
seLatRad = deg2rad(se_lat);
seLonRad = deg2rad(se_lon);
deltaLat = seLatRad - nwLatRad;
deltaLon = seLonRad - nwLonRad;
a = sin(deltaLat/2)^2 + cos(nwLatRad) * cos(seLatRad) * sin(deltaLon/2)^2;
c = 2 * atan2(sqrt(a), sqrt(1-a));
diagonalDistance = R * c; % so that the coverage area radius can be big enough to cover all the coordinates
% diagonalDistance = 363.8;

% Generate grid of coordinates
lat_range = linspace(nw_lat, se_lat, 256);
lon_range = linspace(nw_lon, se_lon, 256);

[lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
lat_lon_table = [reshape(lat_mesh, 1, []) ; reshape(lon_mesh, 1, [])]';


west = nw_lon - (se_lon - nw_lon);
south = nw_lat + (se_lat - nw_lat);
east = nw_lon + (se_lon - nw_lon);
north = nw_lat - (se_lat - nw_lat);


%% Download Openstreet map OSM

osmAPI = "https://api.openstreetmap.org/api/0.6/map?bbox="; %add north lat, west long, south lat, east long
osmAPI = osmAPI + num2str(west) + "," + num2str(south) + "," + num2str(east) + "," + num2str(north);
command = 'curl "' + osmAPI + '" > test'+ string(env_num) +'.osm';
system(command);



%% Transmitter Settings and number of Maps required in settings
totalMaps = 100; % Number of Maps for 1 target region
clear size;
selected_indices = randperm(size(lat_lon_table, 1), totalMaps);
% selected_indices = 33112 : 33191;
selected_coordinates = lat_lon_table(selected_indices, :);
selected_latitudes = selected_coordinates(:, 1);
selected_longitudes = selected_coordinates(:, 2);
transmitterFreq = 5.9e9;
transmitterPower = 23;
antennaHeight = 5;
osmFile = 'test'+ string(env_num) +'.osm';
siteviewer("Buildings",osmFile, 'Visible', 'off');
tx_site_names = 1 : totalMaps;

tx = txsite("Name",num2str(tx_site_names),...
    "Latitude",selected_latitudes,...
    "Longitude",selected_longitudes,...
    "TransmitterFrequency", transmitterFreq,...
    "TransmitterPower", transmitterPower,...
    "AntennaHeight",antennaHeight);

% writematrix(selected_coordinates, fullfile(directory_name, 'transmitter_coordinates.xlsx'));

%% Antenna Setttings

size = [8 8];
angle = 180;
for tx_num = 1 : totalMaps
    lambda = physconst("lightspeed") / tx(tx_num).TransmitterFrequency;
    tx(tx_num).Antenna  = phased.URA('Size',size,...
        'Lattice','Rectangular','ArrayNormal','x');
    % The multiplication factor for lambda units to meter conversion
    tx(tx_num).Antenna .ElementSpacing = [0.5 0.5]*lambda/2;
    numRows = size(1);
    numCols = size(2);

    % Calculate Row taper
    rwind = ones(1,numRows).';
    % Calculate Column taper
    cwind = ones(1,numCols).';
    % Calculate taper
    taper = rwind*cwind.';
    tx(tx_num).Antenna .Taper = taper.';
    %
    % % % Create an sinc antenna element
    Elem = phased.SincAntennaElement;
    % Gaussian Antenna Element
    % Elem = phased.GaussianAntennaElement;
    Elem.FrequencyRange = [0 tx(tx_num).TransmitterFrequency];
    Elem.Beamwidth = [10 10];
    tx(tx_num).Antenna.Element = Elem;
    tx(tx_num).AntennaAngle = angle;
end


%% Building and Non Building Coordinates Computation
pm = propagationModel("raytracing","Method","image");
startTime = datetime('now');
[pd, isWithinBldg1, datalats1, datalons1] = coverage_test(tx(1),pm,'MaxRange',diagonalDistance, 'Resolution', 1);
endTime = datetime('now');

buildings_coord = [datalats1, datalons1];
% Calculate the elapsed time in seconds
elapsedTime = seconds(endTime - startTime);
disp(elapsedTime)

% Filtering Cooridnates based on target region
inBoundingBox = buildings_coord(:,1) <= nw_lat & buildings_coord(:,1) >= se_lat & buildings_coord(:,2) >= nw_lon & buildings_coord(:,2) <= se_lon;
filteredCoordinates = buildings_coord(inBoundingBox, :);


%% Setting up Transmitter and Receivers Site and computing signal strength across target region
receiver_lats = filteredCoordinates(:,1);
receiver_lons = filteredCoordinates(:,2);
totalMaps = 5;

site_table = table(receiver_lats, receiver_lons);
clear size;

selected_indices = randperm(size(site_table, 1), totalMaps);

selected_coordinates = site_table(selected_indices, :);
selected_coordinates.Properties.VariableNames = {'Latitude', 'Longitude'};
selected_latitudes = selected_coordinates{:, 1};
selected_longitudes = selected_coordinates{:, 2};

transmitterFreq = 5.9e9;
transmitterPower = 23;
antennaHeight = 5;
osmFile = 'test'+ string(env_num) +'.osm';
siteviewer("Buildings",osmFile, 'Visible', 'off');
tx_site_names = 1 : totalMaps;

tx = txsite("Name",num2str(tx_site_names),...
    "Latitude",selected_latitudes,...
    "Longitude",selected_longitudes,...
    "TransmitterFrequency", transmitterFreq,...
    "TransmitterPower", transmitterPower,...
    "AntennaHeight",antennaHeight);

writetable(selected_coordinates, fullfile(directory_name, 'transmitter_coordinates.xlsx'));
size = [8 8];
angle = 0;
for tx_num = 1 : totalMaps
    lambda = physconst("lightspeed") / tx(tx_num).TransmitterFrequency;
    tx(tx_num).Antenna  = phased.URA('Size',size,...
        'Lattice','Rectangular','ArrayNormal','x');
    % The multiplication factor for lambda units to meter conversion
    tx(tx_num).Antenna .ElementSpacing = [0.5 0.5]*lambda;
    numRows = size(1);
    numCols = size(2);

    % Calculate Row taper
    rwind = ones(1,numRows).';
    % Calculate Column taper
    cwind = ones(1,numCols).';
    % Calculate taper
    taper = rwind*cwind.';
    tx(tx_num).Antenna .Taper = taper.';
    %
    % % % Create an sinc antenna element
    % Elem = phased.SincAntennaElement;
    % Gaussian Antenna Element
    Elem = phased.GaussianAntennaElement;
    Elem.FrequencyRange = [0 tx(tx_num).TransmitterFrequency];
    Elem.Beamwidth = [10 10];
    tx(tx_num).Antenna.Element = Elem;
    tx(tx_num).AntennaAngle = angle;
end

rx = rxsite(Latitude=receiver_lats, ...
    Longitude=receiver_lons);
tic
for tx_num = 1 : (totalMaps)
    startTime = datetime('now');
    sigStre = sigstrength(rx, tx(tx_num), pm);

    T = table(receiver_lats, receiver_lons, sigStre');

    T.Properties.VariableNames = {'Latitude', 'Longitudes', 'Power'};

    writetable(T,fullfile(directory_name, (string(tx_num)+'.xlsx')));
    figure;
    scatter(T.Longitudes, T.Latitude, [], T.Power, 'filled');
    colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
    colorbar; % Display colorbar to show the mapping of power to colors
    saveas(figure, fullfile(directory_name, (string(tx_num)+'.png')))
    endTime = datetime('now');
    elapsedTime = seconds(endTime - startTime);
    disp(elapsedTime)
end
toc


%%
endTime_env = datetime('now');
elapsedTime_env = seconds(endTime_env - startTime_env);
disp("time taken by current env")
disp(elapsedTime_env)

