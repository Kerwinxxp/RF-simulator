%% static_trans - Generate per-transmitter signal-strength datasets for static RF simulation
% Batch-generate 256 m x 256 m signal-strength maps for a list of
% geographic regions using MATLAB ray tracing over OpenStreetMap building
% geometry.
%
% For each region, the script samples a grid of non-building receiver
% positions, places a configurable number of randomly located
% transmitters (each with an 8x8 directional URA at 28 GHz), computes the
% received signal strength at every receiver, and writes one Excel file
% per transmitter.
%
% This file is a documented, section-by-section version of
% |static_trans.m|. It can be run end-to-end with F5, section-by-section
% with Ctrl+Enter, or rendered to HTML with |publish('static_trans_doc.m')|.

%% Syntax
%
%    static_trans_doc
%
% Edit the |env_base| value and the |target_region_1.xlsx| file before
% running; there are no input arguments and no return values.
%
% On completion, the script creates one folder per region named
% |dataset_<env_num>| in the current directory, and prints per-region
% and total elapsed time to the command window.

%% Description
% |static_trans_doc| performs the following steps for each region row
% read from |target_region_1.xlsx|:
%
% # Compute the region bounding box from its north-west corner and a fixed
%   256 m side length, along with the NW-to-SE diagonal distance used
%   later as the ray-tracing range.
% # Download OpenStreetMap (OSM) building geometry for a bounding box
%   slightly larger than the region, saved to |test<env_num>.osm|.
% # Load the OSM file into a hidden |siteviewer| so subsequent ray
%   tracing accounts for building obstructions.
% # Place a single probe transmitter at a random grid cell and call
%   |coverage_test| to discover which lat/lon grid samples correspond to
%   non-building (valid) locations.
% # Randomly select 135 transmitter sites from the valid locations and
%   save their coordinates to |transmitter_coordinates.xlsx|.
% # Configure each transmitter with an 8x8 uniform rectangular array
%   (|phased.URA|) whose element is a |phased.GaussianAntennaElement|
%   with [20 10] deg beamwidth and a random orientation in [0, 360) deg.
% # For every transmitter, compute |sigstrength| at all valid receiver
%   positions using a 1-reflection SBR ray-tracing propagation model, and
%   write a |<t>.xlsx| table with columns |Latitude|, |Longitude|,
%   |Power| (dBm).
%
% Ray tracing is the dominant runtime cost: a single region with 135
% transmitters and a few thousand receivers typically takes several
% minutes on a modern CPU. Runtime scales linearly with the number of
% regions.

%% Examples
% The three sections below are independent, runnable illustrations.
% Each clears prior workspace state and runs to completion on its own.

%% Example 1: Run the Full Pipeline for Every Row in |target_region_1.xlsx|
% This is the normal usage pattern. It reproduces the original
% |static_trans.m| behavior.
%
% Make sure the current folder contains |target_region_1.xlsx| (a two-
% column table with headers |NW_lat| and |NW_lon|) and the helper file
% |coverage_test.m|.

clear; clc;
env_base = 1;                                                             %#ok<NASGU>
% The script body below (Section "Algorithm") reads the Excel file and
% iterates over its rows. To run the full pipeline as-is, simply execute:
%
%    static_trans
%
% which is equivalent to running Sections 1-8 of the "Algorithm" block
% in this file.

%% Example 2: Sanity-Check One Region Without Writing Files
% Before launching a long batch job, it is useful to verify the region
% bounds, the OSM download, and the grid sampling on a single region.
%
% This example performs Stages 1-4 of the algorithm for one NW corner
% and plots the resulting valid (non-building) points on a map.
%
% *Parameters are reduced for quick demo runtime.* Production values
% appear in the Algorithm section below:
%
% * |d = 64 m|  (region side)            - production: 256
% * |Resolution = 15 m|                   - production: 1
% * Ray tracing at 0 reflections         - production: 0 for Stage 4
%
% Expected runtime: a few seconds on typical hardware.

