clear; clc;
startTime_all = datetime('now');

% === Set a unique env_base starting value for each machine ===
env_base = 1;  % ← Change this to the starting index for this machine, e.g., 0, 100, 200, 300, etc.

% === Read the target region coordinates ===
region_table = readtable('target_region_1.xlsx');  % Contains NW_lat and NW_lon columns
num_regions = height(region_table);

for i = 1:num_regions
    env_num = env_base + i - 1;
    startTime_env = datetime('now');

    % === Target region setup ===
    nw_lat = region_table.NW_lat(i);
    nw_lon = region_table.NW_lon(i);

    directory_name = 'dataset_' + string(env_num);
    if ~exist(directory_name, 'dir')
        mkdir(directory_name);
    end

    R = 6371 * 1000; % Earth radius in meters
    d = 256; % Region side length in meters
    delta_lat = (d / R) * (180 / pi);
    delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
    se_lat = nw_lat - delta_lat;
    se_lon = nw_lon + delta_lon;

    % Compute diagonal distance
    nwLatRad = deg2rad(nw_lat); nwLonRad = deg2rad(nw_lon);
    seLatRad = deg2rad(se_lat); seLonRad = deg2rad(se_lon);
    deltaLat = seLatRad - nwLatRad; deltaLon = seLonRad - nwLonRad;
    a = sin(deltaLat/2)^2 + cos(nwLatRad) * cos(seLatRad) * sin(deltaLon/2)^2;
    c = 2 * atan2(sqrt(a), sqrt(1-a));
    diagonalDistance = R * c;

    % Generate grid points
    lat_range = linspace(nw_lat, se_lat, 256);
    lon_range = linspace(nw_lon, se_lon, 256);
    [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
    lat_lon_table = [reshape(lat_mesh, 1, []); reshape(lon_mesh, 1, [])]';

    % Define OSM download boundary
    west = nw_lon - (se_lon - nw_lon);
    south = nw_lat + (se_lat - nw_lat);
    east = nw_lon + (se_lon - nw_lon);
    north = nw_lat - (se_lat - nw_lat);

    % Download OSM file
    osmAPI = "https://api.openstreetmap.org/api/0.6/map?bbox=" + ...
             num2str(west) + "," + num2str(south) + "," + num2str(east) + "," + num2str(north);
    osmFile = 'test' + string(env_num) + '.osm';
    command = 'curl "' + osmAPI + '" > ' + osmFile;
    system(command);

    % Initial transmitter for coverage_test
    totalMaps = 1;
    selected_idx = randperm(size(lat_lon_table, 1), totalMaps);
    tx_lat = lat_lon_table(selected_idx, 1);
    tx_lon = lat_lon_table(selected_idx, 2);
    transmitterFreq = 28e9;
    transmitterPower = 1;
    antennaHeight = 2;

    siteviewer("Buildings", osmFile, 'Visible', 'off');
    tx = txsite("Name", "TX", "Latitude", tx_lat, "Longitude", tx_lon, ...
                "TransmitterFrequency", transmitterFreq, ...
                "TransmitterPower", transmitterPower, ...
                "AntennaHeight", antennaHeight);

    % Configure directional antenna
    size_array = [8 8];
    lambda = physconst("lightspeed") / transmitterFreq;
    antenna = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
    antenna.ElementSpacing = [0.5 0.5] * lambda;
    elem = phased.GaussianAntennaElement;
    elem.FrequencyRange = [0 transmitterFreq];
    elem.Beamwidth = [20 10];
    antenna.Element = elem;
    tx.Antenna = antenna;
    tx.AntennaAngle = 180;

    % Get grid points using coverage_test
    pm = propagationModel("raytracing","Method","sbr","MaxNumReflections",0,"MaxNumDiffractions",0);
    [~, ~, datalats1, datalons1] = coverage_test(tx, pm, 'MaxRange', diagonalDistance, 'Resolution', 1);
    buildings_coord = [datalats1, datalons1];
    inBox = buildings_coord(:,1) <= nw_lat & buildings_coord(:,1) >= se_lat & ...
            buildings_coord(:,2) >= nw_lon & buildings_coord(:,2) <= se_lon;
    filteredCoordinates = buildings_coord(inBox, :);

    % Randomly select transmitter locations
    receiver_lats = filteredCoordinates(:,1);
    receiver_lons = filteredCoordinates(:,2);
    totalMaps = 135;
    site_table = table(receiver_lats, receiver_lons);
    selected_idx = randperm(size(site_table, 1), totalMaps);
    selected_coords = site_table(selected_idx, :);
    writetable(selected_coords, fullfile(directory_name, 'transmitter_coordinates.xlsx'));

    % Set up multiple transmitters
    tx = txsite("Name", string(1:totalMaps), ...
        "Latitude", selected_coords.receiver_lats, ...
        "Longitude", selected_coords.receiver_lons, ...
        "TransmitterFrequency", transmitterFreq, ...
        "TransmitterPower", 1, ...
        "AntennaHeight", antennaHeight);

    for t = 1:totalMaps
        lambda = physconst("lightspeed") / tx(t).TransmitterFrequency;
        array = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
        array.ElementSpacing = [0.5 0.5] * lambda;
        % rwind = ones(1, size_array(1)).'; cwind = ones(1, size_array(2)).';
        % taper = rwind * cwind.';
        % array.Taper = taper.';
        elem = phased.GaussianAntennaElement;
        elem.FrequencyRange = [0 tx(t).TransmitterFrequency];
        elem.Beamwidth = [20 10];
        array.Element = elem;
        tx(t).Antenna = array;
        tx(t).AntennaAngle = rand() * 360;
    end

    rx = rxsite("Latitude", receiver_lats, "Longitude", receiver_lons,"ReceiverSensitivity",-100, "AntennaHeight", 2);
    pm = propagationModel("raytracing", "Method", "sbr", "MaxNumReflections", 1, "MaxNumDiffractions", 0);

    for t = 1:totalMaps
        sigStre = sigstrength(rx, tx(t), pm);
        T = table(receiver_lats, receiver_lons, sigStre', 'VariableNames', {'Latitude', 'Longitude', 'Power'});
        writetable(T, fullfile(directory_name, string(t) + ".xlsx"));
    end

    elapsedTime_env = seconds(datetime('now') - startTime_env);
    disp("Time for env " + string(env_num) + ": " + string(elapsedTime_env) + " seconds");
end

elapsedTime_all = seconds(datetime('now') - startTime_all);
disp("Total time: " + string(elapsedTime_all) + " seconds");