nw_lat = 40.75;         % Replace with a real NW latitude
nw_lon = -73.99;        % Replace with a real NW longitude

% Stage 1: bounding box (demo: 64 m, not 256 m)
R = 6371 * 1000; d = 64;
delta_lat = (d / R) * (180 / pi);
delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
se_lat = nw_lat - delta_lat;
se_lon = nw_lon + delta_lon;

% Stage 2: OSM download (bounding box slightly larger than the region)
west  = nw_lon - (se_lon - nw_lon);
east  = nw_lon + (se_lon - nw_lon);
south = nw_lat + (se_lat - nw_lat);
north = nw_lat - (se_lat - nw_lat);
osmFile = 'sanity.osm';
osmAPI  = "https://api.openstreetmap.org/api/0.6/map?bbox=" + ...
          num2str(west) + "," + num2str(south) + "," + ...
          num2str(east) + "," + num2str(north);
system('curl "' + osmAPI + '" > ' + osmFile);                             %#ok<NASGU>

% Stage 3: siteviewer + probe transmitter
siteviewer("Buildings", osmFile, 'Visible', 'off');
tx = txsite('Latitude', (nw_lat+se_lat)/2, ...
            'Longitude', (nw_lon+se_lon)/2, ...
            'TransmitterFrequency', 28e9, ...
            'TransmitterPower', 1, ...
            'AntennaHeight', 2);

% Stage 4: discover valid grid points (demo: Resolution 15 m, not 1 m)
pm = propagationModel("raytracing", "Method", "sbr", ...
                       "MaxNumReflections", 0, "MaxNumDiffractions", 0);
a = sin(deg2rad(se_lat-nw_lat)/2)^2 + ...
    cos(deg2rad(nw_lat))*cos(deg2rad(se_lat)) * ...
    sin(deg2rad(se_lon-nw_lon)/2)^2;
diagonalDistance = R * 2 * atan2(sqrt(a), sqrt(1-a));
[~, ~, lats, lons] = coverage_test(tx, pm, ...
                     'MaxRange', diagonalDistance, 'Resolution', 15);
inBox = lats <= nw_lat & lats >= se_lat & lons >= nw_lon & lons <= se_lon;

% Plot valid receiver points
figure; geoscatter(lats(inBox), lons(inBox), 12, 'filled');
geobasemap streets; title(sprintf('%d valid receiver points', nnz(inBox)));

%% Example 3: Change the Number of Transmitters Per Region
% By default the script places 135 transmitters. To change this, modify
% the |totalMaps| value on line 96 of |static_trans.m| (also shown in
% Stage 5 of the Algorithm section below).
%
% Smaller values produce thinner datasets in less time, useful for
% debugging the downstream signal-map training pipeline.

totalMaps = 10;                                                           %#ok<NASGU>
% Inside the per-region loop this value is used in two places:
%
%    selected_idx    = randperm(size(site_table, 1), totalMaps);
%    tx = txsite("Name", string(1:totalMaps), ...)

%% Algorithm
% The following numbered sections mirror the structure of
% |static_trans.m|. They can be read top-to-bottom as a narrative of
% what the script does, and individual sections can be executed in
% isolation after establishing the required workspace variables.

%% Stage 0: Initialize Timing, Offset, and Demo Tuning Knobs
% A single script run can be executed in parallel on multiple machines
% by assigning each machine a non-overlapping |env_base| value. The
% resulting |dataset_<N>| folders will not collide.
%
% * |env_base = 0|   on machine A
% * |env_base = 100| on machine B
% * |env_base = 200| on machine C
%
% |startTime_all| and |startTime_env| are used only for progress
% reporting.
%
% *Demo tuning variables* below make it feasible to execute the full
% Algorithm section end-to-end (via F5) in roughly a minute on a typical
% laptop. Replace them with the production values shown on the right
% when you run for real:
%
% * |demoMaxRegions  = 1|  - production: |height(region_table)| (all rows)
% * |demoResolution  = 10| - production: |1|   (coverage_test sample spacing, m)
% * |demoTotalMaps   = 5|  - production: |135| (transmitters per region)

clear; clc;
startTime_all = datetime('now');
env_base = 1;

demoMaxRegions = 1;
demoResolution = 10;
demoTotalMaps  = 5;

%% Stage 1: Read the Target-Region Table
% |target_region_1.xlsx| is expected to have two columns, |NW_lat| and
% |NW_lon|, one row per 256 m x 256 m region to process. Each row
% becomes one |dataset_<env_num>| output folder.

region_table = readtable('target_region_1.xlsx');
num_regions  = min(height(region_table), demoMaxRegions);  % demo cap

%% Stage 2: Per-Region Bounding Box
% Given a north-west corner, compute the south-east corner 256 m to the
% south-east using local spherical-earth approximations. The diagonal
% NW-to-SE distance (|diagonalDistance|) is later passed as the
% |MaxRange| argument to |coverage_test| so that ray tracing covers the
% entire region.

for i = 1:num_regions
    env_num       = env_base + i - 1;
    startTime_env = datetime('now');

    nw_lat = region_table.NW_lat(i);
    nw_lon = region_table.NW_lon(i);

    directory_name = 'dataset_' + string(env_num);
    if ~exist(directory_name, 'dir'); mkdir(directory_name); end

    R = 6371 * 1000;   % Earth radius (m)
    d = 256;           % region side length (m)
    delta_lat = (d / R) * (180 / pi);
    delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
    se_lat    = nw_lat - delta_lat;
    se_lon    = nw_lon + delta_lon;

    % Haversine distance for NW-to-SE diagonal
    nwLatRad = deg2rad(nw_lat); seLatRad = deg2rad(se_lat);
    nwLonRad = deg2rad(nw_lon); seLonRad = deg2rad(se_lon);
    dLat = seLatRad - nwLatRad; dLon = seLonRad - nwLonRad;
    a = sin(dLat/2)^2 + cos(nwLatRad)*cos(seLatRad)*sin(dLon/2)^2;
    diagonalDistance = R * 2 * atan2(sqrt(a), sqrt(1-a));

    %% Stage 3: Generate a Uniform Grid and Download OSM Buildings
    % The region is subdivided into a 256x256 lat/lon grid. This grid is
    % the set of candidate receiver (and later transmitter) positions.
    %
    % The OSM bounding box is expanded outwards in each direction by the
    % region's own width so that buildings straddling the region border
    % are still retrieved. The response is saved to
    % |test<env_num>.osm|.

    lat_range = linspace(nw_lat, se_lat, 256);
    lon_range = linspace(nw_lon, se_lon, 256);
    [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
    lat_lon_table = [reshape(lat_mesh, 1, []); reshape(lon_mesh, 1, [])]';

    west  = nw_lon - (se_lon - nw_lon);
    east  = nw_lon + (se_lon - nw_lon);
    south = nw_lat + (se_lat - nw_lat);
    north = nw_lat - (se_lat - nw_lat);

    osmAPI  = "https://api.openstreetmap.org/api/0.6/map?bbox=" + ...
              num2str(west) + "," + num2str(south) + "," + ...
              num2str(east) + "," + num2str(north);
    osmFile = 'test' + string(env_num) + '.osm';
    system('curl "' + osmAPI + '" > ' + osmFile);

    %% Stage 4: Probe Transmitter to Discover Valid Grid Points
    % |coverage_test| returns the lat/lon pairs at which a signal can be
    % evaluated given the building geometry. We only need the point
    % locations here, not the signal values, so a single probe
    % transmitter at a random grid cell is enough.
    %
    % The returned points are then clipped to the exact region box
    % (|inBox|) because |coverage_test| can emit points slightly outside
    % the requested bounds.

    totalMaps         = 1;
    selected_idx      = randperm(size(lat_lon_table, 1), totalMaps);
    tx_lat            = lat_lon_table(selected_idx, 1);
    tx_lon            = lat_lon_table(selected_idx, 2);
    transmitterFreq   = 28e9;
    transmitterPower  = 1;
    antennaHeight     = 2;

    siteviewer("Buildings", osmFile, 'Visible', 'off');
    tx = txsite("Name", "TX", "Latitude", tx_lat, "Longitude", tx_lon, ...
                "TransmitterFrequency", transmitterFreq, ...
                "TransmitterPower", transmitterPower, ...
                "AntennaHeight", antennaHeight);

    % 8x8 URA with Gaussian element, azimuth beamwidth 20 deg, elevation 10 deg
    size_array = [8 8];
    lambda     = physconst("lightspeed") / transmitterFreq;
    antenna    = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
    antenna.ElementSpacing = [0.5 0.5] * lambda;
    elem = phased.GaussianAntennaElement;
    elem.FrequencyRange = [0 transmitterFreq];
    elem.Beamwidth      = [20 10];
    antenna.Element     = elem;
    tx.Antenna          = antenna;
    tx.AntennaAngle     = 180;

    pm = propagationModel("raytracing", "Method", "sbr", ...
                          "MaxNumReflections", 0, "MaxNumDiffractions", 0);
    [~, ~, datalats1, datalons1] = coverage_test(tx, pm, ...
                                   'MaxRange', diagonalDistance, ...
                                   'Resolution', demoResolution);  % demo: 10, prod: 1
    buildings_coord = [datalats1, datalons1];
    inBox = buildings_coord(:,1) <= nw_lat & buildings_coord(:,1) >= se_lat & ...
            buildings_coord(:,2) >= nw_lon & buildings_coord(:,2) <= se_lon;
    filteredCoordinates = buildings_coord(inBox, :);

    %% Stage 5: Randomly Place 135 Transmitters at Valid Positions
    % From the set of non-building grid points, pick |totalMaps|
    % positions uniformly at random and save them to
    % |transmitter_coordinates.xlsx| so the ground truth can be joined
    % back to the per-transmitter signal tables later.

    receiver_lats = filteredCoordinates(:,1);
    receiver_lons = filteredCoordinates(:,2);
    totalMaps     = demoTotalMaps;  % demo: 5, prod: 135
    site_table    = table(receiver_lats, receiver_lons);
    selected_idx  = randperm(size(site_table, 1), totalMaps);
    selected_coords = site_table(selected_idx, :);
    writetable(selected_coords, fullfile(directory_name, 'transmitter_coordinates.xlsx'));

    %% Stage 6: Configure 135 Transmitters with Random Orientations
    % All transmitters share the same array geometry and element type.
    % Only |AntennaAngle| varies (uniform in [0, 360)), producing 135
    % distinct coverage footprints in the same environment.

    tx = txsite("Name", string(1:totalMaps), ...
                "Latitude",  selected_coords.receiver_lats, ...
                "Longitude", selected_coords.receiver_lons, ...
                "TransmitterFrequency", transmitterFreq, ...
                "TransmitterPower", 1, ...
                "AntennaHeight", antennaHeight);

    for t = 1:totalMaps
        lambda = physconst("lightspeed") / tx(t).TransmitterFrequency;
        array  = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
        array.ElementSpacing = [0.5 0.5] * lambda;
        elem = phased.GaussianAntennaElement;
        elem.FrequencyRange = [0 tx(t).TransmitterFrequency];
        elem.Beamwidth      = [20 10];
        array.Element       = elem;
        tx(t).Antenna       = array;
        tx(t).AntennaAngle  = rand() * 360;
    end

    %% Stage 7: Compute Signal Strength per Transmitter and Write Excel
    % Receivers are all the valid grid points from Stage 4. For each
    % transmitter, |sigstrength| returns an N-element vector of
    % receiver powers in dBm, which is written alongside the receiver
    % coordinates to |<t>.xlsx| in the region's output folder.
    %
    % The propagation model here enables one ray-bounce reflection
    % (|MaxNumReflections = 1|) to capture first-order NLOS paths.

    rx = rxsite("Latitude", receiver_lats, ...
                "Longitude", receiver_lons, ...
                "ReceiverSensitivity", -100, ...
                "AntennaHeight", 2);
    pm = propagationModel("raytracing", "Method", "sbr", ...
                          "MaxNumReflections", 1, "MaxNumDiffractions", 0);

    for t = 1:totalMaps
        sigStre = sigstrength(rx, tx(t), pm);
        T = table(receiver_lats, receiver_lons, sigStre', ...
                  'VariableNames', {'Latitude', 'Longitude', 'Power'});
        writetable(T, fullfile(directory_name, string(t) + ".xlsx"));
    end

    %% Stage 8: Per-Region Timing Report
    elapsedTime_env = seconds(datetime('now') - startTime_env);
    disp("Time for env " + string(env_num) + ": " + ...
         string(elapsedTime_env) + " seconds");
end

%% Stage 9: Overall Timing Report
elapsedTime_all = seconds(datetime('now') - startTime_all);
disp("Total time: " + string(elapsedTime_all) + " seconds");

%% Input Files
%
% * |target_region_1.xlsx| - required. Two-column table with headers
%   |NW_lat| and |NW_lon|. One row per region.
% * |coverage_test.m|      - required helper (in repository root).
%   Custom variant of MATLAB's |coverage| that also returns the lat/lon
%   pairs sampled inside each building, used here as a building mask.
% * Internet access         - required. Each region triggers one HTTPS
%   call to |api.openstreetmap.org| via |curl|.

%% Output Files
% Per region (|dataset_<env_num>/|):
%
% * |transmitter_coordinates.xlsx| - N-by-2 table of transmitter
%   latitudes and longitudes.
% * |<t>.xlsx| for t = 1..|totalMaps| - receiver power map for the t-th
%   transmitter. Columns |Latitude|, |Longitude|, |Power| (dBm).
%
% Per region (working directory):
%
% * |test<env_num>.osm| - cached OpenStreetMap extract used for building
%   geometry. Safe to delete after the run completes.

%% Dependencies
%
% * MATLAB R2023b or later
% * Antenna Toolbox                (|txsite|, |rxsite|, |sigstrength|, |siteviewer|)
% * Phased Array System Toolbox    (|phased.URA|, |phased.GaussianAntennaElement|)
% * Mapping Toolbox                (geographic coordinates, |geoscatter|)
% * Communications Toolbox         (|propagationModel|)
% * |curl| on the system PATH      (for OSM download)
% * Local helper: |coverage_test.m|

%% Tips
%
% * Ray tracing with |MaxNumReflections = 1| is substantially more
%   expensive than |MaxNumReflections = 0|. Set diffractions and
%   reflections to |0| when prototyping to iterate faster.
% * The probe-transmitter call in Stage 4 is used only to recover the
%   list of valid (non-building) lat/lon samples. If this step becomes
%   a bottleneck, replace it with |readgeotable(osmFile, "Layer", ...
%   "buildings")| followed by |isinterior| - roughly 10x faster on
%   dense urban geometry.
% * To parallelize across machines, assign non-overlapping |env_base|
%   ranges so the output folder names do not collide.
% * The final |sigstrength| call is a single batch invocation over all
%   receivers. It cannot be cancelled mid-call. If you need an
%   interruptible version, wrap it in a per-receiver loop - see the
%   equivalent fix applied to |SimulateAllButtonPushed| in |app.m|.

%% See Also
% |txsite|, |rxsite|, |sigstrength|, |coverage|, |propagationModel|,
% |siteviewer|, |phased.URA|, |phased.GaussianAntennaElement|,
% |readgeotable|.
%
% Related scripts in this repository:
%
% * |../coverage_test.m|                       - helper used in Stage 4
% * |../fix angle simulation/static_trans.m|   - fixed-angle variant of this script
% * |../app.m| - Signal Map Generation tab     - interactive GUI front-end
