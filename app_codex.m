classdef app_codex < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        DirectivityPatternPanel         matlab.ui.container.Panel
        DirectivityPlot                 matlab.ui.control.UIAxes
        TabGroup3                       matlab.ui.container.TabGroup
        SignalMapGenerationTab_2        matlab.ui.container.Tab
        GridLayout                      matlab.ui.container.GridLayout
        CancelButton                    matlab.ui.control.Button
        PlotButton                      matlab.ui.control.Button
        GenerateButton                  matlab.ui.control.Button
        DatasetGenerationProgressButton  matlab.ui.control.Button
        RandomTransmiterSite2DropDown   matlab.ui.control.DropDown
        RandomTransmiterSite2DropDownLabel  matlab.ui.control.Label
        RandomTransmiterSite1DropDown   matlab.ui.control.DropDown
        RandomTransmiterSite1DropDownLabel  matlab.ui.control.Label
        TransmitterPowerdBmEditField    matlab.ui.control.NumericEditField
        TransmitterPowerdBmEditFieldLabel  matlab.ui.control.Label
        TransmitterFrequencye9HzEditField_2  matlab.ui.control.NumericEditField
        TransmitterFrequencye9HzEditField_2Label  matlab.ui.control.Label
        mEditField                      matlab.ui.control.NumericEditField
        mEditFieldLabel                 matlab.ui.control.Label
        NumberofSampleEditField         matlab.ui.control.NumericEditField
        NumberofSampleEditFieldLabel    matlab.ui.control.Label
        StatusEditField                 matlab.ui.control.EditField
        StatusEditFieldLabel            matlab.ui.control.Label
        PathofDirectoryEditField        matlab.ui.control.EditField
        PathofDirectoryEditFieldLabel   matlab.ui.control.Label
        RandomSitesDropDown             matlab.ui.control.DropDown
        RandomSitesDropDownLabel        matlab.ui.control.Label
        NumberofTransmitterinaRegionDropDown  matlab.ui.control.DropDown
        NumberofTransmitterinaRegionDropDownLabel  matlab.ui.control.Label
        DistributionDropDown_2          matlab.ui.control.DropDown
        DistributionDropDown_2Label     matlab.ui.control.Label
        NorthWestLongitudeEditField     matlab.ui.control.NumericEditField
        NorthWestLongitudeEditFieldLabel  matlab.ui.control.Label
        NorthWestLatitudeEditField      matlab.ui.control.NumericEditField
        NorthWestLatitudeEditFieldLabel  matlab.ui.control.Label
        GenerateregionheatmapLabel      matlab.ui.control.Label
        AdvancedAntennaPropertiesButton  matlab.ui.control.Button
        MobilityButton                  matlab.ui.control.Button
        SaveButton                      matlab.ui.control.Button
        VisualizeSiteCoverageAreaButton  matlab.ui.control.Button
        GenerateRandomSitesButton       matlab.ui.control.Button
        SwarmPropertiesTab              matlab.ui.container.Tab
        Panel                           matlab.ui.container.Panel
        GridLayout3                     matlab.ui.container.GridLayout
        TransmitterSitesListBox         matlab.ui.control.ListBox
        TransmitterSitesListBoxLabel    matlab.ui.control.Label
        ReceiverSitesListBox            matlab.ui.control.ListBox
        ReceiverSitesListBoxLabel       matlab.ui.control.Label
        TabGroup2                       matlab.ui.container.TabGroup
        DirectionalAntennaTab           matlab.ui.container.Tab
        TiltAxisDropDown                matlab.ui.control.DropDown
        TiltAxisDropDownLabel           matlab.ui.control.Label
        TiltAngleEditField              matlab.ui.control.NumericEditField
        TiltAngleEditFieldLabel         matlab.ui.control.Label
        PlotDirectivityPatternButton    matlab.ui.control.Button
        PlotcoverageAreaButton          matlab.ui.control.Button
        TabGroup_2                      matlab.ui.container.TabGroup
        FileUploadTab                   matlab.ui.container.Tab
        PathofFileUploadedEditField     matlab.ui.control.EditField
        PathofFileUploadedEditFieldLabel  matlab.ui.control.Label
        UploadFileButton                matlab.ui.control.Button
        TransmitterTab_2                matlab.ui.container.Tab
        GridLayout4                     matlab.ui.container.GridLayout
        TransmiterLatitudeEditField     matlab.ui.control.NumericEditField
        LatitudeEditFieldLabel          matlab.ui.control.Label
        TransmitterLongitudeEditField   matlab.ui.control.NumericEditField
        LongitudeEditFieldLabel         matlab.ui.control.Label
        TransmitterNameofSiteEditField  matlab.ui.control.EditField
        NameofSiteEditFieldLabel        matlab.ui.control.Label
        TransmitterPowerwattsEditField  matlab.ui.control.NumericEditField
        TransmitterPowerwattsEditFieldLabel  matlab.ui.control.Label
        AntennaHeightmetersEditField    matlab.ui.control.NumericEditField
        AntennaHeightmetersEditFieldLabel  matlab.ui.control.Label
        TransmitterFrequencye9HzEditField  matlab.ui.control.NumericEditField
        Frequencye9Label                matlab.ui.control.Label
        TransmitterAddSiteButton        matlab.ui.control.Button
        ReceiverTab_2                   matlab.ui.container.Tab
        GridLayout5                     matlab.ui.container.GridLayout
        ReceiverLongitudeEditField      matlab.ui.control.NumericEditField
        LongitudeEditField_2Label       matlab.ui.control.Label
        ReceiverLatitudeEditField       matlab.ui.control.NumericEditField
        LatitudeEditField_2Label        matlab.ui.control.Label
        ReceiverNameofSiteEditField     matlab.ui.control.EditField
        NameofSiteEditField_2Label      matlab.ui.control.Label
        ReceiverSentivityEditField      matlab.ui.control.NumericEditField
        ReceiverSentivityEditFieldLabel  matlab.ui.control.Label
        ReceiverAddSiteButton           matlab.ui.control.Button
        FileUploadforDatasetTab         matlab.ui.container.Tab
        PathofFileUploadedEditField_2   matlab.ui.control.EditField
        PathofFileUploadedEditField_2Label  matlab.ui.control.Label
        UploadFileButton_2              matlab.ui.control.Button
        SavingStatusEditField_2         matlab.ui.control.EditField
        SavingStatusEditField_2Label    matlab.ui.control.Label
        SaveFilesButton_3               matlab.ui.control.Button
        RandomTransmiterSite2DropDown_2  matlab.ui.control.DropDown
        RandomTransmiterSite2DropDown_2Label  matlab.ui.control.Label
        RandomTransmiterSite1DropDown_2  matlab.ui.control.DropDown
        RandomTransmiterSite1DropDown_2Label  matlab.ui.control.Label
        RandomSitesDropDown_2           matlab.ui.control.DropDown
        RandomSitesDropDown_2Label      matlab.ui.control.Label
        VisualizeSiteCoverageAreaButton_2  matlab.ui.control.Button
        MapPanel_2                      matlab.ui.container.Panel
        BaseMapDropDown                 matlab.ui.control.DropDown
        BaseMapDropDownLabel            matlab.ui.control.Label
        MapPanel                        matlab.ui.container.Panel
        EnvironmentalPropertiesPanel    matlab.ui.container.Panel
        TabGroup                        matlab.ui.container.TabGroup
        TargetRegionTab                 matlab.ui.container.Tab
        GridLayout2                     matlab.ui.container.GridLayout
        PropagationModelDropDown        matlab.ui.control.DropDown
        PropagationModelDropDownLabel   matlab.ui.control.Label
        AdvancedPropertiesButton        matlab.ui.control.Button
        SouthWestLongitudeEditField     matlab.ui.control.NumericEditField
        SouthWestLongitudeEditField_2Label  matlab.ui.control.Label
        NorthEastLongitudeEditField     matlab.ui.control.NumericEditField
        NorthEastLongitudeEditFieldLabel  matlab.ui.control.Label
        SouthWestLatitudeEditField      matlab.ui.control.NumericEditField
        SouthWestLongitudeLabel         matlab.ui.control.Label
        NorthEastLatitudeEditField      matlab.ui.control.NumericEditField
        NorthEastLatitudeEditFieldLabel  matlab.ui.control.Label
        PlotTargetRegionButton          matlab.ui.control.Button
        SyntheticTrajectoryGeneratorTab  matlab.ui.container.Tab
        TabGroup4                       matlab.ui.container.TabGroup
        RandomPathGenerationTab         matlab.ui.container.Tab
        TabGroup6_4                     matlab.ui.container.TabGroup
        PathGenerationTab               matlab.ui.container.Tab
        PairwiseTargetButton            matlab.ui.control.Button
        FixangleButton                  matlab.ui.control.Button
        BuildingAvoidanceSpinner        matlab.ui.control.Spinner
        BuildingAvoidanceSpinnerLabel   matlab.ui.control.Label
        NWLongitudeEditField            matlab.ui.control.NumericEditField
        NWLongitudeEditFieldLabel       matlab.ui.control.Label
        NWLatitudeEditField             matlab.ui.control.NumericEditField
        NWLatitudeEditFieldLabel        matlab.ui.control.Label
        NumberoftrajectoriesEditField   matlab.ui.control.NumericEditField
        NumberoftrajectoriesEditFieldLabel  matlab.ui.control.Label
        RandomangleButton               matlab.ui.control.Button
        PathVisualizationandSimulationTab  matlab.ui.container.Tab
        VisualizeABandA1AngleButton     matlab.ui.control.Button
        SimulateAllButton               matlab.ui.control.Button
        SaveAllButton                   matlab.ui.control.Button
        SaveTrajectoryButton            matlab.ui.control.Button
        SimulateSignalAlongTrajectoryButton  matlab.ui.control.Button
        VisualizeTrajectoryButton       matlab.ui.control.Button
        SelectTrajectoryDropDown        matlab.ui.control.DropDown
        SelectTrajectoryDropDownLabel   matlab.ui.control.Label
        VehicleVariationTab             matlab.ui.container.Tab
        VisualizeVehicleVariationsButton  matlab.ui.control.Button
        VehicleTree                     matlab.ui.container.CheckBoxTree
        VehiclesNode                    matlab.ui.container.TreeNode
        UnicycleNode                    matlab.ui.container.TreeNode
        BicycleNode                     matlab.ui.container.TreeNode
        DifferentialNode                matlab.ui.container.TreeNode
        TransformerGenerationTab        matlab.ui.container.Tab
        TabGroup6_3                     matlab.ui.container.TabGroup
        AllNodeVisualizationTab         matlab.ui.container.Tab
        VisualizeallnodesforretrievingavailableNodeIDsinnetworkLabel  matlab.ui.control.Label
        VisualizeNetworkNodesButton     matlab.ui.control.Button
        SingleSeedInputTab              matlab.ui.container.Tab
        Label                           matlab.ui.control.Label
        SeedTrajectoryEditField         matlab.ui.control.EditField
        SeedTrajectoryEditField_2Label  matlab.ui.control.Label
        GenerateTrajectoryButton        matlab.ui.control.Button
        BatchInputsTab                  matlab.ui.container.Tab
        Label_2                         matlab.ui.control.Label
        UploadmatFileButton             matlab.ui.control.Button
        ContextMenu                     matlab.ui.container.ContextMenu
        Menu                            matlab.ui.container.Menu
        Menu2                           matlab.ui.container.Menu
    end


    properties (Access = private)
        Latitudes = []% Description
        Longitudes = []% Description
        transmitterLat = []
        receiverLat = []
        transmitterLon = []
        receiverLon = []
        transmitters = []
        receivers = []
        siteType = []
        coordinateSytem = []
        transmitterAntenna = []
        transmitterAntennaAngle = []
        transmitterAntennaHeight = []
        transmitterAntennaPosition = []
        transmitterSystemLoss = []
        transmitterFrequency = []
        transmitterPower = []
        receiverAntenna = []
        receiverAntennaAngle = []
        receiverAntennaHeight = []
        receiverAntennaPosition = []
        receiverSystemLoss = []
        receiverSenstivity = []
        geoPlotAxes
        txa
        rxsa
        randLatitudes
        randLongitudes
        centroidLat
        centroidLon
        siteN
        figs = []
        propRainRate
        propRainTilt
        
        propGasAirTemp
        propGasDryAirPressure
        propGasWaterVapourDensity
        
        propFogAirTemp
        propFogLiquidWaterDensity
        
        propCloseInReferenceDistance
        propCloseInPathLossExponent
        propCloseInStandardDeviation
        propCloseInNumOfDataPoints
        
        propLongleyAntennaPolarization
        propLongleyGroundConductivity
        propLongleyGroundPermitivity
        propLongleyAtmosphericRefractivity
        propLongleyTimeVariabilityTolerance
        propLongleySituationVariabilityTolerance
        
        propRaytracingSurfaceMaterialConductivity
        propRaytracingSurfaceMaterialPermitivity
        propRaytracingSurfaceMaterial
        propRaytracingTerrainMaterialConductivity
        propRaytracingTerrainMaterialPermitivity
        propRaytracingTerrainMaterial
        propRaytracingBuildingMaterialConductivity
        propRaytracingBuildingMaterialPermitivity
        propRaytracingBuildingMaterial
        propRaytracingMaxRelativePathLoss
        propRaytracingMaxAbsolutePathLoss
        propRaytracingMaxdiffraction
        propRaytracingMaxReflection
        propRaytracingAngularSeparation
        
        mobilityFilePath % Description
        mobilityFileName
        diagonalDistance % Description
        nw_Lati % Description
        nw_Longi
        se_Lati
        se_Longi

        propagationModels = { propagationModel("freespace"), ...
        propagationModel("close-in"), ...
        propagationModel("rain"), ...
        propagationModel("gas"), ...
        propagationModel("fog"), ...
        propagationModel("longley-rice"), ...
        propagationModel("raytracing")}

        Transmitters = {};
        Receivers = {};
        dataset_file
        


        DatasetGenFutures % array of futures returned when generating dataset in the background
        Trajectories = {}; % Description
        ActiveTrajectory = "none"; % Description
    end
  
    
    methods (Access = private)
        
        function [n, m] = getGridSize(app)
            n = 256;
            m = 256;
            if isprop(app, 'nEditField') && ~isempty(app.nEditField) && isvalid(app.nEditField)
                n = app.nEditField.Value;
            end
            if isprop(app, 'mEditField') && ~isempty(app.mEditField) && isvalid(app.mEditField)
                m = app.mEditField.Value;
            end
        end

        function [tiltAngle, tiltAxis] = getTiltSettings(app)
            tiltAngle = 0;
            tiltAxis = "Z";

            if isprop(app, 'TiltAngleEditField') && ~isempty(app.TiltAngleEditField) && isvalid(app.TiltAngleEditField)
                tiltAngle = app.TiltAngleEditField.Value;
            end
            if isprop(app, 'TiltAxisDropDown') && ~isempty(app.TiltAxisDropDown) && isvalid(app.TiltAxisDropDown)
                tiltAxis = string(app.TiltAxisDropDown.Value);
            end

            if isprop(app, 'DirectivityPatternSwitch') && ~isempty(app.DirectivityPatternSwitch) && isvalid(app.DirectivityPatternSwitch)
                if app.DirectivityPatternSwitch.Value == "On"
                    if isprop(app, 'SizeyEditField') && ~isempty(app.SizeyEditField) && isvalid(app.SizeyEditField)
                        tiltAngle = app.SizeyEditField.Value;
                    end
                    if isprop(app, 'TiltAxisDropDown_2') && ~isempty(app.TiltAxisDropDown_2) && isvalid(app.TiltAxisDropDown_2)
                        tiltAxis = string(app.TiltAxisDropDown_2.Value);
                    end
                end
            end
        end

        function showImageOnPreview(app, imageData)
            if isempty(imageData)
                return;
            end
            imshow(imageData, 'Parent', app.DirectivityPlot);
        end
        
        function updateDataGenerationProgressBar(app, iteration, total)
            % Create waitbar with same color as button
            wbar = permute(repmat(app.DatasetGenerationProgressButton.BackgroundColor,15,1,200),[1,3,2]);
            % Black frame around waitbar
            wbar([1,end],:,:) = 0;
            wbar(:,[1,end],:) = 0;
            
            currentProg = min(round((size(wbar,2)-2)*(iteration/total)),size(wbar,2)-2);
            RGB = app.DatasetGenerationProgressButton.Icon;
            RGB(2:end-1, 2:currentProg+1, 1) = 0.25391; % (royalblue)
            RGB(2:end-1, 2:currentProg+1, 2) = 0.41016;
            RGB(2:end-1, 2:currentProg+1, 3) = 0.87891;
            app.DatasetGenerationProgressButton.Icon = RGB;
        end
        
        function GenDatasetScript(app, northWestLat, northWestLon, envNum, numTransmitters)
              %% Target Region Computation
              nw_lat = northWestLat;
              nw_lon = northWestLon;
              env_num = envNum;
              directory_name = 'dataset_' + string(env_num);

              % Check if the directory exists
              if ~exist(directory_name, 'dir')
                  mkdir(directory_name);
              end

              % Constants
              R = 6371 * 1000; % Earth radius in meters
              d = 256; % Region side length in meters

              % Calculate destination coordinates
              delta_lat = (d / R) * (180 / pi);
              delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
              se_lat = nw_lat - delta_lat;
              se_lon = nw_lon + delta_lon;

              % Compute diagonal distance
              nwLatRad = deg2rad(nw_lat);
              nwLonRad = deg2rad(nw_lon);
              seLatRad = deg2rad(se_lat);
              seLonRad = deg2rad(se_lon);
              deltaLat = seLatRad - nwLatRad;
              deltaLon = seLonRad - nwLonRad;
              a = sin(deltaLat/2)^2 + cos(nwLatRad) * cos(seLatRad) * sin(deltaLon/2)^2;
              c = 2 * atan2(sqrt(a), sqrt(1-a));
              app.diagonalDistance = R * c;

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

              %% Download OpenStreetMap OSM
              osmAPI = "https://api.openstreetmap.org/api/0.6/map?bbox=" + ...
                       num2str(west) + "," + num2str(south) + "," + num2str(east) + "," + num2str(north);
              osmFile = 'test' + string(env_num) + '.osm';
              command = 'curl "' + osmAPI + '" > ' + osmFile;
              system(command);

              %% New transmitter settings (updated parameters)
              transmitterFreq = 28e9;      % 28 GHz (was 5.9e9)
              transmitterPower = 1;        % 1 W (was 23)
              antennaHeight = 2;           % 2 m (was 5)
              size_array = [8 8];

              %% Initial transmitter for coverage_test to get grid points
              totalMaps_init = 1;
              selected_idx_init = randperm(size(lat_lon_table, 1), totalMaps_init);
              tx_lat_init = lat_lon_table(selected_idx_init, 1);
              tx_lon_init = lat_lon_table(selected_idx_init, 2);

              siteviewer("Buildings", osmFile, 'Visible', 'off');
              tx_init = txsite("Name", "TX_init", ...
                  "Latitude", tx_lat_init, ...
                  "Longitude", tx_lon_init, ...
                  "TransmitterFrequency", transmitterFreq, ...
                  "TransmitterPower", transmitterPower, ...
                  "AntennaHeight", antennaHeight);

              % Configure directional antenna for initial tx
              lambda_init = physconst("lightspeed") / transmitterFreq;
              antenna_init = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
              antenna_init.ElementSpacing = [0.5 0.5] * lambda_init;
              elem_init = phased.GaussianAntennaElement;
              elem_init.FrequencyRange = [0 transmitterFreq];
              elem_init.Beamwidth = [20 10];
              antenna_init.Element = elem_init;
              tx_init.Antenna = antenna_init;
              tx_init.AntennaAngle = 180;

              %% Get grid points using coverage_test
              pm_coverage = propagationModel("raytracing", "Method", "sbr", "MaxNumReflections", 0, "MaxNumDiffractions", 0);
              startTime = datetime('now');
              [~, ~, datalats1, datalons1] = coverage_test(tx_init, pm_coverage, 'MaxRange', app.diagonalDistance, 'Resolution', 1);
              endTime = datetime('now');
              elapsedTime = seconds(endTime - startTime);
              disp("coverage_test time: " + string(elapsedTime) + " seconds");

              buildings_coord = [datalats1, datalons1];

              % Filter coordinates based on target region
              inBox = buildings_coord(:,1) <= nw_lat & buildings_coord(:,1) >= se_lat & ...
                      buildings_coord(:,2) >= nw_lon & buildings_coord(:,2) <= se_lon;
              filteredCoordinates = buildings_coord(inBox, :);

              %% Randomly select transmitter locations from filtered coordinates
              receiver_lats = filteredCoordinates(:,1);
              receiver_lons = filteredCoordinates(:,2);
              totalMaps = numTransmitters;

              % Ensure we don't request more transmitters than available locations
              if totalMaps > size(filteredCoordinates, 1)
                  warning('Requested %d transmitters but only %d locations available. Using all available locations.',  totalMaps, size(filteredCoordinates, 1));
                  totalMaps = size(filteredCoordinates, 1);
              end

              site_table = table(receiver_lats, receiver_lons);
              selected_idx = randperm(size(site_table, 1), totalMaps);
              selected_coords = site_table(selected_idx, :);
              writetable(selected_coords, fullfile(directory_name, 'transmitter_coordinates.xlsx'));

              %% Set up multiple transmitters
              tx = txsite("Name", string(1:totalMaps), ...
                  "Latitude", selected_coords.receiver_lats, ...
                  "Longitude", selected_coords.receiver_lons, ...
                  "TransmitterFrequency", transmitterFreq, ...
                  "TransmitterPower", transmitterPower, ...
                  "AntennaHeight", antennaHeight);

              %% Configure antenna for each transmitter
              for t = 1:totalMaps
                  lambda = physconst("lightspeed") / tx(t).TransmitterFrequency;
                  array = phased.URA('Size', size_array, 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
                  array.ElementSpacing = [0.5 0.5] * lambda;
                  elem = phased.GaussianAntennaElement;
                  elem.FrequencyRange = [0 tx(t).TransmitterFrequency];
                  elem.Beamwidth = [20 10];
                  array.Element = elem;
                  tx(t).Antenna = array;
                  tx(t).AntennaAngle = rand() * 360;  % Random angle
              end

              %% Set up receivers and compute signal strength
              rx = rxsite("Latitude", receiver_lats, ...
                  "Longitude", receiver_lons, ...
                  "ReceiverSensitivity", -100, ...
                  "AntennaHeight", 2);

              pm_signal = propagationModel("raytracing", "Method", "sbr", "MaxNumReflections", 1, "MaxNumDiffractions",  0);

              for t = 1:totalMaps
                  startTime = datetime('now');
                  sigStre = sigstrength(rx, tx(t), pm_signal);
                  latCol = receiver_lats(:);
                  lonCol = receiver_lons(:);
                  powerCol = sigStre(:);

                  sampleCount = min([numel(latCol), numel(lonCol), numel(powerCol)]);
                  if sampleCount == 0
                      warning('No valid signal samples were generated for transmitter %d in environment %d.', t, env_num);
                      continue;
                  end

                  if sampleCount < numel(latCol) || sampleCount < numel(powerCol)
                      warning('Sample count mismatch for transmitter %d in environment %d. Truncating to %d samples.', t, env_num, sampleCount);
                  end

                  T = table(latCol(1:sampleCount), lonCol(1:sampleCount), powerCol(1:sampleCount), ...
                      'VariableNames', {'Latitude', 'Longitude', 'Power'});
                  writetable(T, fullfile(directory_name, string(t) + ".xlsx"));
                  endTime = datetime('now');
                  elapsedTime = seconds(endTime - startTime);
                  disp("Transmitter " + string(t) + " time: " + string(elapsedTime) + " seconds");
              end

              disp("Environment " + string(env_num) + " completed.");
          end        
        function onDatasetFutureDone(app, Future)
            % Find the index of this future
            idx = ([app.DatasetGenFutures.ID] == Future.ID);
            data = fetchOutputs(app.DatasetGenFutures);
            tranciverCordinates = data(1);
            writematrix(tranciverCordinates{1}, tranciverCordinates{2});

            tables = data(2);
            for i = 1:length(tables)
            set = tables{i}
            writetable(set{1},set{2});
            app.updateDataGenerationProgressBar(idx, size(app.DatasetGenFutures));
            end
        end
        
        
        
        function v = robotController(app, controller, pose, goalPoints, goalRadius)
            % Simple controller wrapper for pure pursuit controller

            % Extract x, y coordinates and heading angle from pose
            x = pose(1);
            y = pose(2);
            theta = pose(3);

            % Check if robot has reached the goal
            distToGoal = norm([x; y] - goalPoints);
            if distToGoal < goalRadius
                % If goal is reached, stop
                v = [0; 0];
                return;
            end

            % Get control inputs from pure pursuit controller
            [v, w] = controller([x, y, theta]);

            % Return vehicle speed and heading rate
            v = [v; w];

        end
        
        function [x,y,utmzone] = deg2utm(app, Lat, Lon)
            % -------------------------------------------------------------------------
            % [x,y,utmzone] = deg2utm(Lat,Lon)
            %
            % Description: Function to convert lat/lon vectors into UTM coordinates (WGS84).
            % Some code has been extracted from deg2utm.m function by Rafael Palacios.
            %
            % Inputs:
            %    Lat: Latitude vector.   Degrees.  +ddd.ddddd  WGS84
            %    Lon: Longitude vector.  Degrees.  +ddd.ddddd  WGS84
            %
            % Outputs:
            %    x, y , utmzone.   See example
            %
            % Example 1:
            %    Lat=[40.3154333; 46.283900; 37.577833; 28.645650; 38.855550; 25.061783];
            %    Lon=[-3.4857166; 7.8012333; -119.95525; -17.759533; -94.7990166; 121.640266];
            %    [x,y,utmzone] = deg2utm(Lat,Lon);
            %    fprintf('%7.0f ',x)
            %       458731  407653  239027  230253  343898  362850
            %    fprintf('%7.0f ',y)
            %      4462881 5126290 4163083 3171843 4302285 2772478
            %    utmzone =
            %       30 T
            %       32 T
            %       11 S
            %       28 R
            %       15 S
            %       51 R
            %
            % Example 2: If you have Lat/Lon coordinates in Degrees, Minutes and Seconds
            %    LatDMS=[40 18 55.56; 46 17 2.04];
            %    LonDMS=[-3 29  8.58;  7 48 4.44];
            %    Lat=dms2deg(mat2dms(LatDMS)); %convert into degrees
            %    Lon=dms2deg(mat2dms(LonDMS)); %convert into degrees
            %    [x,y,utmzone] = deg2utm(Lat,Lon)
            %
            % Authors:
            %   Erwin Nindl, Rafael Palacious
            %
            % Version history by Erwin Nindl:
            %   Nov/13: removed main-loop and vectorised all calculations
            %
            % Version history by Rafael Palacios:
            %   Apr/06, Jun/06, Aug/06, Aug/06
            %   Aug/06: fixed a problem (found by Rodolphe Dewarrat) related to southern
            %     hemisphere coordinates.
            %   Aug/06: corrected m-Lint warnings
            %---------------------------------------------------------------------------
            % Argument checking
            %
            error(nargchk(2, 3, nargin));  %2 arguments required
            n1=length(Lat);
            n2=length(Lon);
            if (n1~=n2)
                error('Lat and Lon vectors should have the same length');
            end
            % Memory pre-allocation
            %
            x=zeros(n1,1);
            y=zeros(n1,1);
            utmzone(n1,:)='60 X';
            invalid_ids = isnan(Lat) & isnan(Lon);
            x(invalid_ids) = NaN;
            y(invalid_ids) = NaN;
            % Avoid Loop
            %
            % constants
            sa = 6378137.000000 ; sb = 6356752.314245;
            %e = ( ( ( sa ^ 2 ) - ( sb ^ 2 ) ) ^ 0.5 ) / sa;
            e2 = ( ( ( sa ^ 2 ) - ( sb ^ 2 ) ) ^ 0.5 ) / sb;
            e2cuadrada = e2 ^ 2;
            c = ( sa ^ 2 ) / sb;
            %alpha = ( sa - sb ) / sa;             %f
            %ablandamiento = 1 / alpha;   % 1/f
            lat = Lat .* ( pi / 180 );
            lon = Lon .* ( pi / 180 );
            Huso = fix( ( Lon ./ 6 ) + 31);
            S = ( ( Huso .* 6 ) - 183 );
            deltaS = lon - ( S .* ( pi / 180 ) );
            Letra = char(zeros(n1,1));
            Letra(:) = 'X';
            Letra(Lat<-72) = 'C';
            Letra(Lat<-64 & Lat>=-72) = 'D';
            Letra(Lat<-56 & Lat>=-64) = 'E';
            Letra(Lat<-48 & Lat>=-56) = 'F';
            Letra(Lat<-40 & Lat>=-48) = 'G';
            Letra(Lat<-32 & Lat>=-40) = 'H';
            Letra(Lat<-24 & Lat>=-32) = 'J';
            Letra(Lat<-16 & Lat>=-24) = 'K';
            Letra(Lat<-8 & Lat>=-16) = 'L';
            Letra(Lat<0 & Lat>=-8) = 'M';
            Letra(Lat<8 & Lat>=0) = 'N';
            Letra(Lat<16 & Lat>=8) = 'P';
            Letra(Lat<24 & Lat>=16) = 'Q';
            Letra(Lat<32 & Lat>=24) = 'R';
            Letra(Lat<40 & Lat>=32) = 'S';
            Letra(Lat<48 & Lat>=40) = 'T';
            Letra(Lat<56 & Lat>=48) = 'U';
            Letra(Lat<64 & Lat>=56) = 'V';
            Letra(Lat<72 & Lat>=64) = 'W';
            a = cos(lat) .* sin(deltaS);
            epsilon = 0.5 * log( ( 1 +  a) ./ ( 1 - a ) );
            nu = atan( tan(lat) ./ cos(deltaS) ) - lat;
            v = ( c ./ ( ( 1 + ( e2cuadrada .* ( cos(lat) ) .^ 2 ) ) ) .^ 0.5 ) .* 0.9996;
            ta = ( e2cuadrada ./ 2 ) * epsilon .^ 2 .* ( cos(lat) ) .^ 2;
            a1 = sin( 2 .* lat );
            a2 = a1 .* ( cos(lat) ) .^ 2;
            j2 = lat + ( a1 ./ 2 );
            j4 = ( ( 3 .* j2 ) + a2 ) ./ 4;
            j6 = ( ( 5 .* j4 ) + ( a2 .* ( cos(lat) ) .^ 2) ) ./ 3;
            alfa = ( 3 ./ 4 ) .* e2cuadrada;
            beta = ( 5 ./ 3 ) .* alfa .^ 2;
            gama = ( 35 ./ 27 ) .* alfa .^ 3;
            Bm = 0.9996 .* c .* ( lat - alfa .* j2 + beta .* j4 - gama .* j6 );
            xx = epsilon .* v .* ( 1 + ( ta ./ 3 ) ) + 500000;
            yy = nu .* v .* ( 1 + ta ) + Bm;
            yy(yy<0) = 9999999 + yy(yy<0);
            x = xx;
            y = yy;
            for i=1:n1
                utmzone(i,:)=sprintf('%02d %c',Huso(i),Letra(i));
            end
            %eof

        end
        
        
        
        function [Lat,Lon] = utm2deg(app, xx, yy, utmzone)
            % -------------------------------------------------------------------------
            % [Lat,Lon] = utm2deg(x,y,utmzone)
            %
            % Description: Function to convert vectors of UTM coordinates into Lat/Lon vectors (WGS84).
            % Some code has been extracted from deg2utm.m function by Rafael Palacios.
            %
            % Inputs:
            %    x, y , utmzone.
            %
            % Outputs:
            %    Lat: Latitude vector.   Degrees.  +ddd.ddddd  WGS84
            %    Lon: Longitude vector.  Degrees.  +ddd.ddddd  WGS84
            %
            % Example 1:
            % x=[ 458731;  407653;  239027;  230253;  343898;  362850];
            % y=[4462881; 5126290; 4163083; 3171843; 4302285; 2772478];
            % utmzone=['30 T'; '32 T'; '11 S'; '28 R'; '15 S'; '51 R'];
            % [Lat, Lon]=utm2deg(x,y,utmzone);
            % fprintf('%11.6f ',lat)
            %    40.315430   46.283902   37.577834   28.645647   38.855552   25.061780
            % fprintf('%11.6f ',lon)
            %    -3.485713    7.801235 -119.955246  -17.759537  -94.799019  121.640266
            %
            % Example 2: If you need Lat/Lon coordinates in Degrees, Minutes and Seconds
            % [Lat, Lon]=utm2deg(x,y,utmzone);
            % LatDMS=dms2mat(deg2dms(Lat))
            %LatDMS =
            %    40.00         18.00         55.55
            %    46.00         17.00          2.01
            %    37.00         34.00         40.17
            %    28.00         38.00         44.33
            %    38.00         51.00         19.96
            %    25.00          3.00         42.41
            % LonDMS=dms2mat(deg2dms(Lon))
            %LonDMS =
            %    -3.00         29.00          8.61
            %     7.00         48.00          4.40
            %  -119.00         57.00         18.93
            %   -17.00         45.00         34.33
            %   -94.00         47.00         56.47
            %   121.00         38.00         24.96
            %
            % Authors:
            %   Erwin Nindl, Rafael Palacious
            %
            % Version history by Erwin Nindl:
            %   Nov/13: removed main-loop and vectorised all calculations
            %
            % Version history by Rafael Palacios:
            %   Apr/06, Jun/06, Aug/06, Aug/06
            %   Aug/06: fixed a problem (found by Rodolphe Dewarrat) related to southern
            %     hemisphere coordinates.
            %   Aug/06: corrected m-Lint warnings
            %---------------------------------------------------------------------------
            % Argument checking
            %
            error(nargchk(3, 4, nargin)); %3 arguments required
            n1=length(xx);
            n2=length(yy);
            n3=size(utmzone,1);
            if (n1~=n2 || n1~=n3)
                error('x,y and utmzone vectors should have the same number or rows');
            end
            c=size(utmzone,2);
            if (c~=4)
                error('utmzone should be a vector of strings like "30 T"');
            end


            % % Memory pre-allocation
            % %
            % Lat=zeros(n1,1);
            % Lon=zeros(n1,1);
            % Avoid Main Loop
            %
            if(~isempty(find(utmzone(:,4)>'X',1)) || ~isempty(find(utmzone(:,4)<'C',1)))
                fprintf('utm2deg: Warning utmzone should be a vector of strings like "30 T", not "30 t"\n');
            end
            hemis = char(zeros(n1,1));
            hemis(:) = 'S';
            hemis(utmzone(:,4)>'M') = 'N'; % Northern hemisphere
            x = xx(:);
            y = yy(:);
            zone = str2num(utmzone(:,1:2));
            sa = 6378137.000000 ; sb = 6356752.314245;

            %   e = ( ( ( sa ^ 2 ) - ( sb ^ 2 ) ) ^ 0.5 ) / sa;
            e2 = ( ( ( sa .^ 2 ) - ( sb .^ 2 ) ) .^ 0.5 ) ./ sb;
            e2cuadrada = e2 .^ 2;
            c = ( sa .^ 2 ) ./ sb;
            %   alpha = ( sa - sb ) / sa;             %f
            %   ablandamiento = 1 / alpha;   % 1/f
            X = x - 500000;
            Y = y;
            ids_south = (hemis == 'S') | (hemis == 's');
            Y(ids_south) = Y(ids_south) - 10000000;
            S = ( ( zone .* 6 ) - 183 );
            lat =  Y ./ ( 6366197.724 .* 0.9996 );
            v = ( c ./ ( ( 1 + ( e2cuadrada .* ( cos(lat) ) .^ 2 ) ) ) .^ 0.5 ) .* 0.9996;
            a = X ./ v;
            a1 = sin( 2 .* lat );
            a2 = a1 .* ( cos(lat) ) .^ 2;
            j2 = lat + ( a1 ./ 2 );
            j4 = ( ( 3 .* j2 ) + a2 ) ./ 4;
            j6 = ( ( 5 .* j4 ) + ( a2 .* ( cos(lat) ) .^ 2) ) ./ 3;
            alfa = ( 3 ./ 4 ) .* e2cuadrada;
            beta = ( 5 ./ 3 ) .* alfa .^ 2;
            gama = ( 35 ./ 27 ) .* alfa .^ 3;
            Bm = 0.9996 .* c .* ( lat - alfa .* j2 + beta .* j4 - gama .* j6 );
            b = ( Y - Bm ) ./ v;
            Epsi = ( ( e2cuadrada .* a.^2 ) ./ 2 ) .* ( cos(lat) ).^ 2;
            Eps = a .* ( 1 - ( Epsi ./ 3 ) );
            nab = ( b .* ( 1 - Epsi ) ) + lat;
            senoheps = ( exp(Eps) - exp(-Eps) ) ./ 2;
            Delt = atan(senoheps ./ (cos(nab) ) );
            TaO = atan(cos(Delt) .* tan(nab));
            longitude = (Delt .* (180/pi) ) + S;
            latitude = ( lat + ( 1 + e2cuadrada .* (cos(lat).^2) - ( 3/2 ) ...
                .* e2cuadrada .* sin(lat) .* cos(lat) .* ( TaO - lat ) ) ...
                .* ( TaO - lat ) ) .* (180/pi);
            Lat = latitude;
            Lon = longitude;
            %eof

        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: TransmitterAddSiteButton
        function TransmitterAddSiteButtonPushed(app, event)
            app.transmitters = [app.transmitters app.TransmitterNameofSiteEditField.Value];
            app.transmitterLat = [app.transmitterLat (app.TransmiterLatitudeEditField.Value)];
            app.transmitterLon = [app.transmitterLon (app.TransmitterLongitudeEditField.Value)];
            app.transmitterAntenna = [app.transmitterAntenna "dipole"];
            app.transmitterAntennaAngle = [app.transmitterAntennaAngle 0];
            app.transmitterAntennaHeight = [app.transmitterAntennaHeight app.AntennaHeightmetersEditField.Value];
            app.transmitterAntennaPosition = [app.transmitterAntennaPosition 0];
            app.transmitterSystemLoss = [app.transmitterSystemLoss 0];
            app.transmitterFrequency = [app.transmitterFrequency app.TransmitterFrequencye9HzEditField.Value];
            app.transmitterPower = [app.transmitterPower app.TransmitterPowerwattsEditField.Value];
            
            antenna = design(dipole, app.TransmitterFrequencye9HzEditField.Value * 1e9);

            newTransmitter = txsite("Name", app.TransmitterNameofSiteEditField.Value, ...
                "Latitude", app.TransmiterLatitudeEditField.Value, ...
                "Longitude", app.TransmitterLongitudeEditField.Value, ...
                "Antenna", antenna, ...
                "AntennaAngle", 0, ...
                "AntennaHeight", app.AntennaHeightmetersEditField.Value, ...
                "AntennaPosition", [0; 1; 0], ...
                "SystemLoss", 0, ...
                "TransmitterFrequency", app.TransmitterFrequencye9HzEditField.Value * 1e9, ...
                "TransmitterPower", app.TransmitterPowerwattsEditField.Value);


            app.TransmitterSitesListBox.Items{end+1} = newTransmitter.Name;
            
            app.Transmitters{end+1} = newTransmitter;
            %             app.Latitudes = [app.Latitudes (app.TransmiterLatitudeEditField.Value)];
            %             app.Longitudes = [app.Longitudes (app.TransmitterLongitudeEditField.Value)];
            geoplot(app.geoPlotAxes, newTransmitter.Latitude, newTransmitter.Longitude, 'p', 'MarkerFaceColor', 'auto', 'MarkerSize',20)
            hold(app.geoPlotAxes, 'on');
            %             geolimits(geoAxes,[min(latitudes) max(latitudes)], [min(longitudes) max(longitudes)])
            geobasemap(app.geoPlotAxes, app.BaseMapDropDown.Value)
        end

        % Button pushed function: ReceiverAddSiteButton
        function ReceiverAddSiteButtonPushed(app, event)
            app.receivers = [app.receivers app.ReceiverNameofSiteEditField.Value];
            app.receiverLat = [app.receiverLat app.ReceiverLatitudeEditField.Value];
            app.receiverLon = [app.receiverLon app.ReceiverLongitudeEditField.Value];
            app.receiverAntenna = [app.receiverAntenna "dipole"];
            app.receiverAntennaAngle = [app.receiverAntennaAngle 0];
            app.receiverAntennaHeight = [app.receiverAntennaHeight 10];
            app.receiverAntennaPosition = [app.receiverAntennaPosition 0];
            app.receiverSystemLoss = [app.receiverSystemLoss 0];
            app.receiverSenstivity = [app.receiverSenstivity app.ReceiverSentivityEditField.Value];
            %
            %             app.Latitudes = [app.Latitudes (app.ReceiverLatitudeEditField.Value)];
            %             app.Longitudes = [app.Longitudes (app.ReceiverLongitudeEditField.Value)];
            
            antenna = design(dipole, 1e9);

            newReceiver = rxsite(...
                "Name", app.ReceiverNameofSiteEditField.Value, ...
                "Latitude", app.ReceiverLatitudeEditField.Value, ...
                "Longitude", app.ReceiverLongitudeEditField.Value, ...
                "Antenna", antenna, ...
                "AntennaAngle", 0, ...
                "AntennaHeight", 10, ...
                "AntennaPosition", [0; 1; 0], ...
                "SystemLoss",0, ...
                "ReceiverSensitivity", app.ReceiverSentivityEditField.Value);

            app.ReceiverSitesListBox.Items{end+1} = app.ReceiverNameofSiteEditField.Value;
            app.Receivers{end+1} = newReceiver;

            geoplot(app.geoPlotAxes, newReceiver.Latitude, newReceiver.Longitude, 'p', 'MarkerFaceColor', 'blue', 'MarkerSize',20)
            hold(app.geoPlotAxes, 'on');
            %             geolimits(geoAxes,[min(latitudes) max(latitudes)], [min(longitudes) max(longitudes)])
            geobasemap(app.geoPlotAxes, app.BaseMapDropDown.Value)
        end

        % Button pushed function: PlotcoverageAreaButton
        function PlotcoverageAreaButtonPushed(app, event)

            fq = [];
            antennas = [];
            for i = 1:length(app.transmitterFrequency)
               num = app.transmitterFrequency(i);
               str = 'e9';
               fq1 = str2double([num2str(num) str]);
               antennas = [antennas design(dipole,(fq1))];
               fq = [fq fq1];
            end

                        num = app.TransmitterFrequencye9HzEditField.Value;
                        str = 'e9';
                        fq = str2double([num2str(num) str]);
                        disp((fq))
            tx = txsite("Name",app.transmitters, ...
               "Latitude", app.transmitterLat, ...
               "Longitude", app.transmitterLon, ...
               "Antenna", antennas, ...
               "AntennaHeight", app.transmitterAntennaHeight, ...
               "TransmitterFrequency", fq, ...
               "TransmitterPower", app.transmitterPower);
%             tx = txsite("Name",(app.TransmitterNameofSiteEditField.Value), ...
%                 "Latitude",(app.TransmiterLatitudeEditField.Value), ...
%                 "Longitude",(app.TransmitterLongitudeEditField.Value), ...
%                 "Antenna",design(dipole,(fq)), ...
%                 "AntennaHeight",app.AntennaHeightmetersEditField.Value, ...        % Units: meters
%                 "TransmitterFrequency",fq, ... % Units: Hz
%                 "TransmitterPower",app.TransmitterPowerwattsEditField.Value);        % Units: Watts
            rxs = rxsite("Name",app.receivers, ...
               "Latitude",app.receiverLat, ...
               "Longitude",app.receiverLon, ...
               "Antenna",design(dipole,fq1), ...
               "ReceiverSensitivity",app.ReceiverSentivityEditField.Value); % Units: dBm
            app.txa = tx;

            app.rxsa = rxs;

            viewer = siteviewer;
            show(tx)
            show(rxs)
            viewer.Basemap = "openstreetmap";

            coverage(tx,app.PropagationModelDropDown.Value, ...
               "SignalStrengths",app.ReceiverSentivityEditField.Value)
            sc = [0 0.3 0];
            link(rxs,tx,app.PropagationModelDropDown.Value,"SuccessColor",sc)
            
            

%             switch app.PropagationModelDropDown.Value
%                 case "freespace"
%                     pm = app.propagationModels{1};
%                 case "close-in"
%                     pm = app.propagationModels{2};
%                 case "rain"
%                     pm = app.propagationModels{3};
%                 case "gas"
%                     pm = app.propagationModels{4};
%                 case "fog"
%                     pm = app.propagationModels{5};
%                 case "longley-rice"
%                     pm = app.propagationModels{6};
%                 case "raytracing"
%                     siteviewer("Buildings", "map.osm");                    
%                     pm = app.propagationModels{7};
%             end
%             
%             
%             coverage([app.Transmitters{1:end}], [app.Receivers{1:end}], pm);


        end

        % Callback function
        function PlotDirectivityPatternButtonPushed(app, event)
            
            siteviewer("Buildings","map.osm", 'Visible', 'off');
%             siteNum = app.RandomSitesDropDown.Value;
            tx = app.Transmitters(1);
            disp(tx.Antenna)

%             tx = txsite("Name",string(siteNum),"Latitude",app.randLatitudes(siteNum),"Longitude",app.randLongitudes(siteNum), "TransmitterFrequency", transmitterFreq, "TransmitterPower", app.TransmitterPowerdBmEditField.Value, "AntennaHeight",1);


            size = [8 8];
            angle = 0;
            lambda = physconst("lightspeed") / tx.TransmitterFrequency;
            tx.Antenna  = phased.URA('Size',size,'Lattice','Rectangular','ArrayNormal','x');
            % The multiplication factor for lambda units to meter conversion
            tx.Antenna .ElementSpacing = [0.5 0.5]*lambda/2;

            numRows = size(1);
            numCols = size(2);

            % Calculate Row taper
            rwind = ones(1,numRows).';
            % Calculate Column taper
            cwind = ones(1,numCols).';
            % Calculate taper
            taper = rwind*cwind.';
            tx.Antenna .Taper = taper.';
            %
            % % % Create an sinc antenna element
            Elem = phased.SincAntennaElement;
            % Gaussian Antenna Element
            % Elem = phased.GaussianAntennaElement;
            Elem.FrequencyRange = [0 tx.TransmitterFrequency];
            Elem.Beamwidth = [10 10];
            tx.Antenna.Element = Elem;
            tx.AntennaAngle = angle;




            pm = propagationModel("raytracing","Method","image", "MaxNumReflections",1);
            pd = coverage256timed(tx,pm,'MaxRange', app.diagonalDistance / 2, 'Resolution', 1);

            pdTable = pd.Data;

%             filteredPdData = pdTable(pdTable.Latitude >= se_lat & pdTable.Latitude <= nw_lat & ...
%                 pdTable.Longitude >= nw_lon & pdTable.Longitude <= se_lon, :); % to filter out coordinates from power distribution table which are not in target region

%             disp(length(filteredPdData.Longitude))
            % Create a figure
            myFigure = figure;

            %                 % Set the desired pixel resolution
            %                 desiredWidth = 256;
            %                 desiredHeight = 256;
            %
            %                 % Calculate the aspect ratio of the figure
            %                 aspectRatio = desiredWidth / desiredHeight;
            %
            %                 % Set the figure size based on the desired resolution and aspect ratio
            %                 figPosition = get(myFigure, 'Position');
            %                 figPosition(3) = aspectRatio * figPosition(4);
            %                 set(myFigure, 'Position', figPosition);

            % Create your plot or visualization within the figure
            scatter(pdTable.Longitude, pdTable.Latitude, [], pdTable.Power, 'filled');
%             scatter(filteredPdData.Longitude, filteredPdData.Latitude, [], filteredPdData.Power, 'filled');
            colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
            colorbar; % Display colorbar to show the mapping of power to colors

            % Save the figure as a PNG file with the desired resolution
            set(myFigure, 'PaperPositionMode', 'auto'); % Ensure no cropping

%                 outputFileName = 'output_figure.png';
%                 print(myFigure, outputFileName, '-dpng', '-r0'); % '-r0' specifies using screen resolution
            
%             yagiAnt = design(yagiUda,6 * 1e9);
% 
%             % Tilt antenna to direct radiation in XY-plane (i.e. geographic azimuth)
%             disp(app.SizexEditField.Value)
%             disp(app.TiltAxisDropDown.Value)
% 
%             yagiAnt.Tilt = app.SizexEditField.Value;
%             yagiAnt.TiltAxis = app.TiltAxisDropDown.Value;
% 
%             f = figure;
% 
%             % Show directivity pattern
%             patternAzimuth(yagiAnt,6 * 1e9);
% 
%             % Get the content of the figure as an image
%             figImage = getframe(f);
%             imageData = figImage.cdata;
% 
%             % Display the image in the UIAxes
%             imshow(imageData, 'Parent', app.HeatMap);
%             app.txa(1).Antenna = yagiAnt;
% 
%             % Point main beam toward Boston, MA by assigning azimuth angle between
%             % transmitter location and Boston receiver location
%             app.txa(1).AntennaAngle = angle(app.txa(1), app.rxsa(1));
% 
%             % Define signal strengths from sensitivity to -60 dB
%             sigStrengths = app.ReceiverSentivityEditField.Value:5:-60;
%             sc = [0 0.3 0];
% 
%             % Update coverage map
%             coverage(app.txa,"rain","SignalStrengths",sigStrengths)
% 
%             link(app.rxsa,app.txa,"rain","SuccessColor",sc)
        end

        % Value changed function: BaseMapDropDown
        function BaseMapDropDownValueChanged(app, event)
            value = app.BaseMapDropDown.Value;

            geoplot(app.geoPlotAxes, app.transmitterLat, app.transmitterLon, 'p', 'MarkerFaceColor', 'auto', 'MarkerSize',20)
            hold(app.geoPlotAxes, 'on');
            geoplot(app.geoPlotAxes, app.receiverLat, app.receiverLon, 'p', 'MarkerFaceColor', 'blue', 'MarkerSize',20)
            hold(app.geoPlotAxes, 'on');
            geobasemap(app.geoPlotAxes, value)
        end

        % Button pushed function: PlotTargetRegionButton
        function PlotTargetRegionButtonPushed(app, event)
            app.TransmitterSitesListBox.Items = {};
            app.ReceiverSitesListBox.Items = {};
            app.transmitters = [];
            app.transmitterLat = [];
            app.transmitterLon = [];

            app.receivers = [];
            app.receiverLat = [];
            app.receiverLon = [];
            % Define the bounding box coordinates
            ne_latitude = app.SouthWestLatitudeEditField.Value;  % North-east latitude
            sw_longitude = app.NorthEastLongitudeEditField.Value;  % South-west longitude
            nw_latitude = app.NorthEastLatitudeEditField.Value;  % North-west latitude
            se_longitude = app.SouthWestLongitudeEditField.Value;  % South-east longitude

            % Plot the bounding box
            delete(app.geoPlotAxes)
            geoAxes = geoaxes(app.MapPanel);
            app.geoPlotAxes = geoAxes;
            geoplot(app.geoPlotAxes, [ne_latitude, ne_latitude, nw_latitude, nw_latitude, ne_latitude], [sw_longitude, se_longitude, se_longitude, sw_longitude, sw_longitude], 'g-.', 'LineWidth', 2);
            hold(app.geoPlotAxes, 'on')
            geobasemap(app.geoPlotAxes, app.BaseMapDropDown.Value)
        end

        % Button pushed function: UploadFileButton
        function UploadFileButtonPushed(app, event)
            [filename, filepath] = uigetfile('*.mat', 'Select .mat file');
            if isequal(filename, 0) || isequal(filepath, 0)
                % User canceled the file selection
                return;
            end

            app.PathofFileUploadedEditField.Value = [filepath filename];
            % Load the .mat file
            load(fullfile(filepath, filename));
            SiteType = data.SiteType;
            disp(SiteType)

            SiteName = data.Name;
            transmitterSiteNames = SiteName(SiteType == 0);
            receiverSiteNames = SiteName(SiteType == 1);
            app.transmitters = [app.transmitters, transmitterSiteNames];
            app.receivers = [app.receivers, receiverSiteNames];

            SiteLatitude = data.Latitude;
            transmitterSiteLatitude = SiteLatitude(SiteType == 0);
            receiverSiteLatitude = SiteLatitude(SiteType == 1);
            app.transmitterLat = [app.transmitterLat, transmitterSiteLatitude];
            app.receiverLat = [app.receiverLat, receiverSiteLatitude];

            SiteLongitude = data.Longitude;
            transmitterSiteLongitude = SiteLongitude(SiteType == 0);
            receiverSiteLongitude = SiteLongitude(SiteType == 1);
            app.transmitterLon = [app.transmitterLon, transmitterSiteLongitude];
            app.receiverLon = [app.receiverLon, receiverSiteLongitude];

            TransmitterAntenna = data.TransmitterAntenna;
            ReceiverAntenna = data.ReceiverAntenna;
            transmitterSiteAntenna = TransmitterAntenna(SiteType == 0);
            receiverSiteAntenna = ReceiverAntenna(SiteType == 1);
            app.transmitterAntenna = [app.transmitterAntenna, transmitterSiteAntenna];
            app.receiverAntenna = [app.receiverAntenna, receiverSiteAntenna];

            TransmitterAntennaAngle = data.TransmitterAntennaAngle;
            ReceiverAntennaAngle = data.ReceiverAntennaAngle;
            transmitterSiteAntennaAngle = TransmitterAntennaAngle(SiteType == 0);
            receiverSiteAntennaAngle = ReceiverAntennaAngle(SiteType == 1);
            app.transmitterAntennaAngle = [app.transmitterAntennaAngle, transmitterSiteAntennaAngle];
            app.receiverAntennaAngle = [app.receiverAntennaAngle, receiverSiteAntennaAngle];

            TransmitterAntennaHeight = data.TransmitterAntennaHeight;
            ReceiverAntennaHeight = data.ReceiverAntennaHeight;
            transmitterSiteAntennaHeight = TransmitterAntennaHeight(SiteType == 0);
            receiverSiteAntennaHeight = ReceiverAntennaHeight(SiteType == 1);
            app.transmitterAntennaHeight = [app.transmitterAntennaHeight, transmitterSiteAntennaHeight];
            app.receiverAntennaHeight = [app.receiverAntennaHeight, receiverSiteAntennaHeight];

            TransmitterAntennaPosition = data.TransmitterAntennaPosition;
            ReceiverAntennaPosition = data.ReceiverAntennaPosition;
            transmitterSiteAntennaPosition = TransmitterAntennaPosition(SiteType == 0);
            receiverSiteAntennaPosition = ReceiverAntennaPosition(SiteType == 1);
            app.transmitterAntennaPosition = [app.transmitterAntennaPosition, transmitterSiteAntennaPosition];
            app.receiverAntennaPosition = [app.receiverAntennaPosition, receiverSiteAntennaPosition];

            TransmitterSystemLoss = data.TransmitterSystemLoss;
            ReceiverSystemLoss = data.ReceiverSystemLoss;
            transmitterSiteSystemLoss = TransmitterSystemLoss(SiteType == 0);
            receiverSiteSystemLoss = ReceiverSystemLoss(SiteType == 1);
            app.transmitterSystemLoss = [app.transmitterSystemLoss, transmitterSiteSystemLoss];
            app.receiverSystemLoss = [app.receiverSystemLoss, receiverSiteSystemLoss];

            TransmitterFrequency = data.TransmitterFrequency;
            transmitterSiteFrequency = TransmitterFrequency(SiteType == 0);
            app.transmitterFrequency = [app.transmitterFrequency, transmitterSiteFrequency];

            TransmitterPower = data.TransmitterPower;
            transmitterSitePower = TransmitterPower(SiteType == 0);
            app.transmitterPower = [app.transmitterPower, transmitterSitePower];

            ReceiverSensitivity = data.ReceiverSensitivity;
            receiverSiteSentivity = ReceiverSensitivity(SiteType == 1);
            app.receiverSenstivity = [app.receiverSenstivity, receiverSiteSentivity];
            disp(transmitterSiteNames)
            for i = 1 : length(transmitterSiteNames)
                app.TransmitterSitesListBox.Items{end+1} = transmitterSiteNames{i};
            end

            for i = 1 : length(receiverSiteNames)
                app.ReceiverSitesListBox.Items{end+1} = receiverSiteNames{i};
            end


            geoplot(app.geoPlotAxes, app.transmitterLat, app.transmitterLon, 'p', 'MarkerFaceColor', 'auto', 'MarkerSize',20)
            hold(app.geoPlotAxes, 'on');
            geoplot(app.geoPlotAxes, app.receiverLat, app.receiverLon, 'p', 'MarkerFaceColor', 'blue', 'MarkerSize',20)
            hold(app.geoPlotAxes, 'on');
            geobasemap(app.geoPlotAxes, app.BaseMapDropDown.Value)


        end

        % Button pushed function: UploadFileButton_2
        function UploadFileButton_2Pushed(app, event)
            [filename, filepath] = uigetfile('*.mat', 'Select .mat file');
            if isequal(filename, 0) || isequal(filepath, 0)
                % User canceled the file selection
                return;
            end

            app.PathofFileUploadedEditField_2.Value = [filepath filename];
            % Load the .mat file
            load(fullfile(filepath, filename));
            app.dataset_file = data;

            nw_lat = data.nw_lat;  % northwest latitude for Main Campus
            nw_lon = data.nw_lon; % northwest longitude for Main Campus

            app.nw_Lati = nw_lat;
            app.nw_Longi = nw_lon;

            % Distance in meters
            distance = 256.5;

            % Earth's radius in meters
            radius = 6371000; % Mean radius of the Earth

            % Calculate the angular distance in radians
            angular_distance = distance / radius;

            % Calculate new latitude and longitude
            se_lat = nw_lat - rad2deg(angular_distance);
            se_lon = nw_lon + rad2deg(angular_distance / cosd(nw_lat));

            app.se_Lati = se_lat;
            app.se_Longi = se_lon;

            % Convert degrees to radians
            nwLatRad = deg2rad(nw_lat);
            nwLonRad = deg2rad(nw_lon);
            seLatRad = deg2rad(se_lat);
            seLonRad = deg2rad(se_lon);

            % Radius of the Earth in meters
            earthRadius = 6371000; % Approximate Earth radius in meters

            % Haversine formula
            deltaLat = seLatRad - nwLatRad;
            deltaLon = seLonRad - nwLonRad;
            a = sin(deltaLat/2)^2 + cos(nwLatRad) * cos(seLatRad) * sin(deltaLon/2)^2;
            c = 2 * atan2(sqrt(a), sqrt(1-a));
            app.diagonalDistance = earthRadius * c; % so that the coverage area radius can be big enough to cover all the coordinates



            n = 256;
            m = 256;

            sites = {};

            % Generate random coordinates within the bounding box
            num_points = (n*m); % specify the number of random points to generate
            ntr = (data.NumberofTransmitterinaRegion);
            app.NumberofSampleEditField.Value = num_points;

            % Calculate the latitude and longitude intervals for each cell
            latInterval = (nw_lat - se_lat) / n;
            lonInterval = (nw_lon - se_lon) / m;

            % Create empty arrays to store the north-west, south-east, and centroid coordinates
            nwLat = zeros(n, m);
            nwLon = zeros(n, m);
            seLat = zeros(n, m);
            seLon = zeros(n, m);
            centroidLatitude = zeros(n, m);
            centroidLongitude = zeros(n, m);
            latitudes = [];
            longitudes = [];
            sites = [];

            % Generate the matrix and calculate the coordinates
            for row = 1:n
                for col = 1:m
                    % Calculate the north-west and south-east coordinates for the current cell
                    nwLat(row, col) = nw_lat - (row - 1) * latInterval;
                    nwLon(row, col) = se_lon + (col - 1) * lonInterval;
                    seLat(row, col) = nw_lat - row * latInterval;
                    seLon(row, col) = se_lon + col * lonInterval;

                    % Calculate the centroid coordinate for the current cell
                    centroidLatitude(row, col) = (nwLat(row, col) + seLat(row, col)) / 2;
                    centroidLongitude(row, col) = (nwLon(row, col) + seLon(row, col)) / 2;
                    latitudes = [latitudes, ((nwLat(row, col) + seLat(row, col)) / 2)];
                    longitudes = [longitudes, ((nwLon(row, col) + seLon(row, col)) / 2)];
                    %                         sites = [sites, strcat(string(row),string(col))];
                end
            end
            longitudes = flip(longitudes); 

            app.centroidLat  = centroidLatitude;
            app.centroidLon = centroidLongitude;
            for row = 1:n
                for col = 1:m
                    sites = [sites, strcat(string(row),string(col))];
                end
            end
            app.siteN = sites;
            app.randLatitudes = latitudes;
            app.randLongitudes = longitudes;


            if(ntr == 1)

                app.RandomSitesDropDown_2.Items = sites;
                app.RandomSitesDropDown_2.ItemsData = 1:num_points;
                app.RandomSitesDropDownLabel_2.Visible = "on";
                app.RandomSitesDropDownLabel_2.Enable = "on";
                app.RandomSitesDropDown_2.Visible = "on";
                app.RandomSitesDropDown_2.Enable = "on";


                app.RandomTransmiterSite1DropDownLabel_2.Visible = "off";
                app.RandomTransmiterSite1DropDownLabel_2.Enable = "off";
                app.RandomTransmiterSite1DropDown_2.Visible = "off";
                app.RandomTransmiterSite1DropDown_2.Enable = "off";
                app.RandomTransmiterSite2DropDownLabel_2.Visible = "off";
                app.RandomTransmiterSite2DropDownLabel_2.Enable = "off";
                app.RandomTransmiterSite2DropDown_2.Visible = "off";
                app.RandomTransmiterSite2DropDown_2.Enable = "off";

                app.VisualizeSiteCoverageAreaButton_2.Visible = "on";
                app.VisualizeSiteCoverageAreaButton_2.Enable = "on";
%                 app.HeatMapbasedonGridButton.Visible = "on";
%                 app.HeatMapbasedonGridButton.Enable = "on";

            elseif(ntr == 2)



                app.RandomTransmiterSite1DropDown_2.Items = sites;
                app.RandomTransmiterSite1DropDown_2.ItemsData = 1:num_points;
                app.RandomTransmiterSite1DropDownLabel_2.Visible = "on";
                app.RandomTransmiterSite1DropDownLabel_2.Enable = "on";
                app.RandomTransmiterSite1DropDown_2.Visible = "on";
                app.RandomTransmiterSite1DropDown_2.Enable = "on";

                app.RandomTransmiterSite2DropDown_2.Items = sites;
                app.RandomTransmiterSite2DropDown_2.ItemsData = 1:num_points;
                app.RandomTransmiterSite2DropDownLabel_2.Visible = "on";
                app.RandomTransmiterSite2DropDownLabel_2.Enable = "on";
                app.RandomTransmiterSite2DropDown_2.Visible = "on";
                app.RandomTransmiterSite2DropDown_2.Enable = "on";
                app.RandomTransmiterSite2DropDown_2.Visible = "on";
                app.RandomTransmiterSite2DropDown_2.Enable = "on";

                app.VisualizeSiteCoverageAreaButton_2.Visible = "on";
                app.VisualizeSiteCoverageAreaButton_2.Enable = "on";

%                 app.HeatMapbasedonGridButton.Visible = "on";
%                 app.HeatMapbasedonGridButton.Enable = "on";


                app.RandomSitesDropDownLabel_2.Visible = "off";
                app.RandomSitesDropDownLabel_2.Enable = "off";
                app.RandomSitesDropDown_2.Visible = "off";
                app.RandomSitesDropDown_2.Enable = "off";
            end

            
        end

        % Button pushed function: GenerateRandomSitesButton
        function GenerateRandomSitesButtonPushed(app, event)
            % Define the bounding box coordinates
            nw_lat = app.NorthWestLatitudeEditField.Value;  % northwest latitude for Main Campus
            nw_lon = app.NorthWestLongitudeEditField.Value; % northwest longitude for Main Campus

            app.nw_Lati = nw_lat;
            app.nw_Longi = nw_lon;


            % Distance in meters
            distance = 256.5;

            % Earth's radius in meters
            radius = 6371000; % Mean radius of the Earth

            % Calculate the angular distance in radians
            angular_distance = distance / radius;

            % Calculate new latitude and longitude
            se_lat = nw_lat - rad2deg(angular_distance);
            se_lon = nw_lon + rad2deg(angular_distance / cosd(nw_lat));

            app.se_Lati = se_lat;
            app.se_Longi = se_lon;

            % Convert degrees to radians
            nwLatRad = deg2rad(nw_lat);
            nwLonRad = deg2rad(nw_lon);
            seLatRad = deg2rad(se_lat);
            seLonRad = deg2rad(se_lon);

            % Radius of the Earth in meters
            earthRadius = 6371000; % Approximate Earth radius in meters

            % Haversine formula
            deltaLat = seLatRad - nwLatRad;
            deltaLon = seLonRad - nwLonRad;
            a = sin(deltaLat/2)^2 + cos(nwLatRad) * cos(seLatRad) * sin(deltaLon/2)^2;
            c = 2 * atan2(sqrt(a), sqrt(1-a));
            app.diagonalDistance = earthRadius * c; % so that the coverage area radius can be big enough to cover all the coordinates



            n = 256;
            m = 256;

            sites = {};


            % Generate random coordinates within the bounding box
            num_points = (n*m); % specify the number of random points to generate
            ntr = str2double(app.NumberofTransmitterinaRegionDropDown.Value);
            app.NumberofSampleEditField.Value = num_points;


            % Calculate the latitude and longitude intervals for each cell
            latInterval = (nw_lat - se_lat) / n;
            lonInterval = (nw_lon - se_lon) / m;

            % Create empty arrays to store the north-west, south-east, and centroid coordinates
            nwLat = zeros(n, m);
            nwLon = zeros(n, m);
            seLat = zeros(n, m);
            seLon = zeros(n, m);
            centroidLatitude = zeros(n, m);
            centroidLongitude = zeros(n, m);
            latitudes = [];
            longitudes = [];
            sites = [];

            % Generate the matrix and calculate the coordinates
            for row = 1:n
                for col = 1:m
                    % Calculate the north-west and south-east coordinates for the current cell
                    nwLat(row, col) = nw_lat - (row - 1) * latInterval;
                    nwLon(row, col) = se_lon + (col - 1) * lonInterval;
                    seLat(row, col) = nw_lat - row * latInterval;
                    seLon(row, col) = se_lon + col * lonInterval;

                    % Calculate the centroid coordinate for the current cell
                    centroidLatitude(row, col) = (nwLat(row, col) + seLat(row, col)) / 2;
                    centroidLongitude(row, col) = (nwLon(row, col) + seLon(row, col)) / 2;
                    latitudes = [latitudes, ((nwLat(row, col) + seLat(row, col)) / 2)];
                    longitudes = [longitudes, ((nwLon(row, col) + seLon(row, col)) / 2)];
                    %                         sites = [sites, strcat(string(row),string(col))];
                end
            end
            longitudes = flip(longitudes); 

            app.centroidLat  = centroidLatitude;
            app.centroidLon = centroidLongitude;
            for row = 1:n
                for col = 1:m
                    sites = [sites, strcat(string(row),string(col))];
                end
            end
            app.siteN = sites;
            app.randLatitudes = latitudes;
            app.randLongitudes = longitudes;


            if(ntr == 1)

                app.RandomSitesDropDown.Items = sites;
                app.RandomSitesDropDown.ItemsData = 1:num_points;
                app.RandomSitesDropDownLabel.Visible = "on";
                app.RandomSitesDropDownLabel.Enable = "on";
                app.RandomSitesDropDown.Visible = "on";
                app.RandomSitesDropDown.Enable = "on";


                app.RandomTransmiterSite1DropDownLabel.Visible = "off";
                app.RandomTransmiterSite1DropDownLabel.Enable = "off";
                app.RandomTransmiterSite1DropDown.Visible = "off";
                app.RandomTransmiterSite1DropDown.Enable = "off";
                app.RandomTransmiterSite2DropDownLabel.Visible = "off";
                app.RandomTransmiterSite2DropDownLabel.Enable = "off";
                app.RandomTransmiterSite2DropDown.Visible = "off";
                app.RandomTransmiterSite2DropDown.Enable = "off";

                app.VisualizeSiteCoverageAreaButton.Visible = "on";
                app.VisualizeSiteCoverageAreaButton.Enable = "on";
%                 app.HeatMapbasedonGridButton.Visible = "on";
%                 app.HeatMapbasedonGridButton.Enable = "on";

            elseif(ntr == 2)



                app.RandomTransmiterSite1DropDown.Items = sites;
                app.RandomTransmiterSite1DropDown.ItemsData = 1:num_points;
                app.RandomTransmiterSite1DropDownLabel.Visible = "on";
                app.RandomTransmiterSite1DropDownLabel.Enable = "on";
                app.RandomTransmiterSite1DropDown.Visible = "on";
                app.RandomTransmiterSite1DropDown.Enable = "on";

                app.RandomTransmiterSite2DropDown.Items = sites;
                app.RandomTransmiterSite2DropDown.ItemsData = 1:num_points;
                app.RandomTransmiterSite2DropDownLabel.Visible = "on";
                app.RandomTransmiterSite2DropDownLabel.Enable = "on";
                app.RandomTransmiterSite2DropDown.Visible = "on";
                app.RandomTransmiterSite2DropDown.Enable = "on";
                app.RandomTransmiterSite2DropDown.Visible = "on";
                app.RandomTransmiterSite2DropDown.Enable = "on";

                app.VisualizeSiteCoverageAreaButton.Visible = "on";
                app.VisualizeSiteCoverageAreaButton.Enable = "on";

%                 app.HeatMapbasedonGridButton.Visible = "on";
%                 app.HeatMapbasedonGridButton.Enable = "on";


                app.RandomSitesDropDownLabel.Visible = "off";
                app.RandomSitesDropDownLabel.Enable = "off";
                app.RandomSitesDropDown.Visible = "off";
                app.RandomSitesDropDown.Enable = "off";
            end


        end

        % Button pushed function: VisualizeSiteCoverageAreaButton
        function VisualizeSiteCoverageAreaButtonPushed(app, event)
            ntr = str2double(app.NumberofTransmitterinaRegionDropDown.Value);
            n = 256;
            m = 256;

            num = app.TransmitterFrequencye9HzEditField_2.Value;
            str = 'e9';
            fq1 = str2double([num2str(num) str]);
            transmitterFreq = fq1; % Transmitter frequency in Hz


            nw_lat = app.nw_Lati;
            nw_lon = app.nw_Longi;

            se_lat = app.se_Lati;
            se_lon = app.se_Longi;
            
            num_points = n*m;
            if ntr == 1
                disp("open siteviewer start")
                tic
                siteviewer("Buildings","map.osm");
                toc
                disp("open siteviwer end")
                siteNum = app.RandomSitesDropDown.Value;
                tx = txsite("Name",string(siteNum),"Latitude",app.randLatitudes(siteNum),"Longitude",app.randLongitudes(siteNum), "TransmitterFrequency", transmitterFreq, "TransmitterPower", app.TransmitterPowerdBmEditField.Value, "AntennaHeight",1);


                size = [8 8];
                angle = 0;
                lambda = physconst("lightspeed") / tx.TransmitterFrequency;
                tx.Antenna  = phased.URA('Size',size,...
                    'Lattice','Rectangular','ArrayNormal','x');
                % The multiplication factor for lambda units to meter conversion
                tx.Antenna .ElementSpacing = [0.5 0.5]*lambda/2;

                numRows = size(1);
                numCols = size(2);

                % Calculate Row taper
                rwind = ones(1,numRows).';
                % Calculate Column taper
                cwind = ones(1,numCols).';
                % Calculate taper
                taper = rwind*cwind.';
                tx.Antenna .Taper = taper.';
                %
                % % % Create an sinc antenna element
                Elem = phased.SincAntennaElement;
                % Gaussian Antenna Element
                % Elem = phased.GaussianAntennaElement;
                Elem.FrequencyRange = [0 tx.TransmitterFrequency];
                Elem.Beamwidth = [10 10];
                tx.Antenna.Element = Elem;
                tx.AntennaAngle = angle;



                
                pm = propagationModel("raytracing","Method","image", "MaxNumReflections",1);
                pd = coverage256timed(tx,pm,'MaxRange', app.diagonalDistance / 2, 'Resolution', 1);             

                pdTable = pd.Data;

                filteredPdData = pdTable(pdTable.Latitude >= se_lat & pdTable.Latitude <= nw_lat & ...
                   pdTable.Longitude >= nw_lon & pdTable.Longitude <= se_lon, :); % to filter out coordinates from power distribution table which are not in target region                                

                disp(length(filteredPdData.Longitude))
                % Create a figure
                myFigure = figure;

%                 % Set the desired pixel resolution
%                 desiredWidth = 256;
%                 desiredHeight = 256;
% 
%                 % Calculate the aspect ratio of the figure
%                 aspectRatio = desiredWidth / desiredHeight;
% 
%                 % Set the figure size based on the desired resolution and aspect ratio
%                 figPosition = get(myFigure, 'Position');
%                 figPosition(3) = aspectRatio * figPosition(4);
%                 set(myFigure, 'Position', figPosition);

                % Create your plot or visualization within the figure
%                 scatter(pdTable.Longitude, pdTable.Latitude, [], pdTable.Power, 'filled');
                scatter(filteredPdData.Longitude, filteredPdData.Latitude, [], filteredPdData.Power, 'filled');
                colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
                colorbar; % Display colorbar to show the mapping of power to colors

                % Save the figure as a PNG file with the desired resolution
                set(myFigure, 'PaperPositionMode', 'auto'); % Ensure no cropping
                figImage = getframe(myFigure);
                imageData = figImage.cdata;
                app.showImageOnPreview(imageData);
                close(myFigure);

%                 outputFileName = 'output_figure.png';
%                 print(myFigure, outputFileName, '-dpng', '-r0'); % '-r0' specifies using screen resolution


            elseif ntr == 2
                siteNum1 = app.RandomTransmiterSite1DropDown.Value;
                siteNum2 = app.RandomTransmiterSite2DropDown.Value;
                viewer = siteviewer("Buildings","map.osm");
                tx = txsite("Name",[string(siteNum1) string(siteNum2)], ...
                    "Latitude",[app.randLatitudes(siteNum1) app.randLatitudes(siteNum2)], ...
                    "Longitude",[app.randLongitudes(siteNum1) app.randLongitudes(siteNum2)], ...
                    "TransmitterFrequency", transmitterFreq, ...
                    "TransmitterPower", app.TransmitterPowerdBmEditField.Value);
                size = [8 8];
                angle = 0;
                lambda = physconst("lightspeed") / tx.TransmitterFrequency;
                tx.Antenna  = phased.URA('Size',size,...
                    'Lattice','Rectangular','ArrayNormal','x');
                % The multiplication factor for lambda units to meter conversion
                tx.Antenna .ElementSpacing = [0.5 0.5]*lambda/2;

                numRows = size(1);
                numCols = size(2);

                % Calculate Row taper
                rwind = ones(1,numRows).';
                % Calculate Column taper
                cwind = ones(1,numCols).';
                % Calculate taper
                taper = rwind*cwind.';
                tx.Antenna .Taper = taper.';
                %
                % % % Create an sinc antenna element
                Elem = phased.SincAntennaElement;
                % Gaussian Antenna Element
                % Elem = phased.GaussianAntennaElement;
                Elem.FrequencyRange = [0 tx.TransmitterFrequency];
                Elem.Beamwidth = [10 10];
                tx.Antenna.Element = Elem;
                tx.AntennaAngle = angle;

                pd = coverage256(tx,'PropagationModel','raytracing', 'MaxRange', app.diagonalDistance, 'Resolution', 1);
                pdTable = pd.Data;

                filteredPdData = pdTable(pdTable.Latitude >= se_lat & pdTable.Latitude <= nw_lat & ...
                    pdTable.Longitude >= nw_lon & pdTable.Longitude <= se_lon, :); % to filter out coordinates from power distribution table which are not in target region

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

                % Create your plot or visualization within the figure
                scatter(filteredPdData.Longitude, filteredPdData.Latitude, [], filteredPdData.Power, 'filled');
                colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
                colorbar; % Display colorbar to show the mapping of power to colors

                % Save the figure as a PNG file with the desired resolution
                set(myFigure, 'PaperPositionMode', 'auto'); % Ensure no cropping

                outputFileName = 'output_figure.png';
                print(myFigure, outputFileName, '-dpng', '-r0'); % '-r0' specifies using screen resolution
            end
        end

        % Button pushed function: VisualizeSiteCoverageAreaButton_2
        function VisualizeSiteCoverageAreaButton_2Pushed(app, event)
            data_file = app.dataset_file;
            ntr = data_file.NumberofTransmitterinaRegion;
            n = 256;
            m = 256;

            num = data_file.TransmitterFrequency;
            str = 'e9';
            fq1 = str2double([num2str(num) str]);
            transmitterFreq = fq1; % Transmitter frequency in Hz
            transPower = data_file.TransmitterPower;


            nw_lat = app.nw_Lati;
            nw_lon = app.nw_Longi;

            se_lat = app.se_Lati;
            se_lon = app.se_Longi;
            
            num_points = n*m;
            if ntr == 1
                disp("open siteviewer start")
                tic
                siteviewer("Buildings","map.osm");
                toc
                disp("open siteviwer end")
                siteNum = app.RandomSitesDropDown_2.Value;
                tx = txsite("Name",string(siteNum),"Latitude",app.randLatitudes(siteNum),"Longitude",app.randLongitudes(siteNum), "TransmitterFrequency", transmitterFreq, "TransmitterPower", transPower, "AntennaHeight",1);


                size = [8 8];
                angle = 0;
                lambda = physconst("lightspeed") / tx.TransmitterFrequency;
                tx.Antenna  = phased.URA('Size',size,...
                    'Lattice','Rectangular','ArrayNormal','x');
                % The multiplication factor for lambda units to meter conversion
                tx.Antenna .ElementSpacing = [0.5 0.5]*lambda/2;

                numRows = size(1);
                numCols = size(2);

                % Calculate Row taper
                rwind = ones(1,numRows).';
                % Calculate Column taper
                cwind = ones(1,numCols).';
                % Calculate taper
                taper = rwind*cwind.';
                tx.Antenna .Taper = taper.';
                %
                % % % Create an sinc antenna element
                Elem = phased.SincAntennaElement;
                % Gaussian Antenna Element
                % Elem = phased.GaussianAntennaElement;
                Elem.FrequencyRange = [0 tx.TransmitterFrequency];
                Elem.Beamwidth = [10 10];
                tx.Antenna.Element = Elem;
                tx.AntennaAngle = angle;



                
                pm = propagationModel("raytracing","Method","image", "MaxNumReflections",1);
                pd = coverage256timed(tx,pm,'MaxRange', app.diagonalDistance / 2, 'Resolution', 1);             

                pdTable = pd.Data;

                filteredPdData = pdTable(pdTable.Latitude >= se_lat & pdTable.Latitude <= nw_lat & ...
                   pdTable.Longitude >= nw_lon & pdTable.Longitude <= se_lon, :); % to filter out coordinates from power distribution table which are not in target region                                

                disp(length(filteredPdData.Longitude))
                % Create a figure
                myFigure = figure;

%                 % Set the desired pixel resolution
%                 desiredWidth = 256;
%                 desiredHeight = 256;
% 
%                 % Calculate the aspect ratio of the figure
%                 aspectRatio = desiredWidth / desiredHeight;
% 
%                 % Set the figure size based on the desired resolution and aspect ratio
%                 figPosition = get(myFigure, 'Position');
%                 figPosition(3) = aspectRatio * figPosition(4);
%                 set(myFigure, 'Position', figPosition);

                % Create your plot or visualization within the figure
%                 scatter(pdTable.Longitude, pdTable.Latitude, [], pdTable.Power, 'filled');
                scatter(filteredPdData.Longitude, filteredPdData.Latitude, [], filteredPdData.Power, 'filled');
                colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
                colorbar; % Display colorbar to show the mapping of power to colors

                % Save the figure as a PNG file with the desired resolution
                set(myFigure, 'PaperPositionMode', 'auto'); % Ensure no cropping
                figImage = getframe(myFigure);
                imageData = figImage.cdata;
                app.showImageOnPreview(imageData);
                close(myFigure);

%                 outputFileName = 'output_figure.png';
%                 print(myFigure, outputFileName, '-dpng', '-r0'); % '-r0' specifies using screen resolution


            elseif ntr == 2
                siteNum1 = app.RandomTransmiterSite1DropDown.Value;
                siteNum2 = app.RandomTransmiterSite2DropDown.Value;
                viewer = siteviewer("Buildings","map.osm");
                tx = txsite("Name",[string(siteNum1) string(siteNum2)], ...
                    "Latitude",[app.randLatitudes(siteNum1) app.randLatitudes(siteNum2)], ...
                    "Longitude",[app.randLongitudes(siteNum1) app.randLongitudes(siteNum2)], ...
                    "TransmitterFrequency", transmitterFreq, ...
                    "TransmitterPower", app.TransmitterPowerdBmEditField.Value);
                size = [8 8];
                angle = 0;
                lambda = physconst("lightspeed") / tx.TransmitterFrequency;
                tx.Antenna  = phased.URA('Size',size,...
                    'Lattice','Rectangular','ArrayNormal','x');
                % The multiplication factor for lambda units to meter conversion
                tx.Antenna .ElementSpacing = [0.5 0.5]*lambda/2;

                numRows = size(1);
                numCols = size(2);

                % Calculate Row taper
                rwind = ones(1,numRows).';
                % Calculate Column taper
                cwind = ones(1,numCols).';
                % Calculate taper
                taper = rwind*cwind.';
                tx.Antenna .Taper = taper.';
                %
                % % % Create an sinc antenna element
                Elem = phased.SincAntennaElement;
                % Gaussian Antenna Element
                % Elem = phased.GaussianAntennaElement;
                Elem.FrequencyRange = [0 tx.TransmitterFrequency];
                Elem.Beamwidth = [10 10];
                tx.Antenna.Element = Elem;
                tx.AntennaAngle = angle;

                pd = coverage256(tx,'PropagationModel','raytracing', 'MaxRange', app.diagonalDistance, 'Resolution', 1);
                pdTable = pd.Data;

                filteredPdData = pdTable(pdTable.Latitude >= se_lat & pdTable.Latitude <= nw_lat & ...
                    pdTable.Longitude >= nw_lon & pdTable.Longitude <= se_lon, :); % to filter out coordinates from power distribution table which are not in target region

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

                % Create your plot or visualization within the figure
                scatter(filteredPdData.Longitude, filteredPdData.Latitude, [], filteredPdData.Power, 'filled');
                colormap jet; % Use the 'jet' colormap, you can replace it with other colormaps
                colorbar; % Display colorbar to show the mapping of power to colors

                % Save the figure as a PNG file with the desired resolution
                set(myFigure, 'PaperPositionMode', 'auto'); % Ensure no cropping

                outputFileName = 'output_figure.png';
                print(myFigure, outputFileName, '-dpng', '-r0'); % '-r0' specifies using screen resolution
            end
        end

        % Callback function
        function HeatMapbasedonGridButtonPushed(app, event)
            [n, m] = app.getGridSize();
            [tiltAngle, tiltAxis] = app.getTiltSettings();
            ntr = str2double(app.NumberofTransmitterinaRegionDropDown.Value);
            % Set transmitter parameters (adjust according to your specific scenario)
            num = app.TransmitterFrequencye9HzEditField_2.Value;
            str = 'e9';
            fq1 = str2double([num2str(num) str]);
            transmitterFreq = fq1; % Transmitter frequency in Hz
            transmitterPow = app.TransmitterPowerdBmEditField.Value; % Transmitter power in dBm
            % Initialize the received power matrix
            totalCentroids = numel(app.centroidLat);
            receivedPowerMatrix = zeros(totalCentroids, 1);
            if ntr == 1
                siteNum = app.RandomSitesDropDown.Value;
                transLat  = app.randLatitudes(siteNum);
                transLon = app.randLongitudes(siteNum);
                receivedPowerMatrix = zeros(totalCentroids, 1);

                for i = 1:totalCentroids
                    tx = txsite('Latitude',transLat,'Longitude',transLon, ...
                        'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);
                    yagiAnt = design(yagiUda, transmitterFreq);

                    yagiAnt.Tilt = tiltAngle;
                    yagiAnt.TiltAxis = tiltAxis;

                    tx.Antenna = yagiAnt;

                    rx = rxsite('Latitude',app.centroidLat(i),'Longitude',app.centroidLon(i));

                    % Calculate the distance from the transmitter to each centroid coordinate
                    %                 distance = haversine(transLat, transLon, app.centroidLat(i), app.centroidLon(i));

                    pm = propagationModel("raytracing");
                    ss = sigstrength(rx,tx,pm);
                    % Calculate the received power at the centroid using the Friis transmission equation
                    %                 receivedPower = transmitterPow - pathloss(pm,rx,tx);

                    % Store the received power in the matrix
                    receivedPowerMatrix(i) = ss;

                end

            elseif ntr == 2
                siteNum1 = app.RandomTransmiterSite1DropDown.Value;
                siteNum2 = app.RandomTransmiterSite2DropDown.Value;
                receivedPowerMatrix = zeros(totalCentroids, 1);

                for i = 1:totalCentroids
                    tx = txsite('Latitude',[app.randLatitudes(siteNum1) app.randLatitudes(siteNum2)],'Longitude',[app.randLongitudes(siteNum1) app.randLongitudes(siteNum2)], ...
                        'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);

                    rx = rxsite('Latitude',app.centroidLat(i),'Longitude',app.centroidLon(i));
                    % Calculate the distance from the transmitter to each centroid coordinate
                    %                 distance = haversine(transLat, transLon, app.centroidLat(i), app.centroidLon(i));
                    yagiAnt = design(yagiUda, transmitterFreq);

                    yagiAnt.Tilt = tiltAngle;
                    yagiAnt.TiltAxis = tiltAxis;

                    tx(1).Antenna = yagiAnt;
                    tx(2).Antenna = yagiAnt;

                    pm = propagationModel("raytracing");
                    ss = sigstrength(rx,tx,pm);

                    % Calculate the combined signal strength (power sum)
                    % This formula converts the signal strengths into
                    % linear scales and then add them together and converts
                    % back to dB from linear scale
                    % For actual combined signal strength we need to
                    % consider the factors distance, path loss, fading,
                    % interference, and other relevant paramenters (mainly wireless system being adopted).
                    combinedSignalStrength = 10*log10(sum(10.^(ss./10)));

                    % Store the received power in the matrix
                    receivedPowerMatrix(i) = combinedSignalStrength;
                end
            end

            % Reshape the received power values back into the n-by-m matrix
            receivedPowerMatrix = reshape(receivedPowerMatrix, n, m);
            disp(receivedPowerMatrix)

            % Create a heatmap of the received power matrix
            figure;
            imagesc(receivedPowerMatrix);

            % Customize the colormap
            colormap jet; % Choose a colormap (e.g., jet, parula, colormap name)
            colorbar;     % Display a colorbar

            %             elapsed_time = toc;

            %             app.TimeTakenforpreparingHeatMapEditField.Value = elapsed_time;

        end

        % Button pushed function: SaveButton
        function SaveButtonPushed(app, event)
            app.StatusEditField.Value = "Saving Started";
            [n, m] = app.getGridSize();
            [tiltAngle, tiltAxis] = app.getTiltSettings();
            num_points = n*m;
            siteNames = 1:num_points;

            ntr = str2double(app.NumberofTransmitterinaRegionDropDown.Value);
            %% NTR = 1
            if ntr == 1

                index_table = table(app.siteN', app.randLatitudes', app.randLongitudes', 'VariableNames', {'SiteName', 'Latitude', 'Longitude'});

                for i = 1 : num_points
                    %                     siteNum = app.RandomSitesDropDown.Value;
                    transLat  = app.randLatitudes(i);
                    transLon = app.randLongitudes(i);

                    % Set transmitter parameters (adjust according to your specific scenario)
                    transmitterFreq = 1.9e9; % Transmitter frequency in Hz
                    transmitterPow = 10; % Transmitter power in dBm

                    tx = txsite('Latitude',transLat,'Longitude',transLon, ...
                        'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);
                    yagiAnt = design(yagiUda, transmitterFreq);

                    yagiAnt.Tilt = tiltAngle;
                    yagiAnt.TiltAxis = tiltAxis;

                    tx.Antenna = yagiAnt;

                    totalCentroids = numel(app.centroidLat);

                    % Initialize the received power matrix
                    receivedPowerMatrix = zeros(totalCentroids, 1);
                    for j = 1 : totalCentroids
                        rx = rxsite('Latitude',app.centroidLat(j),'Longitude',app.centroidLon(j));

                        % Calculate the distance from the transmitter to each centroid coordinate
                        %                 distance = haversine(transLat, transLon, app.centroidLat(i), app.centroidLon(i));

                        pm = propagationModel("raytracing", "Method", "sbr", "BuildingsMaterial","perfect-reflector");
                        ss = sigstrength(rx,tx,pm);
                        % Calculate the received power at the centroid using the Friis transmission equation
                        %                 receivedPower = transmitterPow - pathloss(pm,rx,tx);

                        % Store the received power in the matrix
                        receivedPowerMatrix(j) = ss;
                    end

                    % Reshape the received power values back into the n-by-m matrix
                    receivedPowerMatrix = reshape(receivedPowerMatrix, n, m);

                    % Create a heatmap of the received power matrix
                    fig = figure('Visible', 'off');
                    imagesc(receivedPowerMatrix);
                    % Customize the colormap
                    colormap jet; % Choose a colormap (e.g., jet, parula, colormap name)
                    colorbar;     % Display a colorbar
                    title('Received Power Heatmap');

                    app.figs = [app.figs, fig];
                    figFilename = sprintf('figure_%d.png', i);
                    pod = string(app.PathofDirectoryEditField.Value);
                    pathAddress = strcat(pod,"\");
                    fullFilePath = fullfile(pathAddress, figFilename);
                    saveas(fig, fullFilePath);



                end

                for i = 1 : num_points
                    tx = txsite("Name",string(i),"Latitude",app.randLatitudes(i),"Longitude",app.randLongitudes(i));
                    yagiAnt = design(yagiUda, transmitterFreq);

                    yagiAnt.Tilt = tiltAngle;
                    yagiAnt.TiltAxis = tiltAxis;

                    tx.Antenna = yagiAnt;
                    pd = coverage(tx,'PropagationModel','raytracing',"SignalStrengths",-90,5:-60);
                    pd_table = pd.Data;
                    filename = strcat(string(i),".csv");
                    pod = string(app.PathofDirectoryEditField.Value);
                    pathAddress = strcat(pod,"\");
                    filepath = strcat(pathAddress, filename);
                    % Save the table to a CSV file
                    writetable(pd_table, filepath);

                end

                filename = strcat("index_table",".csv");
                filepath = strcat(pathAddress, filename);
                writetable(index_table, filepath);
                app.StatusEditField.Value = "Saving Successful";
                %% NTR = 2
            elseif ntr == 2
                site1TransLat = [];
                site2TransLat = [];
                site1TransLon = [];
                site2TransLon = [];
                sites2Trans = [];
                for k = 1 : length(app.randLatitudes)
                    for j = 1 : length(app.randLatitudes)
                        siteNum1 = k;
                        siteNum2 = j;
                        site1TransLat = [site1TransLat app.randLatitudes(k)];
                        site1TransLon = [site1TransLon app.randLongitudes(k)];
                        site2TransLat = [site2TransLat app.randLatitudes(j)];
                        site2TransLon = [site2TransLon app.randLongitudes(j)];
                        a = string(app.siteN(k)+ "-");
                        sites2Trans = [sites2Trans strcat(string(a),(app.siteN(j)))];
                        receivedPowerMatrix = zeros(numel(app.centroidLat), 1);
                        % Set transmitter parameters (adjust according to your specific scenario)
                        num = app.TransmitterFrequencye9HzEditField_2.Value;
                        str = 'e9';
                        fq1 = str2double([num2str(num) str]);
                        transmitterFreq = fq1; % Transmitter frequency in Hz
                        transmitterPow = app.TransmitterPowerdBmEditField.Value;

                        for i = 1:numel(app.centroidLat)
                            tx = txsite('Latitude',[app.randLatitudes(siteNum1) app.randLatitudes(siteNum2)],'Longitude',[app.randLongitudes(siteNum1) app.randLongitudes(siteNum2)], ...
                                'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);

                            rx = rxsite('Latitude',app.centroidLat(i),'Longitude',app.centroidLon(i));

                            yagiAnt = design(yagiUda, transmitterFreq);

                            yagiAnt.Tilt = tiltAngle;
                            yagiAnt.TiltAxis = tiltAxis;

                            tx(1).Antenna = yagiAnt;
                            tx(2).Antenna = yagiAnt;

                            pm = propagationModel("raytracing", "Method", "sbr", "BuildingsMaterial","perfect-reflector");
                            ss = sigstrength(rx,tx,pm);
                            disp("The signal strength is "+ss)
                            %                             y = isinf(ss(1));
                            %                             if y == 1
                            %                                 ss(1) = (-1000);
                            %                             end
                            %                             y = isinf(ss(2));
                            %                             if y == 1
                            %                                 ss(2) = (-1000);
                            %                             end

                            % Calculate the combined signal strength (power sum)
                            combinedSignalStrength = 10*log10(sum(10.^(ss./10)));

                            % Store the received power in the matrix
                            receivedPowerMatrix(i) = combinedSignalStrength;

                        end

                        % Reshape the received power values back into the n-by-m matrix
                        receivedPowerMatrix = reshape(receivedPowerMatrix, n, m);

                        % Create a heatmap of the received power matrix
                        fig = figure('Visible', 'off');
                        imagesc(receivedPowerMatrix);
                        % Customize the colormap
                        colormap jet; % Choose a colormap (e.g., jet, parula, colormap name)
                        colorbar;     % Display a colorbar
                        title('Received Power Heatmap');

                        app.figs = [app.figs, fig];
                        figFilename = sprintf('figure_%d_%d.png', k, j);
                        pod = string(app.PathofDirectoryEditField.Value);
                        pathAddress = strcat(pod,"\");
                        fullFilePath = fullfile(pathAddress, figFilename);
                        saveas(fig, fullFilePath);

                        disp("done")
                    end
                end

                index_table = table(sites2Trans', site1TransLat', site1TransLon', site2TransLat', site2TransLon', 'VariableNames', {'SiteName', 'Transmitter Site 1 Latitude', 'Transmitter Site 1 Longitude', 'Transmitter Site 2 Latitude', 'Transmitter Site 2 Longitude'});

                for k = 1 : length(app.randLatitudes)
                    for j = 1 : length(app.randLatitudes)
                        siteNum1 = k;
                        siteNum2 = j;

                        num = app.TransmitterFrequencye9HzEditField_2.Value;
                        str = 'e9';
                        fq1 = str2double([num2str(num) str]);
                        transmitterFreq = fq1; % Transmitter frequency in Hz
                        transmitterPow = app.TransmitterPowerdBmEditField.Value;
                        tx = txsite('Latitude',[app.randLatitudes(siteNum1) app.randLatitudes(siteNum2)],'Longitude',[app.randLongitudes(siteNum1) app.randLongitudes(siteNum2)], ...
                            'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);
                        yagiAnt = design(yagiUda, transmitterFreq);

                        yagiAnt.Tilt = tiltAngle;
                        yagiAnt.TiltAxis = tiltAxis;

                        tx(1).Antenna = yagiAnt;
                        tx(2).Antenna = yagiAnt;
                        pd = coverage(tx,'PropagationModel','raytracing',"SignalStrengths",-90:5:-60);
                        pd_table = pd.Data;
                        siteName = strcat(string(k),string(j));
                        filename = strcat(siteName,".csv");
                        pod = string(app.PathofDirectoryEditField.Value);
                        pathAddress = strcat(pod,"\");
                        filepath = strcat(pathAddress, filename);
                        % Save the table to a CSV file
                        writetable(pd_table, filepath);

                        %                         for i = 1:numel(app.centroidLat)
                        %                             tx = txsite('Latitude',[app.randLatitudes(siteNum1) app.randLatitudes(siteNum2)],'Longitude',[app.randLongitudes(siteNum1) app.randLongitudes(siteNum2)], ...
                        %                                 'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);
                        %                             pd = coverage(tx,'PropagationModel','raytracing',"SignalStrengths",-500:0);
                        %                             pd_table = pd.Data;
                        %                             filename = strcat(string(i),".csv");
                        %                             pod = string(app.PathofDirectoryEditField.Value);
                        %                             pathAddress = strcat(pod,"\");
                        %                             filepath = strcat(pathAddress, filename);
                        %                             % Save the table to a CSV file
                        %                             writetable(pd_table, filepath);
                        %
                        %                         end

                    end
                end
                filename = strcat("index_table",".csv");
                filepath = strcat(pathAddress, filename);
                writetable(index_table, filepath);
                app.StatusEditField.Value = "Saving Successful";




            end
            %%



        end

        % Callback function
        function nEditFieldValueChanged(app, event)
            [n, m] = app.getGridSize();
            app.NumberofSampleEditField.Value = (n * m);
        end

        % Value changed function: mEditField
        function mEditFieldValueChanged(app, event)
            [n, m] = app.getGridSize();
            app.NumberofSampleEditField.Value = (n * m);
        end

        % Callback function
        function DirectivityPatternSwitchValueChanged(app, event)
            if ~(isprop(app, 'DirectivityPatternSwitch') && ~isempty(app.DirectivityPatternSwitch) && isvalid(app.DirectivityPatternSwitch))
                return;
            end

            value = app.DirectivityPatternSwitch.Value;
            showExtendedTilt = value == "On";
            visibilityValue = 'off';
            if showExtendedTilt
                visibilityValue = 'on';
            end

            if isprop(app, 'TiltAxisDropDown_2') && ~isempty(app.TiltAxisDropDown_2) && isvalid(app.TiltAxisDropDown_2)
                app.TiltAxisDropDown_2.Visible = visibilityValue;
            end
            if isprop(app, 'TiltAxisDropDown_2Label') && ~isempty(app.TiltAxisDropDown_2Label) && isvalid(app.TiltAxisDropDown_2Label)
                app.TiltAxisDropDown_2Label.Visible = visibilityValue;
            end
            if isprop(app, 'SizeyEditField') && ~isempty(app.SizeyEditField) && isvalid(app.SizeyEditField)
                app.SizeyEditField.Visible = visibilityValue;
            end
            if isprop(app, 'SizeyEditFieldLabel') && ~isempty(app.SizeyEditFieldLabel) && isvalid(app.SizeyEditFieldLabel)
                app.SizeyEditFieldLabel.Visible = visibilityValue;
            end
        end

        % Button pushed function: MobilityButton
        function MobilityButtonPushed(app, event)
            % Create the popup window
            popup = uifigure('Position', [100 100 510 200], 'Name', "Advanced Ray Tracing Properties");
            popup.Scrollable = 'on';

            label11 = uilabel(popup, 'Text', 'Transmitter Latitude:');
            label11.Position = [30 100 160 20];
            editField11 = uieditfield(popup, 'numeric', 'Value', 33.2098);
            editField11.Position = [170 100 70 20];

            label12 = uilabel(popup, 'Text', 'Transmitter Longitude:');
            label12.Position = [250 100 160 20];
            editField12 = uieditfield(popup, 'numeric', 'Value', -97.1449);
            editField12.Position = [430 100 70 20];
            
            % Create the submit button
            uploadButton = uibutton(popup, 'push');
            uploadButton.Text = 'Upload File';
            uploadButton.Position = [230 50 100 20];
            uploadButton.ButtonPushedFcn = @(btn,event) uploadFileCallback(app, popup);

            pathLabel = uilabel(popup, 'Text', 'No file selected', ...
                'Position', [30, 20, 190, 20]);

            

            

            % Callback function for the "Upload File" button in the pop-up
            function uploadFileCallback(app, popup)
                % Open a file dialog for the user to select the file
                [filename, filepath] = uigetfile('*.mat', 'Select the .mat File');

                % Check if the user selected a file
                if ischar(filename) && ischar(filepath)
                    % File selected, update the file path label
                    pathLabel.Text = fullfile(filepath, filename);
                    app.mobilityFilePath = filepath;
                    app.mobilityFileName = filename;
                else
                    return;
                end

                load(fullfile(app.mobilityFilePath, app.mobilityFileName));
                t = data.timeStamp;
                rLati = data.Latitude;
                rLongi = data.Longitude;

                transLat = editField11.Value;
                transLon = editField12.Value;
                num = 5.9;
                str = 'e9';
                fq1 = str2double([num2str(num) str]);
                transmitterFreq = fq1; % Transmitter frequency in Hz
                transmitterPow = 23; % Transmitter power in dBm
                transpow = zeros(numel(t), 1);

                tx = txsite('Latitude',transLat,'Longitude',transLon, ...
                    'TransmitterFrequency', transmitterFreq, "TransmitterPower", transmitterPow);
                for i = 1:numel(t)
                    rx = rxsite('Latitude',rLati(i),'Longitude',rLongi(i));
                    pm = propagationModel("raytracing");
                    ss = sigstrength(rx,tx,pm);
                    transpow(i) = ss;
                end
                uialert(popup, sprintf('Computed %d mobility samples.', numel(transpow)), 'Mobility');
            end
%             app.AdvancedRayTracingPropertiesPanel.Visible = 'on';



        end

        % Button pushed function: AdvancedAntennaPropertiesButton
        function AdvancedAntennaPropertiesButtonPushed(app, event)
            popup = uifigure('Position', [100 100 420 300], 'Name', "Advanced Antenna Properties");
            popup.Scrollable = 'on';

            label11 = uilabel(popup, 'Text', 'Azimuth Angle Min:');
            label11.Position = [30 250 160 20];
            editField11 = uieditfield(popup, 'numeric');
            editField11.Position = [170 250 40 20];

            label12 = uilabel(popup, 'Text', 'Azimuth Angle Max:');
            label12.Position = [220 250 160 20];
            editField12 = uieditfield(popup, 'numeric');
            editField12.Position = [370 250 40 20];

            label21 = uilabel(popup, 'Text', 'Elevation Angle Min:');
            label21.Position = [30 220 160 20];
            editField21 = uieditfield(popup, 'numeric');
            editField21.Position = [170 220 40 20];

            label22 = uilabel(popup, 'Text', 'Elevation Angle Max:');
            label22.Position = [220 220 160 20];
            editField22 = uieditfield(popup, 'numeric');
            editField22.Position = [370 220 40 20];

            label31 = uilabel(popup, 'Text', 'Max Side-Lobe Attenuation:');
            label31.Position = [30 180 160 20];
            editField31 = uieditfield(popup, 'numeric');
            editField31.Position = [170 180 40 20];

            label41 = uilabel(popup, 'Text', 'Tilt (deg):');
            label41.Position = [30 150 160 20];
            editField41 = uieditfield(popup, 'numeric');
            editField41.Position = [170 150 40 20];


            % Create the submit button
            submitButton = uibutton(popup, 'push');
            submitButton.Text = 'Submit';
            submitButton.Position = [180 50 50 30];
            submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed( ...
                editField11.Value, ...
                editField12.Value, ...
                editField21.Value, ...
                editField22.Value, ...
                editField31.Value, ...
                editField41.Value);

            % Function to handle the submit button press
            function submitButtonPushed(input1, input2, input3, input4, input5, input6)
                % Perform any desired actions with the input values
                azvec = -(input1):input2; % Azimuth angles (deg)
                elvec = -(input3):input4; % Elevation angles (deg)
                SLA = input5; % Maximum side-lobe level attenuation (dB)
                tilt = input6; % Tilt angle (deg)
                az3dB = 65; % 3 dB beamwidth in azimuth (deg)
                el3dB = 65; % 3 dB beamwidth in elevation (deg)
                lambda = physconst("lightspeed")/1.9e9; % Wavelength (m)

                [az,el] = meshgrid(azvec,elvec);
                azMagPattern = -min(12*(az/az3dB).^2,SLA);
                elMagPattern = -min(12*((el-tilt)/el3dB).^2,SLA);
                combinedMagPattern = -min(-(azMagPattern + elMagPattern),SLA); % Relative antenna gain (dB)
                antennaElement = phased.CustomAntennaElement("MagnitudePattern",combinedMagPattern);

                [n, m] = app.getGridSize();
                [tiltAngle, tiltAxis] = app.getTiltSettings();

                num = app.TransmitterFrequencye9HzEditField_2.Value;
                str = 'e9';
                fq1 = str2double([num2str(num) str]);
                transmitterFreq = fq1; % Transmitter frequency in Hz


                num_points = n*m;
                if isempty(app.randLatitudes) || isempty(app.randLongitudes)
                    uialert(app.UIFigure, 'Generate or load random sites before previewing advanced antenna properties.', 'Antenna Preview');
                    close(popup);
                    return;
                end
                viewer = siteviewer("Buildings","map.osm");
                siteNum = 1;
                if ~isempty(app.RandomSitesDropDown.ItemsData)
                    siteNum = app.RandomSitesDropDown.Value;
                end
                tx = txsite("Name",string(siteNum),"Latitude",app.randLatitudes(siteNum),"Longitude",app.randLongitudes(siteNum), "TransmitterFrequency", 1.9e9);
                tx.Antenna = phased.URA("Size",[8 8], ...
                    "Element",antennaElement, ...
                    "ElementSpacing",[lambda/2 lambda/2]);
                tx.AntennaAngle = tiltAngle;

                clearMap(viewer)
                pattern(tx,"Transparency",0.6)
%                 coverage(tx,'PropagationModel','raytracing',"SignalStrengths",-500:0)



                % Close the popup window
                close(popup);
            end

        end

        % Button pushed function: AdvancedPropertiesButton
        function AdvancedPropertiesButtonPushed(app, event)
            
            
            switch app.PropagationModelDropDown.Value
                case 'freespace'
                    % Create the popup window
                    popup = uifigure('Position', [500,500,1010,773], 'Name', "Advanced Freespace Propagation Properties");
                    popup.Scrollable = 'on';

                    label11 = uilabel(popup, 'Text', 'No Advanced Properties for this Model');
                    label11.Position = [30 150 250 20];

                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Close';
                    submitButton.Position = [120 50 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed6();

                case 'rain'
                    % Create the popup window
                    popup = uifigure('Position', [500 500 300 200], 'Name', "Advanced Rain Propagation Properties");
                    popup.Scrollable = 'on';

                    label11 = uilabel(popup, 'Text', 'Rain Rate:');
                    label11.Position = [30 150 130 20];
                    editField11 = uieditfield(popup, 'numeric', "Value", 16);
                    editField11.Position = [170 150 40 20];

                    label12 = uilabel(popup, 'Text', 'Tilt Angle:');
                    label12.Position = [30 100 130 20];
                    editField12 = uieditfield(popup, 'numeric', "Value", 0);
                    editField12.Position = [170 100 40 20];

                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Submit';
                    submitButton.Position = [120 50 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed( ...
                        editField11.Value, ...
                        editField12.Value);

                case 'gas'
                    % Create the popup window
                    popup = uifigure('Position', [500 500 400 200], 'Name', "Advanced Gas Propagation Properties");
                    popup.Scrollable = 'on';

                    label11 = uilabel(popup, 'Text', 'Air Temparture:');
                    label11.Position = [30 150 230 20];
                    editField11 = uieditfield(popup, 'numeric', "Value", 15);
                    editField11.Position = [270 150 40 20];

                    label21 = uilabel(popup, 'Text', 'Dry Air Pressure:');
                    label21.Position = [30 120 230 20];
                    editField21 = uieditfield(popup, 'numeric', "Value", 101300);
                    editField21.Position = [270 120 40 20];

                    label31 = uilabel(popup, 'Text', 'Water Vapour Density:');
                    label31.Position = [30 90 230 20];
                    editField31 = uieditfield(popup, 'numeric', "Value", 7.5);
                    editField31.Position = [270 90 40 20];

                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Submit';
                    submitButton.Position = [180 50 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed1( ...
                        editField11.Value, ...
                        editField21.Value, ...
                        editField31.Value);
                    
                case 'fog'
                    % Create the popup window
                    popup = uifigure('Position', [500 500 300 200], 'Name', "Advanced Fog Propagation Properties");
                    popup.Scrollable = 'on';


                    label11 = uilabel(popup, 'Text', 'Air Temperature:');
                    label11.Position = [30 150 130 20];
                    editField11 = uieditfield(popup, 'numeric', "Value", 15);
                    editField11.Position = [170 150 40 20];

                    label12 = uilabel(popup, 'Text', 'Liquid Water Density:');
                    label12.Position = [30 100 130 20];
                    editField12 = uieditfield(popup, 'numeric', "Value", 0.5);
                    editField12.Position = [170 100 40 20];

                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Submit';
                    submitButton.Position = [120 50 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed2( ...
                        editField11.Value, ...
                        editField12.Value);




                case 'close-in'
                    popup = uifigure('Position', [500 500 450 150], 'Name', "Advanced Close-In Propagation Properties");
                    popup.Scrollable = 'on';

                    label11 = uilabel(popup, 'Text', 'Reference Distance:');
                    label11.Position = [30 100 160 20];
                    editField11 = uieditfield(popup, 'numeric', "Value", 1);
                    editField11.Position = [170 100 40 20];

                    label12 = uilabel(popup, 'Text', 'Path Loss Exponent:');
                    label12.Position = [220 100 160 20];
                    editField12 = uieditfield(popup, 'numeric', "Value", 2.9);
                    editField12.Position = [370 100 40 20];

                    label21 = uilabel(popup, 'Text', 'Standard Deviation:');
                    label21.Position = [30 70 160 20];
                    editField21 = uieditfield(popup, 'numeric', "Value", 5.7);
                    editField21.Position = [170 70 40 20];

                    label22 = uilabel(popup, 'Text', 'Number of Data Points:');
                    label22.Position = [220 70 160 20];
                    editField22 = uieditfield(popup, 'numeric', "Value", 1869);
                    editField22.Position = [370 70 40 20];

                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Submit';
                    submitButton.Position = [180 30 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed3( ...
                        editField11.Value, ...
                        editField12.Value, ...
                        editField21.Value, ...
                        editField22.Value);
                    
                case 'longley-rice'
                    % Create the popup window
                    popup = uifigure('Position', [500 500 420 300], 'Name', "Advanced Longley-Rain Propagation Properties");
                    popup.Scrollable = 'on';

                    label11 = uilabel(popup, 'Text', 'Antenna PolarizationFIXME:');
                    %should be a drop down menu with horizantal and
                    %vertical options
                    label11.Position = [30 250 160 20];
                    editField11 = uieditfield(popup, 'numeric', "Value", 0);
                    editField11.Position = [170 250 40 20];

                    label12 = uilabel(popup, 'Text', 'Ground Conductivity:');
                    label12.Position = [220 250 160 20];
                    editField12 = uieditfield(popup, 'numeric', "Value", .005);
                    editField12.Position = [370 250 40 20];

                    label21 = uilabel(popup, 'Text', 'Ground Permitivity:');
                    label21.Position = [30 220 160 20];
                    editField21 = uieditfield(popup, 'numeric', "Value", 15);
                    editField21.Position = [170 220 40 20];

                    label22 = uilabel(popup, 'Text', 'Atmospheric Refractivity:');
                    label22.Position = [220 220 160 20];
                    editField22 = uieditfield(popup, 'numeric', "Value", 301);
                    editField22.Position = [370 220 40 20];

                    label31 = uilabel(popup, 'Text', 'Time Variability Tolerance:');
                    label31.Position = [30 180 200 20];
                    editField31 = uieditfield(popup, 'numeric', "Value", .5);
                    editField31.Position = [200 180 40 20];

                    label41 = uilabel(popup, 'Text', 'Situation Variability Tolerance:');
                    label41.Position = [30 150 200 20];
                    editField41 = uieditfield(popup, 'numeric', "Value", 0.5);
                    editField41.Position = [200 150 40 20];


                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Submit';
                    submitButton.Position = [180 50 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed4( ...
                        editField11.Value, ...
                        editField12.Value, ...
                        editField21.Value, ...
                        editField22.Value, ...
                        editField31.Value, ...
                        editField41.Value);
                    
                case 'raytracing'
                    % Create the popup window
                    popup = uifigure('Position', [500 500 800 600], 'Name', "Advanced Ray Tracing Properties");
                    popup.Scrollable = 'on';

                    %% Surface Material pannel
                    % Create the first label and edit field
                    smcPanel = uipanel(popup,"Title", "Surface Material", "Position", [30 500 350 140]);
                    
                    

                    smcLabel = uilabel(smcPanel, 'Text', 'Surface Material Conductivity:');
                    smcLabel.Position = [15 90 180 20];
                    smcEditField = uieditfield(smcPanel, 'numeric', "Limits", [0 Inf], "Value", 0.0548);
                    smcEditField.Position = [200 90 40 20];

                    % Create the second label and edit field
                    smpLabel = uilabel(smcPanel, 'Text', 'Surface Material Permitivity:');
                    smpLabel.Position = [15 60 180 20];
                    smpEditField = uieditfield(smcPanel, 'numeric', "Limits", [0 Inf], "Value", 5.31);
                    smpEditField.Position = [200 60 40 20];

                    % Create the third label and edit field
                    smDropDownLabel = uilabel(smcPanel, 'Text', 'Surface Material');
                    smDropDownLabel.Position = [15 30 180 20];
                    smDropDown = uidropdown(smcPanel, 'Items', [ ...
                        "plasterboard", ...
                        "perfect-reflector", ...
                        "ceilingboard", ...
                        "chipboard", ...
                        "floorboard", ...
                        "concrete", ...
                        "brick", ...
                        "wood", ...
                        "glass", ...
                        "metal", ...
                        "water", ...
                        "vegetation", ...
                        "loam"]);
                    smDropDown.Position = [200 30 100 20];

                    %             editField31 = uieditfield(popup, 'numeric');
                    %             editField31.Position = [120 430 100 20];


                    %% Terrain Material Pannel
                    tmcPanel = uipanel(popup,"Title", "Terrain Material", "Position", [30 350 350 140]);
                    
                    

                    tmcLabel = uilabel(tmcPanel, 'Text', 'Terrain Material Conductivity:');
                    tmcLabel.Position = [15 90 180 20];
                    tmcEditField = uieditfield(tmcPanel, 'numeric', "Limits", [0 Inf], "Value", 0.0548);
                    tmcEditField.Position = [200 90 40 20];

                    % Create the second label and edit field
                    tmpLabel = uilabel(tmcPanel, 'Text', 'Terrain Material Permitivity:');
                    tmpLabel.Position = [15 60 180 20];
                    tmpEditField = uieditfield(tmcPanel, 'numeric', "Limits", [0 Inf], "Value", 5.31);
                    tmpEditField.Position = [200 60 40 20];

                    % Create the third label and edit field
                    tmDropDownLabel = uilabel(tmcPanel, 'Text', 'Terrain Material');
                    tmDropDownLabel.Position = [15 30 180 20];
                    tmDropDown = uidropdown(tmcPanel, 'Items', [ ...
                        "concrete", ...
                        "perfect-reflector", ...
                        "brick", ...
                        "water", ...
                        "vegetation", ...
                        "loam"]);
                    tmDropDown.Position = [200 30 100 20];
                    
                    

                    %% Building Material Pannel
                    bmcPanel = uipanel(popup,"Title", "Building Material", "Position", [30 200 350 140]);

                    bmcLabel = uilabel(bmcPanel, 'Text', 'Building Material Conductivity:');
                    bmcLabel.Position = [15 90 180 20];
                    bmcEditField = uieditfield(bmcPanel, 'numeric', "Limits", [0 Inf], "Value", 0.0548);
                    bmcEditField.Position = [200 90 40 20];

                    bmpLabel = uilabel(bmcPanel, 'Text', 'Building Material Permitivity:');
                    bmpLabel.Position = [15 60 180 20];
                    bmpEditField = uieditfield(bmcPanel, 'numeric', "Limits", [0 Inf], "Value", 5.31);
                    bmpEditField.Position = [200 60 40 20];

                    bmDropDownLabel = uilabel(bmcPanel, 'Text', 'Building Material');
                    bmDropDownLabel.Position = [15 30 180 20];
                    bmDropDown = uidropdown(bmcPanel, 'Items', [ ...
                        "concrete", ...
                        "perfect-reflector", ...
                        "brick", ...
                        "wood", ...
                        "glass", ...
                        "metal", ...
                        "loam"]);
                    bmDropDown.Position = [200 30 100 20];

                    %% Ray Tracing Panel
                    rtPanel = uipanel(popup, "Title", "Ray Tracing Pannel", "Position", [400 440 350 200]);

                    mrplLabel = uilabel(rtPanel, "Text", "Max Relative Path Loss");
                    mrplLabel.Position = [15 150 180 20];
                    mrplEditField = uieditfield(rtPanel, 'numeric', "Limits", [0 Inf], "Value", 40);
                    mrplEditField.Position = [200 150 40 20];

                    maplLabel = uilabel(rtPanel, "Text", "Max Absolute Path Loss");
                    maplLabel.Position = [15 120 180 20];
                    maplEditField = uieditfield(rtPanel, 'numeric', "Limits", [0 Inf], "Value", Inf);
                    maplEditField.Position = [200 120 40 20];

                    mdDropDownLabel = uilabel(rtPanel,"Text","Max Diffraction");
                    mdDropDownLabel.Position = [15 90 180 20];
                    mdDropDown = uidropdown(rtPanel, "Items",[ ...
                        "0", ...
                        "1", ...
                        "2"]);
                    mdDropDown.Position = [200 90 40 20];

                    mrLabel = uilabel(rtPanel, "Text", "Max Reflections");
                    mrLabel.Position = [15 60 180 20];
                    mrEditField = uieditfield(rtPanel, 'numeric', "Limits",[0 10]);
                    mrEditField.Value = 2;
                    mrEditField.Position = [200 60 40 20];

                    asLabel = uilabel(rtPanel,"Text", "Angular Separation");
                    asLabel.Position = [15 30 180 20];
                    asDropDown = uidropdown(rtPanel, "Items",[ ...
                        "medium", ...
                        "high", ...
                        "low"]);
                    asDropDown.Position = [200 30 100 20];



                    % Create the submit button
                    submitButton = uibutton(popup, 'push');
                    submitButton.Text = 'Submit';
                    submitButton.Position = [350 100 100 20];
                    %             submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed( ...
                    %                 editField11.Value, ...
                    %                 editField21.Value, ...
                    %                 editField31);


                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed5(...
                        smcEditField.Value, ...
                        smpEditField.Value,...
                        smDropDown.Value, ...
                        tmcEditField.Value, ...
                        tmpEditField.Value, ...
                        tmDropDown.Value, ...
                        bmcEditField.Value, ...
                        bmpEditField.Value, ...
                        bmDropDown.Value, ...
                        mrplEditField.Value, ...
                        maplEditField.Value, ...
                        mdDropDown.Value, ...
                        mrEditField.Value, ...
                        asDropDown.Value);

                case "userdefined"
                    % Create the popup window
%                     popup = uifigure('Position', [100 100 300 200], 'Name', "Advanced User Defined Propagation Properties");
%                     popup.Scrollable = 'on';
% 
%                     label11 = uilabel(popup, 'Text', 'Please Upload the file containing the code for the userdefined function of propagation model');
%                     label11.Position = [30 150 250 20];
%                     
%                     label21 = uilabel(popup, 'Text', 'Input Arguments for the function must be tx - TransmitterSite object, and rx - ReceiverSite Object');
%                     label21.Position = [30 130 250 20];
                    
%                     uploadButton = uibutton(popup, "push");
%                     uploadButton.Text = 'Upload';
%                     uploadButton.Position = [120 100 50 30];
%                     uploadButton.ButtonPushedFcn = @(~,~)uploadFileCallback();

                    % Create a new uifigure for the pop-up window
                    popupFig = uifigure('Name', 'File Upload', 'Position', [500 500 620 200]);
                    popupFig.Scrollable = 'on';
                    
                    
                    
                    % Add a layout to the figure to arrange components
                    layout = uigridlayout(popupFig);
                    layout.RowHeight = {'1x', 'fit', 'fit'};
                    label11 = uilabel(popupFig, 'Text', 'Please Upload the file containing the code for the userdefined function of propagation model');
                    label11.Position = [30 150 600 20];
                    
                    label21 = uilabel(popupFig, 'Text', 'Input Arguments for the function must be tx - TransmitterSite object, and rx - ReceiverSite Object');
                    label21.Position = [30 130 600 20];
                    
                    % Add a uibutton for uploading the file
                    uploadButton = uibutton(popupFig, 'Text', 'Upload File', 'Position', [300 100 50 30], ...
                        'ButtonPushedFcn', @(~,~)uploadFileCallback(popupFig, popupFig));
                    
                    
                    

                    % Create the submit button
                    submitButton = uibutton(popupFig, 'push');
                    submitButton.Text = 'Close';
                    submitButton.Position = [300 50 50 30];
                    submitButton.ButtonPushedFcn = @(~,~) submitButtonPushed6();

            end
            
            % Callback function for the "Upload File" button
            function uploadFileCallback(app, popupFig)
                % Open a file dialog for the user to select the file
%                 [filename, filepath] = uigetfile({'*.txt'; '*.csv'; '*.mat'}, 'Select File');
                
                [filename, filepath] = uigetfile('*.mat', 'Select .mat file');
                if isequal(filename, 0) || isequal(filepath, 0)
                    % User canceled the file selection
                    return;
                end

%                 % Check if the user selected a file
%                 if ischar(filename) && ischar(filepath)
%                     % File selected, do something with the file (e.g., read data, process, etc.)
%                     % Here you can add your code to handle the uploaded file
% %                     disp(['Selected file: ', fullfile(filepath, filename)]);
%                 else
%                     % User canceled the file selection, do nothing or display an error message
% %                     disp('File selection canceled.');
%                 end
% 
%                 % Close the pop-up window after file selection
% %                 delete(popupFig);
            end
            


            % Callback function for the "Upload File" button
%             function uploadFileCallback()
%                 % Open a file dialog for the user to select the file
%                 [filename, filepath] = uigetfile({'*.txt'; '*.csv'; '*.mat'}, 'Select File');
% 
%                 % Check if the user selected a file
%                 if ischar(filename) && ischar(filepath)
%                     % File selected, do something with the file (e.g., read data, process, etc.)
%                     % Here you can add your code to handle the uploaded file
%                     disp(['Selected file: ', fullfile(filepath, filename)]);
%                 else
%                     % User canceled the file selection, do nothing or display an error message
%                     disp('File selection canceled.');
%                 end
% 
%                 % Close the pop-up window after file selection
%                 delete(popupFig);
%             end


            % Function to handle the submit button press
            function submitButtonPushed(input1, input2)

                app.propRainRate = input1;
                app.propRainTilt = input2;                
                app.propagationModels{3} = propagationModel(...
                    "rain", ...
                    "RainRate", input1, ...
                    "Tilt", input2);

                % Close the popup window
                close(popup);
            end

            % Function to handle the submit button press
            function submitButtonPushed1(input1, input2, input3)

                app.propGasAirTemp = input1;
                app.propGasDryAirPressure = input2;
                app.propGasWaterVapourDensity = input3;
                app.propagationModels{4} = propagationModel(...
                    "gas", ...
                    "AirPressure", input2, ...
                    "Temperature", input1, ...
                    "WaterDensity", input3);

                % Close the popup window
                close(popup);
            end

            % Function to handle the submit button press
            function submitButtonPushed2(input1, input2)

                app.propFogAirTemp = input1;
                app.propFogLiquidWaterDensity = input2;

                app.propagationModels{5} = propagationModel(...
                    "fog",...
                    "Temperature", input1,...
                    "WaterDensity",input2);

                % Close the popup window
                close(popup);
            end

            % Function to handle the submit button press
            function submitButtonPushed3(input1, input2, input3, input4)

                app.propCloseInReferenceDistance = input1;
                app.propCloseInPathLossExponent = input2;

                app.propCloseInStandardDeviation = input3;
                app.propCloseInNumOfDataPoints = input4;

                app.propagationModels{2} = propagationModel(...
                    "close-in", ...
                    "ReferenceDistance", input1, ...
                    "PathLossExponent", input2, ...
                    "Sigma", input3, ...
                    "NumDataPoints", input4);

                
                % Close the popup window
                close(popup);
            end

            % Function to handle the submit button press
            function submitButtonPushed4(input1, input2, input3, input4, input5, input6)
                % Perform any desired actions with the input values
                app.propLongleyAntennaPolarization = input1;
                app.propLongleyGroundConductivity = input2;
                app.propLongleyGroundPermitivity = input3;
                app.propLongleyAtmosphericRefractivity = input4;
                app.propLongleyTimeVariabilityTolerance = input5;
                app.propLongleySituationVariabilityTolerance = input6;
                
                app.propagationModels{6} = propagationModel(...
                    "longley-rice",...
                    "AntennaPolarization", "horizontal", ...
                    "GroundConductivity", input2, ...
                    "GroundPermittivity", input3,...
                    "AtmosphericRefractivity", input4,...
                    "TimeVariabilityTolerance", input5,...
                    "SituationVariabilityTolerance", input6);
        
                % Close the popup window
                close(popup);
            end

            % Function to handle the submit button press
            function submitButtonPushed5(input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14)
                % Perform any desired actions with the input values
                app.propRaytracingSurfaceMaterialConductivity = input1;
                app.propRaytracingSurfaceMaterialPermitivity = input2;
                app.propRaytracingSurfaceMaterial = input3;
                app.propRaytracingTerrainMaterialConductivity = input4;
                app.propRaytracingTerrainMaterialPermitivity = input5;
                app.propRaytracingTerrainMaterial = input6;
                app.propRaytracingBuildingMaterialConductivity = input7;
                app.propRaytracingBuildingMaterialPermitivity = input8;
                app.propRaytracingBuildingMaterial = input9;
                app.propRaytracingMaxRelativePathLoss = input10;
                app.propRaytracingMaxAbsolutePathLoss = input11;
                app.propRaytracingMaxdiffraction = input12;
                app.propRaytracingMaxReflection = input13;
                app.propRaytracingAngularSeparation = input14;
                
                diffractions = double(input12) - double('0');

                app.propagationModels{7} = propagationModel(...
                    "raytracing",...
                    "SurfaceMaterialConductivity", input1, ...
                    "SurfaceMaterialPermittivity", input2, ...
                    "SurfaceMaterial", convertCharsToStrings(input3), ...
                    "TerrainMaterialConductivity", input4, ...
                    "TerrainMaterialPermittivity", input5, ...
                    "TerrainMaterial", convertCharsToStrings(input6), ...
                    "BuildingsMaterialConductivity", input7, ...
                    "BuildingsMaterialPermittivity", input8, ...
                    "BuildingsMaterial", convertCharsToStrings(input9), ...
                    "MaxRelativePathLoss", input10, ...
                    "MaxAbsolutePathLoss", input11, ...
                    "MaxNumDiffractions", diffractions, ...
                    "MaxNumReflections", input13, ...
                    "AngularSeparation", convertCharsToStrings(input14));

                % Close the popup window
                close(popup);
            end
            
            % Function to handle the submit button press
            function submitButtonPushed6()
                % Close the popup window
                close(popup);
            end
                



            
        end

        % Button pushed function: GenerateTrajectoryButton
        function GenerateTrajectoryButtonPushed(app, event)
            inputText = app.SeedTrajectoryEditField.Value;

            % input_value = app.SeedTrajectoryEditField.Value;
            % 
            % % Check if the input is a positive integer
            % if ~isempty(inputText) && all(inputText >= '0' & inputText <= '9') && str2double(inputText) > 0 && mod(str2double(inputText), 1) == 0
            %     % Input is a positive integer
            %     disp('Input is a positive integer.');
            % else
            %     % Input is not a positive integer, display an error message
            %     errordlg('Please enter a positive integer.', 'Input Error');
            %     % Reset the text field value
            %     app.SeedTrajectoryEditField.Value = '';
            % end


            elements = strsplit(inputText, ',');
            matlabArray = str2double(elements);
            disp(matlabArray)
            % integer_list = [18429, 14796, 2924];
            setenv('PYTHONPATH', 'word2vec-master_new');
            script_path = 'word2vec-master_new/visualize/eval.py';
            args = arrayfun(@num2str, matlabArray, 'UniformOutput', false);
            system(['python ', script_path, ' ', strjoin(args)]);
            app.Label.Text = 'Synthetic Trajectories has been prepared for all trajectories in .mat file';
            % pythonList = py.list(int32(matlabArray));
            % disp(pythonList)

            % % Import the Python module
            % pythonFolder = fullfile(pwd, 'word2vec-master/visualize');
            % if count(py.sys.path, pythonFolder) == 0
            %     insert(py.sys.path, int32(0), pythonFolder);
            % end
            % % results = py.callingEval.trajectory_generator(pythonList);
            % results = py.callingEval.trajectory_generator(pythonList);
            % disp(results)
% 
%             % Import the module
%             eval_module = py.importlib.import_module('visualize.callingEval.trajectory_generator');
% 
%             % Access the trajectory_generator function
%             % trajectory_generator_function = eval_module.trajectory_generator;
% %             visualize_module = py.importlib.import_module('word2vec_master.visualize.eval');
% 
%             % Access the trajectory_generator function
% %             trajectory_generator_function = visualize_module.trajectory_generator;
%             eval_module(pythonList);


        end

        % Callback function
        function SeedTrajectoryEditFieldValueChanged(app, event)
            userInput = app.SeedTrajectoryEditField.Value;
    
            % Define the regular expression pattern for positive integers separated by commas
            pattern = '^\d+(,\d+)*$';

            % Check matlab:matlab.internal.language.introspective.errorDocCallback('VisualizeAntennaCoverage_new/SeedTrajectoryEditFieldValueChanged')if the user input matches the pattern
            if ~isempty(regexp(userInput, pattern, 'once'))
                % Input is valid
                disp('Input is valid');
                % Process the input further if needed
            else
                % Input is invalid, display an error message
                errordlg('Invalid input! Please enter positive integer numbers separated by commas.', 'Error');
                % You can choose to clear the text field or take other actions
                % app.textField.Value = ''; % Clear the text field
            end
            
        end

        % Callback function
        function GenerateTrajectoryButton_2Pushed(app, event)
            inputText = app.SeedTrajectoryEditField.Value;

            % input_value = app.SeedTrajectoryEditField.Value;
            % 
            % % Check if the input is a positive integer
            % if ~isempty(inputText) && all(inputText >= '0' & inputText <= '9') && str2double(inputText) > 0 && mod(str2double(inputText), 1) == 0
            %     % Input is a positive integer
            %     disp('Input is a positive integer.');
            % else
            %     % Input is not a positive integer, display an error message
            %     errordlg('Please enter a positive integer.', 'Input Error');
            %     % Reset the text field value
            %     app.SeedTrajectoryEditField.Value = '';
            % end


            elements = strsplit(inputText, ',');
            matlabArray = str2double(elements);
            disp(matlabArray)
            % integer_list = [18429, 14796, 2924];
            setenv('PYTHONPATH', 'word2vec-master_new');
            i = 1;
            script_path = 'word2vec-master_new/visualize/eval.py';
            args = arrayfun(@num2str, matlabArray, 'UniformOutput', false);
            system(['python ', script_path, ' ', num2str(i), ' ',strjoin(args)]);
            app.Label_2.Text = 'Synthetic Trajectory has been prepared corresponding to the seed Trajectory';
            
            
            
            % Step 1: Read the node coordinates file
            node_data = readtable('word2vec-master_new\data\rome\road\node.csv');
            node_ids = node_data.node;
            latitudes = node_data.lat;
            longitudes = node_data.lng;

            % Step 2: Read the trajectory file
            trajectory_data = readmatrix('word2vec-master_new\output\synthetic_trajectory_1.csv');

            % Step 3: Map node IDs to coordinates for each trajectory
            num_trajectories = height(trajectory_data);
            all_trajectories = cell(num_trajectories, 1);

            for i = 1:num_trajectories
                trajectory_ids = trajectory_data(i,:);
                [~, idx, ~] = intersect(node_ids, trajectory_ids, 'stable');
                trajectory_latitudes = latitudes(idx);
                trajectory_longitudes = longitudes(idx);
                all_trajectories{i} = [trajectory_latitudes, trajectory_longitudes];
            end

            % Step 4: Plot each trajectory with a different color
            figure;
            % geoscatter(latitudes, longitudes); % Create a GeographicAxes object
            % hold on;
            for i = 1:num_trajectories
                geoplot(all_trajectories{i}(:,1), all_trajectories{i}(:,2), 'k--o','LineWidth',2,'color', rand(1,3));  % Plot with a random color
                hold on;
            end
            hold off;

            % Add title and labels
            title('Trajectories Plot');
            % pythonList = py.list(int32(matlabArray));
            % disp(pythonList)

            % % Import the Python module
            % pythonFolder = fullfile(pwd, 'word2vec-master/visualize');
            % if count(py.sys.path, pythonFolder) == 0
            %     insert(py.sys.path, int32(0), pythonFolder);
            % end
            % % results = py.callingEval.trajectory_generator(pythonList);
            % results = py.callingEval.trajectory_generator(pythonList);
            % disp(results)
% 
%             % Import the module
%             eval_module = py.importlib.import_module('visualize.callingEval.trajectory_generator');
% 
%             % Access the trajectory_generator function
%             % trajectory_generator_function = eval_module.trajectory_generator;
% %             visualize_module = py.importlib.import_module('word2vec_master.visualize.eval');
% 
%             % Access the trajectory_generator function
% %             trajectory_generator_function = visualize_module.trajectory_generator;
%             eval_module(pythonList);
        end

        % Callback function
        function SeedTrajectoryEditFieldValueChanged2(app, event)
            value = app.SeedTrajectoryEditField.Value;
            userInput = value;
    
            % Define the regular expression pattern for positive integers separated by commas
            pattern = '^\d+(,\d+)*$';

            % Check matlab:matlab.internal.language.introspective.errorDocCallback('VisualizeAntennaCoverage_new/SeedTrajectoryEditFieldValueChanged')if the user input matches the pattern
            if ~isempty(regexp(userInput, pattern, 'once'))
                % Input is valid
                disp('Input is valid');
                % Process the input further if needed
            else
                % Input is invalid, display an error message
                errordlg('Invalid input! Please enter positive integer numbers separated by commas.', 'Error');
                % You can choose to clear the text field or take other actions
                % app.textField.Value = ''; % Clear the text field
            end
            
        end

        % Callback function
        function UploadmatFileButtonPushed(app, event)
            [filename, filepath] = uigetfile('*.mat', 'Select .mat file');
            if isequal(filename, 0) || isequal(filepath, 0)
                % User canceled the file selection
                return;
            end

            % Load the .mat file
            load(fullfile(filepath, filename));
            % Get the number of rows in the data
            num_rows = size(data, 1);

            % Loop through each row
            for i = 1:num_rows
                matlabArray = data(i,:);
                disp(i)
                disp(matlabArray)
                % integer_list = [18429, 14796, 2924];
                setenv('PYTHONPATH', 'word2vec-master_new');
                script_path = 'word2vec-master_new/visualize/eval.py';
                args = arrayfun(@num2str, matlabArray, 'UniformOutput', false);
                system(['python ', script_path, ' ', num2str(i), ' ',strjoin(args)]);
            end

            app.Label.Text = 'Synthetic Trajectories has been prepared for all trajectories in .mat file';

        end

        % Button pushed function: VisualizeNetworkNodesButton
        function VisualizeNetworkNodesButtonPushed(app, event)
            % Step 1: Read the CSV file
            data = readtable('word2vec-master_new/data/rome/road/node.csv');  % Replace 'your_file.csv' with the actual filename

            % Step 2: Extract latitude and longitude data
            latitudes = data.lat;
            longitudes = data.lng;
            node_ids = data.node;

            % Step 3: Create the geoplot
            figure;
            geoplot(latitudes, longitudes, '.');  % Plot points on the map

            % Add title and labels
            title('Geoplot of Nodes');
            % xlabel('Latitude');
            % ylabel('Longitude');

            % Add grid lines
            grid on;

            % Add legend
            legend('Nodes');

            dcm_obj = datacursormode(gcf);
            set(dcm_obj, 'UpdateFcn', @(src, event) {['Latitude: ', num2str(event.Position(1))], ...
                                          ['Longitude: ', num2str(event.Position(2))], ...
                                          ['Node ID: ', num2str(node_ids(find(latitudes == event.Position(1) & longitudes == event.Position(2))))]});

        end

        % Button pushed function: PlotDirectivityPatternButton
        function PlotDirectivityPatternButtonPushed2(app, event)
            yagiAnt = design(yagiUda,app.txa(1).TransmitterFrequency);

            % Tilt antenna to direct radiation in XY-plane (i.e. geographic azimuth)
            disp(app.TiltAngleEditField.Value)
            disp(app.TiltAxisDropDown.Value)

            yagiAnt.Tilt = app.TiltAngleEditField.Value;
            yagiAnt.TiltAxis = app.TiltAxisDropDown.Value;

            f = figure;

            % Show directivity pattern
            patternAzimuth(yagiAnt,app.txa(1).TransmitterFrequency);

            % Get the content of the figure as an image
            figImage = getframe(f);
            imageData = figImage.cdata;

            % Display the image in the UIAxes
            imshow(imageData, 'Parent', app.DirectivityPlot);
            app.txa(1).Antenna = yagiAnt;

            % Point main beam toward Boston, MA by assigning azimuth angle between
            % transmitter location and Boston receiver location
            app.txa(1).AntennaAngle = angle(app.txa(1), app.rxsa(1));

            % Define signal strengths from sensitivity to -60 dB
            sigStrengths = app.ReceiverSentivityEditField.Value:5:-60;
            sc = [0 0.3 0];

            % Update coverage map
            coverage(app.txa,"rain","SignalStrengths",sigStrengths)

            link(app.rxsa,app.txa,"rain","SuccessColor",sc)
        end

        % Button pushed function: GenerateButton
        function GenerateButtonPushed(app, event)
        % Prompt user for number of transmitters
              prompt = {'Enter number of transmitters:'};
              dlgtitle = 'Transmitter Configuration';
              dims = [1 50];
              definput = {'135'};  % Default value (updated for new script)
              answer = inputdlg(prompt, dlgtitle, dims, definput);

              % Check if user cancelled the dialog
              if isempty(answer)
                  return;
              end

              % Parse the input value
              num_transmitters = str2double(answer{1});
              if isnan(num_transmitters) || num_transmitters < 1
                  uialert(app.UIFigure, 'Please enter a valid positive number.', 'Invalid Input');
                  return;
              end
              num_transmitters = round(num_transmitters);  % Ensure integer
           
        %set up progress bar
        % Store original button text
        originalButtonText = app.DatasetGenerationProgressButton.Text;
        % When the function ends, return the original button state
        cleanup = onCleanup(@()set(app.DatasetGenerationProgressButton,'Text',originalButtonText,'Icon',''));
        % Change button name to "Processing"
        app.DatasetGenerationProgressButton.Text = 'Processing...';
        % Put text on top of icon
        app.DatasetGenerationProgressButton.IconAlignment = 'bottom';
        % Create waitbar with same color as button
        wbar = permute(repmat(app.DatasetGenerationProgressButton.BackgroundColor,15,1,200),[1,3,2]);
        % Black frame around waitbar
        wbar([1,end],:,:) = 0;
        wbar(:,[1,end],:) = 0;
        % Load the empty waitbar to the button
        app.DatasetGenerationProgressButton.Icon = wbar;


            % Define the initial northwest (NW) latitude and longitude
nw_lat = app.NorthWestLatitudeEditField.Value; % Enter initial latitude coordinate
nw_lon = app.NorthWestLongitudeEditField.Value; % Enter initial longitude coordinate

% Number of target regions to create
num_regions = 1;

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

for i = 1 : length(nw_lat_list)
    for j = 1 : length(nw_lon_list)
        
        env_num = env_num + 1;
        %futures((length(nw_lat_list) * (i-1)) + j) = parfeval(@GenDatasetScriptOut, 1, nw_lat_list(i), nw_lon_list(j), env_num, 100);
        % GenDatasetScript(app, nw_lat_list(i), nw_lon_list(j), env_num, 100);
        GenDatasetScript(app, nw_lat_list(i), nw_lon_list(j), env_num, num_transmitters);

    end
end

% store array of futures
%app.DatasetGenFutures = futures;

% Update progress bar after each future completes
%afterEach(app.DatasetGenFutures, @app.onDatasetFutureDone, 0, PassFuture=true);
%func = @(s) s;
%afterAll(app.DatasetGenFutures, func, 1, "PassFuture",true);



        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            delete(app.geoPlotAxes)
            geoAxes = geoaxes(app.MapPanel);
            app.geoPlotAxes = geoAxes;
            %geoplot(app.geoPlotAxes, [ne_latitude, ne_latitude, nw_latitude, nw_latitude, ne_latitude], [sw_longitude, se_longitude, se_longitude, sw_longitude, sw_longitude], 'g-.', 'LineWidth', 2);
            %hold(app.geoPlotAxes, 'on')

            % Number of target regions to create
            num_regions = 10;

            % Distance between regions in meters (non-overlapping)
            dist_between_regions_m = 260; % Distance in meters (equivalent to 256m x 256m square region)
            
            % Earth radius in meters
            earth_radius = 6371 * 1000;

            % Initialize arrays to store the NW coordinates for each target region
            nw_lat_list = zeros(1, num_regions);
            nw_lon_list = zeros(1, num_regions);

            % Set the first region's NW coordinates
            nw_lat_list(1) = app.NorthWestLatitudeEditField.Value;
            nw_lon_list(1) = app.NorthWestLongitudeEditField.Value;

            % Calculate delta for 256 meters in latitude and longitude
            delta_lat = (dist_between_regions_m / earth_radius) * (180 / pi);
            delta_lon = (dist_between_regions_m / (earth_radius * cosd(nw_lat_list(1)))) * (180 / pi);

            for i = 2:num_regions
            % Move 256 meters south and east to get the next NW coordinate
            nw_lat_list(i) = nw_lat_list(i-1) - delta_lat;
            nw_lon_list(i) = nw_lon_list(i-1) + delta_lon;
            end

            for i = 1 : length(nw_lat_list)
                for j = 1 : length(nw_lon_list)
                se_lat = (nw_lat_list(i) - delta_lat);
                se_lon = (nw_lon_list(j) + delta_lon);
                
                %left
                left_lats = [nw_lat_list(i), se_lat];
                left_lons = [nw_lon_list(j), nw_lon_list(j)];
                geoplot(app.geoPlotAxes, left_lats, left_lons)
                hold(app.geoPlotAxes, "on")

                %top
                top_lats = [nw_lat_list(i), nw_lat_list(i)];
                top_lons = [nw_lon_list(j), se_lon];
                geoplot(app.geoPlotAxes, top_lats, top_lons)
                hold(app.geoPlotAxes, "on")

                %right
                right_lats = [nw_lat_list(i), se_lat];
                right_lons = [se_lon, se_lon];
                geoplot(app.geoPlotAxes, right_lats, right_lons)
                hold(app.geoPlotAxes, "on")

                %bottom
                bottom_lats = [se_lat, se_lat];
                bottom_lons = [nw_lon_list(j), se_lon];
                geoplot(app.geoPlotAxes, bottom_lats, bottom_lons)
                hold(app.geoPlotAxes, "on")
                end
            end

            geobasemap(app.geoPlotAxes, app.BaseMapDropDown.Value)
        end

        % Button pushed function: CancelButton
        function CancelButtonPushed(app, event)
            cancel(app.DatasetGenFutures);
        end

        % Button pushed function: RandomangleButton
        function RandomangleButtonPushed(app, event)
            nw_lat = app.NWLatitudeEditField.Value; %  Enter initial latitude coordinate;
            nw_lon = app.NWLongitudeEditField.Value;%  Enter initial longitude coordinate;
            num_trajectories = app.NumberoftrajectoriesEditField.Value;
            

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
            command = 'curl "' + osmAPI + '" > trajectoryMap.osm';
            system(command);

            osmFile = 'trajectoryMap.osm';
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

            inflate(occ_map, app.BuildingAvoidanceSpinner.Value);

            state_validator.Map = occ_map;

            %settings
            state_validator.ValidationDistance = 5;
            state_space.StateBounds = [occ_map.XWorldLimits;occ_map.YWorldLimits; [-pi pi]];

            %create planner
            planner = plannerRRT(state_space,state_validator, "MaxIterations", 2e4);
            planner.MaxConnectionDistance = 1;

            paths = cell(num_trajectories, 1);  % 列向量

            i = 0;
            while i ~= num_trajectories
                i = i + 1
                path = trajectory;
                randStart = randi(size(validStarts));
                %set start and end positions
                path.Start = validStarts{randStart};
                validEnds = {};
            for j = 1:width(validStarts)
                possibleEnd = validStarts{j};
                if path.isValidEnd(possibleEnd(1), possibleEnd(2))
                    validEnds(end+1) = {possibleEnd};
                end
            end
            randEnd = randi(size(validEnds));
            path.End = validEnds{randEnd};

            start = [path.Start(1,1), path.Start(1,2), 0];
            goal = [path.End(1,1), path.End(1,2), 0];


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
            pathLons = (pthObj.States(:,1) / 256) * (se_lon - nw_lon) + nw_lon;
            pathLats = (pthObj.States(:,2) / 256) * (nw_lat - se_lat) + se_lat;
            shortenedPathLons = 1:100;
            shortenedPathLats = 1:100;

            for j = 1:100
                shortenedPathLons(j) = pathLons(j * min(height(pathLons) - 1, floor(height(pathLons) / 100)));
                shortenedPathLats(j) = pathLats(j * min(height(pathLons) - 1, floor(height(pathLats) / 100)));
            end
            
            pathgeopoints = geopointshape(shortenedPathLats, shortenedPathLons);
            path.Geopoints = pathgeopoints;
            paths(i) = {path};

            end
        app.Trajectories = paths(:);
        app.SelectTrajectoryDropDown.Items = string(1:num_trajectories);
        app.ActiveTrajectory = app.Trajectories{1};
        end

        % Button pushed function: VisualizeTrajectoryButton
        function VisualizeTrajectoryButtonPushed(app, event)
    if ~isstring(app.ActiveTrajectory)
        % 清空并新建 geoaxes
        if isgraphics(app.geoPlotAxes)
            delete(app.geoPlotAxes);
        end
        ax = geoaxes(app.MapPanel);
        app.geoPlotAxes = ax;
        geobasemap(ax, app.BaseMapDropDown.Value);
        hold(ax, "on");

        % 1) 取出轨迹的经纬度数组（把点连成线）
        lat = app.ActiveTrajectory.Geopoints.Latitude;
        lon = app.ActiveTrajectory.Geopoints.Longitude;

        % 用经纬度数组绘线，这样可以设置 LineWidth 等属性
        geoplot(ax, lat, lon, 'LineWidth', 1.5, 'DisplayName', 'Trajectory');

        % 2) 如果有固定目标点，红色实心点标出来
        if isprop(app.ActiveTrajectory, 'TargetLatLon')
            tgt = app.ActiveTrajectory.TargetLatLon;   % [lat lon]
            if numel(tgt)==2 && all(isfinite(tgt))
                geoscatter(ax, tgt(1), tgt(2), 60, 'red', 'filled', ...
                           'DisplayName', 'Target');
                % 可选：给目标点加个文字标签
                % text(ax, tgt(2), tgt(1), '  Target', 'Color','red','FontWeight','bold');
            end
        end

        legend(ax, 'show', 'Location', 'best');
        hold(ax, "off");
    end

        end

        % Value changed function: SelectTrajectoryDropDown
        function SelectTrajectoryDropDownValueChanged(app, event)
            value = app.SelectTrajectoryDropDown.Value;
            app.ActiveTrajectory = app.Trajectories{str2double(value)};
        end

        % Button pushed function: SaveTrajectoryButton
        function SaveTrajectoryButtonPushed(app, event)
  tr = app.ActiveTrajectory;
    if isstring(tr) || isempty(tr)
        return;
    end

    % ==== 1) 兼容提取轨迹点 cords: [lat lon] ====
    cords = [];
    % 1a. 先试原来的 getPath（若存在且返回 Nx2）
    try
        if ismethod(tr, 'getPath')
            tmp = tr.getPath();
            if isnumeric(tmp) && size(tmp,2) >= 2
                cords = tmp(:,1:2);
            end
        end
    catch
        % 忽略，走后备
    end
    % 1b. 后备：从 Geopoints 提取
    if isempty(cords) && isprop(tr,'Geopoints') && ~isempty(tr.Geopoints)
        lat = tr.Geopoints.Latitude(:);
        lon = tr.Geopoints.Longitude(:);
        cords = [lat, lon];
    end
    % 1c. 再后备：若对象本身就是 Nx2
    if isempty(cords) && isnumeric(tr) && size(tr,2) == 2
        cords = tr;
    end
    if isempty(cords)
        uialert(app.UIFigure, '无法保存：未能从轨迹对象解析经纬度。', 'Save Trajectory');
        return;
    end

    % ==== 2) 选择保存文件（替代 inputdlg+uigetdir）====
    [fname, fpath] = uiputfile({'*.csv','CSV files (*.csv)'}, ...
                                'Save trajectory as', 'trajectory.csv');
    if isequal(fname,0) || isequal(fpath,0)
        return; % 用户取消
    end
    traj_file = fullfile(fpath, fname);

    % ==== 3) 保存主轨迹 ====
    writematrix(cords, traj_file);

    % ==== 4) 若存在目标与角度，也保存 *_targetAndAngles.csv ====
    try
        hasAngles = isprop(tr,'Angles') && ~isempty(tr.Angles);
        hasTarget = isprop(tr,'TargetLatLon') && numel(tr.TargetLatLon)==2 && all(isfinite(tr.TargetLatLon));
        if hasAngles && hasTarget
            angles = tr.Angles(:).';                    % 1×N
            tgt    = tr.TargetLatLon(:).';             % [lat lon]
            row    = [tgt, angles];                    % 1×(2+N)
            [~, baseName, ~] = fileparts(traj_file);
            tgt_file = fullfile(fpath, [baseName '_targetAndAngles.csv']);
            writematrix(row, tgt_file);
        end
    catch
        % 角度/目标保存失败不影响主文件
    end

    uialert(app.UIFigure, sprintf('已保存：\n%s', traj_file), 'Save Trajectory');
        end

        % Button pushed function: SimulateSignalAlongTrajectoryButton
        function SimulateSignalAlongTrajectoryButtonPushed(app, event)
            % 合并版：一个按钮同时支持两类轨迹（带/不带 Angles）
            % - 若 ActiveTrajectory 含 Angles（TestButton 生成），则按保存的角度逐点仿真
            % - 否则回退为随机角度（兼容老 Generate）
            % - 束宽优先使用轨迹对象中的 BeamwidthDeg，没有则随机
            
                %% 1) 基本检查与区域准备
                if isstring(app.ActiveTrajectory)
                    return
                end
                tr = app.ActiveTrajectory;
                if ~isprop(tr,'Geopoints') || isempty(tr.Geopoints)
                    uialert(app.UIFigure,'当前轨迹没有 Geopoints','Simulate'); return;
                end
            
                % NW 坐标与 256m 方框网格（保持你原来的区域设定）
                nw_lat = app.NWLatitudeEditField.Value;
                nw_lon = app.NWLongitudeEditField.Value;
            
                % 只跑一个区域（若要批量，可恢复你的 for 循环）
                env_num = 1;
                directory_name = 'synctest_trajectoryDataset'+string(env_num);
                if ~exist(directory_name, 'dir'), mkdir(directory_name); end
            
                R = 6371e3;           % 地球半径 (m)
                d = 256;              % 方框边长 (m)
                delta_lat = (d / R) * (180 / pi);
                delta_lon = (d / (R * cosd(nw_lat))) * (180 / pi);
                se_lat = nw_lat - delta_lat;
                se_lon = nw_lon + delta_lon;
            
                % 方框对角距离（≈364 m）
                nwLatRad = deg2rad(nw_lat); nwLonRad = deg2rad(nw_lon);
                seLatRad = deg2rad(se_lat); seLonRad = deg2rad(se_lon);
                dLat = seLatRad - nwLatRad; dLon = seLonRad - nwLonRad;
                a = sin(dLat/2)^2 + cos(nwLatRad)*cos(seLatRad)*sin(dLon/2)^2;
                c = 2*atan2(sqrt(a), sqrt(1-a));
                diagonalDistance = R * c;
            
                % 网格（用于兜底取采样点）
                lat_range = linspace(nw_lat, se_lat, 256);
                lon_range = linspace(nw_lon, se_lon, 256);
                [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
            
                %% 2) 取当前轨迹点 & 角度 & 束宽
                selected_latitudes  = tr.Geopoints.Latitude(:);
                selected_longitudes = tr.Geopoints.Longitude(:);
                totalMaps = numel(selected_latitudes);
            
                % Angles：优先用轨迹对象保存的；否则回退随机
                if isprop(tr,'Angles') && ~isempty(tr.Angles)
                    angles = tr.Angles(:).';  % 1×N
                else
                    angles = rand(1, totalMaps) * 360;  % 回退：随机角度
                end
                % 对齐长度（防御）
                if numel(angles) < totalMaps
                    angles = [angles, repmat(angles(end), 1, totalMaps - numel(angles))];
                elseif numel(angles) > totalMaps
                    angles = angles(1:totalMaps);
                end
            
                % 束宽：优先用轨迹对象 BeamwidthDeg；没有则随机 [6,20]
                if isprop(tr,'BeamwidthDeg') && isfinite(tr.BeamwidthDeg)
                    beamAngle = tr.BeamwidthDeg;
                else
                    beamAngle = randi([6 20]);
                end
            
                %% 3) 站点/传播模型（与你的新脚本一致）
                transmitterFreq  = 28e9;     % Hz
                transmitterPower = 1;        % W
                antennaHeight    = 2;        % m
                Antenna_size     = [8 8];
            
                % 有 OSM 就显示，无也不影响追踪
                try
                    siteviewer("Buildings",'trajectoryMap.osm','Visible','off');
                catch
                end
            
                tx_names = "Tx" + (1:totalMaps);
                tx = txsite("Name",tx_names, ...
                            "Latitude",selected_latitudes, ...
                            "Longitude",selected_longitudes, ...
                            "TransmitterFrequency", transmitterFreq, ...
                            "TransmitterPower", transmitterPower, ...
                            "AntennaHeight",antennaHeight);
            
                % 每个 Tx：URA + 高斯单元 + (同一条轨迹)固定束宽 + 对应角度
                for tx_num = 1:totalMaps
                    lambda = physconst("lightspeed") / transmitterFreq;
            
                    arr = phased.URA('Size',Antenna_size, ...
                                     'Lattice','Rectangular', 'ArrayNormal','x');
                    arr.ElementSpacing = [0.5 0.5]*lambda;
            
                    elem = phased.GaussianAntennaElement;
                    elem.FrequencyRange = [0 transmitterFreq];
                    elem.Beamwidth = [beamAngle beamAngle];   % ★ 每条轨迹固定束宽
            
                    arr.Element = elem;
                    tx(tx_num).Antenna = arr;
            
                    % ★ 角度：TestButton 生成的轨迹将使用保存的 Angles；否则是随机角度
                    tx(tx_num).AntennaAngle = angles(tx_num);
                end
            
                % 传播模型（SBR，单次反射）
                pm = propagationModel("raytracing","Method","sbr", ...
                                      "MaxNumReflections",1, "MaxNumDiffractions",0);
            
                %% 4) 生成接收机采样点：优先 coverage_test，失败则用方框网格兜底
                try
                    [pd, isWithinBldg1, datalats1, datalons1] = coverage_test(tx(1), pm, ...
                        'MaxRange', diagonalDistance, 'Resolution', 1); %#ok<ASGLU>
                    sampleCoords = [datalats1, datalons1];
                catch
                    % 没有 coverage_test 或出错，退化为使用 256×256 网格
                    sampleCoords = [lat_mesh(:), lon_mesh(:)];
                end
            
                % 过滤到 256m 方框内部
                inBox = sampleCoords(:,1) <= nw_lat & sampleCoords(:,1) >= se_lat ...
                      & sampleCoords(:,2) >= nw_lon & sampleCoords(:,2) <= se_lon;
                filteredCoordinates = sampleCoords(inBox, :);
            
                if isempty(filteredCoordinates)
                    uialert(app.UIFigure,'接收机采样点为空（可能全部被过滤）','Simulate'); return;
                end
            
                receiver_lats = filteredCoordinates(:,1);
                receiver_lons = filteredCoordinates(:,2);
                rx = rxsite("Latitude",receiver_lats, ...
                            "Longitude",receiver_lons, ...
                            "ReceiverSensitivity", -120, ...
                            "AntennaHeight", 2);
            
                %% 5) 逐 Tx 计算 & 写文件（与你原来一致）
                for tx_num = 1 : numel(tx)
                    t0 = tic;
                    sigStre = sigstrength(rx, tx(tx_num), pm);
            
                    T = table(receiver_lats, receiver_lons, sigStre', ...
                              'VariableNames', {'Latitude','Longitude','Power'});
            
                    writetable(T, fullfile(directory_name, (string(tx_num)+'.xlsx')));
                    fprintf('Tx %d done (%.1fs)\n', tx_num, toc(t0));
                end
            
                %% 6) 小结
                fprintf('Simulation finished. Output folder: %s\n', directory_name);
            

        end

        % Button pushed function: SaveAllButton
        function SaveAllButtonPushed(app, event)
            if isstring(app.ActiveTrajectory)
                return
            end

            sys_path = uigetdir;
            for i = 1:numel(app.Trajectories)
                path = app.Trajectories{i};
                file_path = strcat(sys_path, '\trajectory_', string(i), '.csv');
                writematrix(path.getPath, file_path);
            end
        end

        % Button pushed function: SimulateAllButton
        function SimulateAllButtonPushed(app, event)
            % Define the initial northwest (NW) latitude and longitude
            if isstring(app.ActiveTrajectory)
                return
            end

            nw_lat = app.NWLatitudeEditField.Value % Enter initial latitude coordinate
            nw_lon = app.NWLongitudeEditField.Value; % Enter initial longitude coordinate

            % Number of target regions to create
            num_regions = 10;
        
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

            % for i = 1 : length(nw_lat_list)
            %     for j = 1 : length(nw_lon_list)
            i = 1;
            j = 1;
            startTime_env = datetime('now');
        
            %% Target Region Computation
            nw_lat = nw_lat_list(i);
            nw_lon = nw_lon_list(j);

            for i = 1:numel(app.Trajectories)
            app.ActiveTrajectory = app.Trajectories{i};

            env_num = env_num + 1;
            directory_name = 'trajectoryDataset'+string(env_num);
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

            % se_lat = round((nw_lat - delta_lat), 5);
            % se_lon = round((nw_lon + delta_lon), 5);

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

            %% Transmitter Settings and number of Maps required in settings
            totalMaps = 1; % Number of Maps for 1 target region
            clear Antenna_size;
            selected_indices = randperm(size(lat_lon_table, 1), totalMaps);
            % selected_indices = 33112 : 33191;
            selected_coordinates = app.ActiveTrajectory.getPath;
            selected_latitudes = selected_coordinates(:, 1);
            selected_longitudes = selected_coordinates(:, 2);
            transmitterFreq = 5.9e9;
            transmitterPower = 23;
            antennaHeight = 5;
            osmFile = 'trajectoryMap.osm';
            siteviewer("Buildings",osmFile, 'Visible', 'off');
            tx_site_names = 1 : totalMaps;

            tx = txsite("Name",num2str(tx_site_names),...
                "Latitude",selected_latitudes,...
                "Longitude",selected_longitudes,...
                "TransmitterFrequency", transmitterFreq,...
                "TransmitterPower", transmitterPower,...
                "AntennaHeight",antennaHeight);
            writematrix(selected_coordinates, fullfile(directory_name, 'transmitter_coordinates.xlsx'));

            %% Antenna Setttings

            Antenna_size = [8 8];
            angle_array = randperm(360, totalMaps);
            for tx_num = 1 : totalMaps
                lambda = physconst("lightspeed") / tx(tx_num).TransmitterFrequency;
                tx(tx_num).Antenna = phased.URA('Size',Antenna_size,...
                    'Lattice','Rectangular','ArrayNormal','x');
                % The multiplication factor for lambda units to meter conversion
                tx(tx_num).Antenna .ElementSpacing = [0.5 0.5]*lambda/2;
                numRows = Antenna_size(1);
                numCols = Antenna_size(2);
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
                tx(tx_num).AntennaAngle = angle_array(tx_num);
            end


            %% Building and Non Building Coordinates Computation
            pm = propagationModel("raytracing","Method","image", "MaxNumReflections",0);
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


            %% Setting up Receivers Site and computing signal strength across target region
            receiver_lats = filteredCoordinates(:,1);
            receiver_lons = filteredCoordinates(:,2);
            rx = rxsite(Latitude=receiver_lats, ...
            Longitude=receiver_lons);
            tic
            for tx_num = 1 : width(tx)
                startTime = datetime('now');
                sigStre = sigstrength(rx, tx(tx_num), pm);

                T = table(receiver_lats, receiver_lons, sigStre');

                T.Properties.VariableNames = {'Latitude', 'Longitudes', 'Power'};

                writetable(T,fullfile(directory_name, (string(tx_num)+'.xlsx')));
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
        end
        end

        % Button pushed function: VisualizeVehicleVariationsButton
        function VisualizeVehicleVariationsButtonPushed(app, event)
            %% Mobile Robot Kinematics Simulation - Geographic Coordinates Experiment
            % This script simulates the movement of different types of mobile robots along actual GPS coordinate paths
            % and compares their behavioral characteristics

            checkedNodes = app.VehicleTree.CheckedNodes;            
            numNodes = height(checkedNodes);
            selectedNodes = strings(numNodes, 1);    
            for i = 1:numNodes
                selectedNodes(i) = checkedNodes(i).Text;
            end            

            %% Initialize Parameters
            sampleTime = 0.05;  % Sampling time (seconds)
            tVec = 0:sampleTime:60;  % Time vector

            %% Define Mobile Robot Kinematics Models
            if ismember("Unicycle", selectedNodes)
            % 1. Unicycle Model - The simplest model, controlled by wheel speed and rotation around the central axis
            unicycle = unicycleKinematics(VehicleInputs="VehicleSpeedHeadingRate");
            end
            if ismember("Differential", selectedNodes)    
            % 2. Differential Drive Model - Uses rear drive axle to control both vehicle speed and turning rate
            diffDrive = differentialDriveKinematics(VehicleInputs="VehicleSpeedHeadingRate");
            diffDrive.WheelSpeedRange = [-10 10]*2*pi;  % Add wheel speed constraints
            end
            if ismember("Bicycle", selectedNodes)
            % 3. Bicycle Model - Similar to a car model, with two axles: rear drive and front steering
            bicycle = bicycleKinematics(VehicleInputs="VehicleSpeedHeadingRate", MaxSteeringAngle=pi/8);
            end
            %% Get GPS data and convert to UTM coordinates
            % Get latitude and longitude data
            lat_lon_table = app.ActiveTrajectory.getPath();
            lat = lat_lon_table(:,1);
            lon = lat_lon_table(:,2);

            % Convert latitude and longitude coordinates to UTM coordinates
            [utmX, utmY, utmZone] = app.deg2utm(lat, lon);
            utm_waypoints = [utmX, utmY];

            % Set initial pose
            initPose = [utm_waypoints(1,:)'; 0];  % Initial pose [x y theta]

            %% Create Controllers
            controller1 = controllerPurePursuit(Waypoints=utm_waypoints, DesiredLinearVelocity=3, MaxAngularVelocity=3*pi);
            controller2 = controllerPurePursuit(Waypoints=utm_waypoints, DesiredLinearVelocity=3, MaxAngularVelocity=3*pi);
            controller3 = controllerPurePursuit(Waypoints=utm_waypoints, DesiredLinearVelocity=3, MaxAngularVelocity=3*pi);

            % Define goal parameters
            goalPoints = utm_waypoints(end,:)';
            goalRadius = 2;

            %% Simulate Motion Trajectories for Each Model
            if ismember("Unicycle", selectedNodes)
            % Unicycle Model
            [tUnicycle, unicyclePose] = ode45(@(t,y) ...
                derivative(unicycle, y, app.robotController(controller1, y, goalPoints, goalRadius)), ...
                tVec, initPose);
            [unicycleLats, unicycleLons] = app.utm2deg(unicyclePose(1:height(unicyclePose)/height(utmZone):end, 1),unicyclePose(1:height(unicyclePose)/height(utmZone):end, 2),utmZone);
            end
            if ismember("Bicycle", selectedNodes)
            % Bicycle Model
            [tBicycle, bicyclePose] = ode45(@(t,y) ...
                derivative(bicycle, y, app.robotController(controller2, y, goalPoints, goalRadius)), ...
                tVec, initPose);
            [bicycleLats, bicycleLons] = app.utm2deg(bicyclePose(1:height(bicyclePose)/height(utmZone):end, 1),bicyclePose(1:height(bicyclePose)/height(utmZone):end, 2),utmZone);
            end
            if ismember("Differential", selectedNodes)
            % Differential Drive Model
            [tDiffDrive, diffDrivePose] = ode45(@(t,y) ...
                derivative(diffDrive, y, app.robotController(controller3, y, goalPoints, goalRadius)), ...
                tVec, initPose);
            [diffDriveLats, diffDriveLons] = app.utm2deg(diffDrivePose(1:height(diffDrivePose)/height(utmZone):end, 1), diffDrivePose(1:height(diffDrivePose)/height(utmZone):end, 2), utmZone);
            end

            %% Prepare Visualization Data
            if ismember("Unicycle", selectedNodes)
            % Unicycle Model
            unicycleTranslations = [unicyclePose(:,1:2) zeros(size(unicyclePose,1),1)];
            unicycleRot = axang2quat([repmat([0 0 1], size(unicyclePose,1), 1), unicyclePose(:,3)]);
            end
            if ismember("Bicycle", selectedNodes)
            % Bicycle Model
            bicycleTranslations = [bicyclePose(:,1:2) zeros(size(bicyclePose,1),1)];
            bicycleRot = axang2quat([repmat([0 0 1], size(bicyclePose,1), 1), bicyclePose(:,3)]);
            end
            if ismember("Differential", selectedNodes)
            % Differential Drive Model
            diffDriveTranslations = [diffDrivePose(:,1:2) zeros(size(diffDrivePose,1),1)];
            diffDriveRot = axang2quat([repmat([0 0 1], size(diffDrivePose,1), 1), diffDrivePose(:,3)]);
            end

            if ~isstring(app.ActiveTrajectory)
                delete(app.geoPlotAxes)
                geoAxes = geoaxes(app.MapPanel);
                app.geoPlotAxes = geoAxes;
                geoplot(app.geoPlotAxes, app.ActiveTrajectory.Geopoints)
                hold(app.geoPlotAxes, "on")
                geobasemap(app.geoPlotAxes, app.BaseMapDropDown.Value)
                
                if ismember("Unicycle", selectedNodes)
                    geoplot(app.geoPlotAxes, unicycleLats, unicycleLons);
                end
                if ismember("Bicycle", selectedNodes)
                    geoplot(app.geoPlotAxes, bicycleLats, bicycleLons);
                end
                if ismember("Differential", selectedNodes)
                    geoplot(app.geoPlotAxes, diffDriveLats, diffDriveLons);
                end
            end

        end

        % Button pushed function: FixangleButton
        function FixangleButtonPushed(app, event)
        
            % ===== 读取 UI =====
            nw_lat  = app.NWLatitudeEditField.Value;
            nw_lon  = app.NWLongitudeEditField.Value;
            numTraj = app.NumberoftrajectoriesEditField.Value;
            inflR   = app.BuildingAvoidanceSpinner.Value;
        
            % ===== 方框/网格 =====
            d = 256; R = 6371000;
            delta_lat = (d/R) * (180/pi);
            delta_lon = (d/(R*cosd(nw_lat))) * (180/pi);
            se_lat = nw_lat - delta_lat;
            se_lon = nw_lon + delta_lon;
        
            lat_range = linspace(nw_lat, se_lat, 256);
            lon_range = linspace(nw_lon, se_lon, 256);
            [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
        
            % ===== OSM 建筑 → 占据图 =====
            west  = nw_lon - (se_lon - nw_lon);
            south = nw_lat + (se_lat - nw_lat);
            east  = nw_lon + (se_lon - nw_lon);
            north = nw_lat - (se_lat - nw_lat);
        
            osmAPI = sprintf('https://api.openstreetmap.org/api/0.6/map?bbox=%f,%f,%f,%f', ...
                             west, south, east, north);
            osmFile = fullfile(tempdir,'DatasetMapData_test.osm');
            system(sprintf('curl "%s" > "%s"', osmAPI, osmFile));
        
            buildings = readgeotable(osmFile, "layer","buildings");
        
            occupancyMatrix = zeros(256,256);
            if ~isempty(buildings)
                pts = geopointshape(lat_mesh(:), lon_mesh(:));
                occvec = zeros(numel(lat_mesh),1);
                for k = 1:height(buildings)
                    occvec = occvec + isinterior(buildings.Shape(k), pts);
                end
                for r = 1:256
                    rng = (256*(r-1)+1):(256*r);
                    occupancyMatrix(r,:) = occvec(rng).';
                end
            end
        
            % ===== RRT 避障寻路 =====
            ss  = stateSpaceSE2;
            vld = validatorOccupancyMap(ss);
            omap = binaryOccupancyMap(occupancyMatrix);
            inflate(omap, max(0, inflR));
            vld.Map = omap; vld.ValidationDistance = 5;
            ss.StateBounds = [omap.XWorldLimits; omap.YWorldLimits; [-pi pi]];
            pln = plannerRRT(ss, vld, "MaxIterations", 2e4);
            pln.MaxConnectionDistance = 1;
        
            freePix = find(occupancyMatrix==0);
            [yy, xx] = ind2sub([256,256], freePix); %
            validStarts = [xx yy];  % 每行 [x y]
        
            % ===== 生成 numTraj 条 =====
            trajs = cell(numTraj,1);
            i = 0;
            while i < numTraj
                if isempty(validStarts)
                    uialert(app.UIFigure,'无可用起点','Test Generation');
                    break;
                end
                i = i + 1;
        
                startPix = validStarts(randi(size(validStarts,1)),:);
                farMask  = vecnorm(validStarts - startPix,2,2) >= 100;
                candEnds = validStarts(farMask,:);
                if isempty(candEnds), i = i - 1; continue; end
                goalPix  = candEnds(randi(size(candEnds,1)),:);
        
                try
                    [pthObj,~] = pln.plan([startPix 0], [goalPix 0]);
                catch
                    i = i - 1; continue;
                end
                if isempty(pthObj) || pthObj.NumStates==0
                    i = i - 1; continue;
                end
        
                % 采 100 个唯一像素点
                rounded = round(pthObj.States(:,1:2));                 % [x y]
                [uniqXY, ~] = unique(rounded, 'rows', 'stable');
                if size(uniqXY,1) < 100
                    i = i - 1; continue;
                end
                pick  = sort(randperm(size(uniqXY,1), 100));
                ptsXY = uniqXY(pick,:);
        
                % 像素→经纬度（注意 Y 翻转）
                lon = lon_range(ptsXY(:,1));                                         % 1×100
                lat = arrayfun(@(y) lat_range(max(1, min(256, 256 - y + 1))), ...   % 1×100
                               ptsXY(:,2));
        
                % 固定目标 + 每点角度
                tgtOK = false; tries = 0;
                while ~tgtOK && tries < 1000
                    tries = tries + 1;
                    cand = validStarts(randi(size(validStarts,1)), :);  % [x y]
                    if ~ismember(cand, ptsXY, 'rows')
                        tgtOK = true; targetPix = cand;
                    end
                end
                if ~tgtOK, i = i - 1; continue; end
        
                ang = zeros(1,100);
                for n = 1:100
                    dx = targetPix(1) - ptsXY(n,1);
                    dy = -(targetPix(2) - ptsXY(n,2));  % 像素坐标 Y 向下，翻转
                    if dx == 0
                        ang(n) = (dy>0)*90 + (dy<0)*270;
                    elseif dx > 0 && dy > 0
                        ang(n) = atand(dy/dx);
                    elseif dx < 0 && dy < 0
                        ang(n) = 180 + atand(dy/dx);
                    elseif dx < 0
                        ang(n) = 180 - abs(atand(dy/dx));
                    else
                        ang(n) = 360 - abs(atand(dy/dx));
                    end
                end
                ang = reshape(ang, 1, []);          % 明确为行向量
                tgtLat = lat_range(targetPix(2));
                tgtLon = lon_range(targetPix(1));
        % —— 为本条轨迹生成一个束宽（也可做成 UI 输入）——
                beamAngle = randi([6 20]);   % 例：在 6~20 度之间随机一个
                
                % 写入轨迹对象
                traj = trajectory();
                traj.Start        = startPix;
                traj.End          = goalPix;
                traj.Geopoints    = geopointshape(lat(:), lon(:));
                traj.TargetLatLon = [tgtLat, tgtLon];
                traj.Angles       = reshape(ang,1,[]);     % 1×N
                traj.AngleMode    = 'FixedTarget';
                traj.BeamwidthDeg = beamAngle;             % ★ 每条轨迹自己的束宽
                
                trajs{i} = traj;


            end
        
            % ===== 写回 app 状态 & 激活最新一条 =====
            if ~isempty(trajs)
                if isempty(app.Trajectories)
                    app.Trajectories = trajs(:);
                else
                    app.Trajectories = [app.Trajectories; trajs(:)];
                end
        
                items = string(1:numel(app.Trajectories));
                app.SelectTrajectoryDropDown.Items = items;
                app.SelectTrajectoryDropDown.Value = items(end);
        
                app.ActiveTrajectory = app.Trajectories{end};
            end
        

        end

        % Callback function
        function TestSimulateActiveButtonPushedPushed(app, event)
% 只对 TestButton 生成（带 Angles）的当前 ActiveTrajectory 做仿真
% 不读取任何 CSV；Angles/Geopoints 直接来自内存对象

    % === 1) 取当前轨迹，并确认这是“TestButton轨迹”（带 Angles） ===
    tr = app.ActiveTrajectory;
    if isstring(tr) || isempty(tr) || ~isprop(tr,'Geopoints') || isempty(tr.Geopoints)
        uialert(app.UIFigure, '当前没有可用的轨迹。', 'Test Simulate');
        return;
    end
    if ~(isprop(tr,'Angles') && ~isempty(tr.Angles))
        uialert(app.UIFigure, '这条轨迹没有保存 Angles（应由 TestButton 生成）。', 'Test Simulate');
        return;
    end

    % === 2) 从对象直接拿经纬度和角度 ===
    lat = tr.Geopoints.Latitude(:);           % N×1
    lon = tr.Geopoints.Longitude(:);          % N×1
    N   = numel(lat);
    ang = tr.Angles(:).';                     % 1×N
    % 长度对齐（防御）
    if numel(ang) < N, ang = [ang, repmat(ang(end), 1, N-numel(ang))]; end
    if numel(ang) > N, ang = ang(1:N); end

    % === 3) 以当前轨迹的包围盒构造接收机网格（256×256），并用 OSM 建筑过滤 ===
    minLat = min(lat); maxLat = max(lat);
    minLon = min(lon); maxLon = max(lon);
    % 留一点边界缓冲（按度数的 5%）
    padLat = 0.05 * max(1e-6, maxLat - minLat);
    padLon = 0.05 * max(1e-6, maxLon - minLon);
    north = maxLat + padLat;  south = minLat - padLat;
    west  = minLon - padLon;  east  = maxLon + padLon;

    lat_range = linspace(north, south, 256);  % 上→下
    lon_range = linspace(west,  east,  256);  % 左→右
    [lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);

    % 拉取 OSM 建筑（可失败，失败则不裁剪）
    osmAPI = sprintf('https://api.openstreetmap.org/api/0.6/map?bbox=%f,%f,%f,%f', ...
                     west, south, east, north);
    osmTmp = fullfile(tempdir, 'DatasetMapData_active.osm');
    system(sprintf('curl "%s" > "%s"', osmAPI, osmTmp));

    occ = zeros(numel(lat_mesh),1);
    try
        bld = readgeotable(osmTmp, "layer","buildings");
        if ~isempty(bld)
            pts = geopointshape(lat_mesh(:), lon_mesh(:));
            for k = 1:height(bld)
                occ = occ + isinterior(bld.Shape(k), pts);
            end
        end
    catch
        % 忽略 OSM 错误，视为无建筑
    end
    region = [lat_mesh(:), lon_mesh(:), occ];     % [lat lon occ]
    region = region(region(:,3)==0, 1:2);         % 去除建筑内点
    if isempty(region)
        uialert(app.UIFigure, '接收机网格为空（可能被建筑完全覆盖）。', 'Test Simulate');
        return;
    end

    % === 4) 选择输出目录（与原脚本一致：每点一张 xlsx）===
    [fname, fpath] = uiputfile({'*.xlsx','Excel (*.xlsx)'}, ...
        '选择任意文件名以确认输出目录（文件名将忽略）', 'signalmap.xlsx');
    if isequal(fname,0) || isequal(fpath,0)
        return;
    end
    outDir = fullfile(fpath, 'SignalMapData_active');
    if ~exist(outDir,'dir'), mkdir(outDir); end

    % 也顺手保存 beamwidth 以便复用
    beamAngle = randi([6 20]);   % 你原脚本的随机束宽策略
    writematrix(beamAngle, fullfile(outDir, "beamwidth.csv"));

    % === 5) 传播与站点参数（与你脚本一致） ===
    transmitterFreq  = 28e9;     % Hz
    transmitterPower = 1;        % W
    antennaHeight    = 2;        % m
    size_array       = [8 8];

    pm = propagationModel("raytracing", "Method","sbr", ...
                           "MaxNumReflections",1, "MaxNumDiffractions",0);

    % === 6) 进度条 ===
    d = uiprogressdlg(app.UIFigure, 'Title','Test Simulate (Active)', ...
        'Message','Running...', 'Indeterminate','on');
    cleaner = onCleanup(@() (isvalid(d) && close(d)));

    % === 7) 创建 Tx：每个轨迹点一个 Tx，并设置阵列/束宽/角度（来自对象）===
    tx_names = "Tx" + (1:N);
    tx = txsite("Name", tx_names, ...
                "Latitude",  lat, ...
                "Longitude", lon, ...
                "TransmitterFrequency", transmitterFreq, ...
                "TransmitterPower", transmitterPower, ...
                "AntennaHeight", antennaHeight);

    for iTx = 1:N
        lambda = physconst("lightspeed") / transmitterFreq;
        array  = phased.URA('Size', size_array, 'Lattice','Rectangular', 'ArrayNormal','x');
        array.ElementSpacing = [0.5 0.5]*lambda;

        elem = phased.GaussianAntennaElement;
        elem.FrequencyRange = [0 transmitterFreq];
        elem.Beamwidth = [beamAngle beamAngle];

        array.Element = elem;
        tx(iTx).Antenna = array;

        % 关键：使用 TestButton 生成时保存下来的 angle
        tx(iTx).AntennaAngle = ang(iTx);   % degree
    end

    % === 8) 接收机网格 ===
    rx = rxsite("Latitude",  region(:,1), ...
                "Longitude", region(:,2), ...
                "ReceiverSensitivity", -120, ...
                "AntennaHeight", 2);

    % === 9) 逐 Tx 计算并保存（每个点一张表，与脚本一致）===
    fprintf('Active trajectory: total %d maps\n', N);
    for iTx = 1:N
        fprintf('  Computing map %d/%d ... ', iTx, N);
        t0 = tic;

        sigStre = sigstrength(rx, tx(iTx), pm);  % 1×numel(rx)
        T = table(region(:,1), region(:,2), sigStre', ...
                  'VariableNames', {'Latitude','Longitude','Power'});
        writetable(T, fullfile(outDir, sprintf('%d.xlsx', iTx)));

        fprintf('done (%.1fs)\n', toc(t0));
    end

    uialert(app.UIFigure, sprintf('仿真完成（仅 Test 轨迹）：\n%s', outDir), 'Test Simulate');


        end

        % Button pushed function: PairwiseTargetButton
        function PairwiseTargetButtonPushed(app, event)
                   % Button pushed function: PairwiseAngleButton
            % === 0) 基本校验：至少两条轨迹，且 A 有 Geopoints ===
            if isempty(app.Trajectories) || numel(app.Trajectories) < 2
                uialert(app.UIFigure, '至少需要两条轨迹（A 与 B）。', 'Pairwise Angle');
                return;
            end
        
            % 取下拉框当前值作为 A 的索引；B 取下一条（循环）
            valStr = app.SelectTrajectoryDropDown.Value;
            idxA   = str2double(valStr);
            if isnan(idxA) || idxA < 1 || idxA > numel(app.Trajectories)
                uialert(app.UIFigure, '请选择一条有效的轨迹作为 A。', 'Pairwise Angle');
                return;
            end
            idxB = idxA + 1;
            if idxB > numel(app.Trajectories), idxB = 1; end
        
            trajA = app.Trajectories{idxA};
            trajB = app.Trajectories{idxB};
        
            if ~isprop(trajA,'Geopoints') || isempty(trajA.Geopoints)
                uialert(app.UIFigure, '轨迹 A 缺少 Geopoints。', 'Pairwise Angle');
                return;
            end
            if ~isprop(trajB,'Geopoints') || isempty(trajB.Geopoints)
                uialert(app.UIFigure, '轨迹 B 缺少 Geopoints。', 'Pairwise Angle');
                return;
            end
        
            latA = trajA.Geopoints.Latitude(:);
            lonA = trajA.Geopoints.Longitude(:);
            latB = trajB.Geopoints.Latitude(:);
            lonB = trajB.Geopoints.Longitude(:);
        
            NA = numel(latA);
            NB = numel(latB);
        
            % === 1) 若 B 点数与 A 不同，则把 B 重采样到与 A 相同的长度 ===
            if NB ~= NA
                xi   = linspace(1, NB, NA);
                xB   = linspace(1, NB, NB);
                latB = interp1(xB, latB, xi, 'linear');
                lonB = interp1(xB, lonB, xi, 'linear');
                NB   = NA;
            end
        
            % === 2) 逐点对应计算从 A(i) 指向 B(i) 的 angle ===
            ang = zeros(NA,1);
        
            meanLat = (latA + latB) / 2;
            dx = (lonB - lonA) .* cosd(meanLat);  % 东西向
            dy = (latB - latA);                   % 南北向
        
            for n = 1:NA
                if dx(n) == 0 && dy(n) == 0
                    ang(n) = 0;
                    continue;
                end
        
                if dx(n) > 0 && dy(n) >= 0
                    ang(n) = abs(atand(dy(n)/dx(n)));
                elseif dx(n) < 0 && dy(n) >= 0
                    ang(n) = 180 - abs(atand(dy(n)/dx(n)));
                elseif dx(n) < 0 && dy(n) < 0
                    ang(n) = 180 + atand(dy(n)/dx(n));
                elseif dx(n) > 0 && dy(n) < 0
                    ang(n) = 360 - abs(atand(dy(n)/dx(n)));
                elseif dx(n) == 0 && dy(n) > 0
                    ang(n) = 90;
                elseif dx(n) == 0 && dy(n) < 0
                    ang(n) = 270;
                elseif dy(n) == 0 && dx(n) > 0
                    ang(n) = 0;
                else
                    ang(n) = 180;
                end
                ang(n) = mod(ang(n), 360);
            end
        
            % === 3) 打印 angle 结果到命令行 ===
            fprintf('Pairwise angle results for Trajectory %d (relative to %d):\n', idxA, idxB);
            for n = 1:NA
                fprintf('Point %3d: %.2f deg\n', n, ang(n));
            end
        
            % === 4) 写回到 A ===
            trajA.Angles    = reshape(ang, 1, []);   % 行向量
            trajA.AngleMode = 'PairwiseTarget';
            if ~isprop(trajA,'BeamwidthDeg') || isempty(trajA.BeamwidthDeg) || ~isfinite(trajA.BeamwidthDeg)
                trajA.BeamwidthDeg = randi([6 20]);
            end
        
            app.Trajectories{idxA} = trajA;
            app.ActiveTrajectory   = trajA;
        
            uialert(app.UIFigure, sprintf('已为轨迹 %d 计算 Pairwise angles（相对轨迹 %d），结果已打印到命令行。', idxA, idxB), 'Pairwise Angle');

        end

        % Button pushed function: VisualizeABandA1AngleButton
        function VisualizeABandA1AngleButtonPushed(app, event)
        % Button pushed function: VisualizeABandA1AngleButton
            % === 0) 读取 A/B 索引 ===
            if isempty(app.Trajectories) || numel(app.Trajectories) < 2
                uialert(app.UIFigure,'至少需要两条轨迹（A 与 B）','可视化'); return;
            end
            idxA = str2double(app.SelectTrajectoryDropDown.Value);
            if isnan(idxA) || idxA < 1 || idxA > numel(app.Trajectories)
                uialert(app.UIFigure,'请选择一条有效轨迹作为 A','可视化'); return;
            end
            idxB = idxA + 1; if idxB > numel(app.Trajectories), idxB = 1; end
        
            trajA = app.Trajectories{idxA};
            trajB = app.Trajectories{idxB};
            if ~isprop(trajA,'Geopoints') || isempty(trajA.Geopoints)
                uialert(app.UIFigure,'轨迹 A 缺少 Geopoints','可视化'); return; end
            if ~isprop(trajB,'Geopoints') || isempty(trajB.Geopoints)
                uialert(app.UIFigure,'轨迹 B 缺少 Geopoints','可视化'); return; end
        
            latA = trajA.Geopoints.Latitude(:);  lonA = trajA.Geopoints.Longitude(:);
            latB = trajB.Geopoints.Latitude(:);  lonB = trajB.Geopoints.Longitude(:);
        
            % 若点数不同，把 B 重采样到与 A 一致
            NA = numel(latA); NB = numel(latB);
            if NB ~= NA
                xB   = linspace(1, NB, NB);
                xi   = linspace(1, NB, NA);
                latB = interp1(xB, latB, xi, 'linear');
                lonB = interp1(xB, lonB, xi, 'linear');
            end
        
            % === 1) 在 MapPanel 里创建 geoaxes（与原函数相同做法）===
            if isgraphics(app.geoPlotAxes)
                delete(app.geoPlotAxes);
            end
            ax = geoaxes(app.MapPanel);
            app.geoPlotAxes = ax;
            geobasemap(ax, app.BaseMapDropDown.Value);
            hold(ax, "on");
        
            % === 2) 绘制 A 与 B ===
            geoplot(ax, latA, lonA, '-o', 'LineWidth', 1.8, 'MarkerSize', 4, ...
                'DisplayName', sprintf('Trajectory A (%d)', idxA));
            geoplot(ax, latB, lonB, '--s', 'LineWidth', 1.8, 'MarkerSize', 4, ...
                'DisplayName', sprintf('Trajectory B (%d)', idxB));
        
            % 兼容：若 A/B 有 TargetLatLon，保持原来的红点展示
            if isprop(trajA, 'TargetLatLon')
                tgt = trajA.TargetLatLon;
                if numel(tgt)==2 && all(isfinite(tgt))
                    geoscatter(ax, tgt(1), tgt(2), 60, 'red', 'filled', 'DisplayName', 'Target A');
                end
            end
            if isprop(trajB, 'TargetLatLon')
                tgt = trajB.TargetLatLon;
                if numel(tgt)==2 && all(isfinite(tgt))
                    geoscatter(ax, tgt(1), tgt(2), 60, 'red', 'filled', 'DisplayName', 'Target B');
                end
            end
        
            % 自动设定视域（加 5% 边距）
            allLat = [latA; latB]; allLon = [lonA; lonB];
            if ~isempty(allLat) && ~isempty(allLon)
                latPad = max(0.001, 0.05*range(allLat));
                lonPad = max(0.001, 0.05*range(allLon));
                geolimits(ax, [min(allLat)-latPad, max(allLat)+latPad], ...
                               [min(allLon)-lonPad, max(allLon)+lonPad]);
            end
        
            % === 3) 在 A 的第 1、50、100 个点可视化 angle ===
            if ~isprop(trajA,'Angles') || isempty(trajA.Angles)
                text(ax, latA(1), lonA(1), 'Angles 未计算', ...
                    'FontSize', 10, 'Color', 'r', 'FontWeight','bold', 'HorizontalAlignment','left');
            else
                % 只取有效索引（防止轨迹长度 < 100）
                reqIdx = [1, 100];
                idxList = reqIdx(reqIdx >= 1 & reqIdx <= NA & reqIdx <= numel(trajA.Angles));
        
                % 箭头长度（米）
                Lm = 100;
        
                for k = idxList
                    ang = mod(trajA.Angles(k), 360);     % 角度（东=0°、逆时针为正）
                    lat0 = latA(k); lon0 = lonA(k);
        
                    % 箭头端点（用米到经纬度的小偏移）
                    th  = deg2rad(ang);
                    dlat = (Lm/111320) * sin(th);                 % 1°纬≈111320 m
                    dlon = (Lm/(111320*cosd(lat0))) * cos(th);    % 经度需乘 cos(lat)
                    lat1 = lat0 + dlat; lon1 = lon0 + dlon;
        
                    % 点与箭头
                    geoscatter(ax, lat0, lon0, 36, 'k', 'filled', 'DisplayName', sprintf('A(%d)', k));
                    geoplot(ax, [lat0 lat1], [lon0 lon1], '-', 'LineWidth', 3, 'DisplayName', sprintf('A%d angle', k));
        
                    % 文字标注
                    text(ax, lat0, lon0, sprintf('A%d \\angle = %.1f^\\circ', k, ang), ...
                        'FontSize', 10, 'FontWeight', 'bold', 'HorizontalAlignment','left');
                end
            end
        
            legend(ax, 'show', 'Location', 'best');
            hold(ax, "off");


        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.949 0.953 0.961];
            app.UIFigure.Position = [120 60 1440 900];
            app.UIFigure.Name = 'RF Propagation and Trajectory Studio';

            % Create EnvironmentalPropertiesPanel
            app.EnvironmentalPropertiesPanel = uipanel(app.UIFigure);
            app.EnvironmentalPropertiesPanel.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.EnvironmentalPropertiesPanel.Title = 'Scenario Setup';
            app.EnvironmentalPropertiesPanel.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.EnvironmentalPropertiesPanel.Position = [16 670 500 210];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.EnvironmentalPropertiesPanel);
            app.TabGroup.Position = [1 0 498 186];

            % Create TargetRegionTab
            app.TargetRegionTab = uitab(app.TabGroup);
            app.TargetRegionTab.Title = 'Target Region';
            app.TargetRegionTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.TargetRegionTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.TargetRegionTab);
            app.GridLayout2.ColumnWidth = {80, 60, 59, 55, 69, '2.36x'};
            app.GridLayout2.RowHeight = {22, 22, 30, 30};
            app.GridLayout2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];

            % Create PlotTargetRegionButton
            app.PlotTargetRegionButton = uibutton(app.GridLayout2, 'push');
            app.PlotTargetRegionButton.ButtonPushedFcn = createCallbackFcn(app, @PlotTargetRegionButtonPushed, true);
            app.PlotTargetRegionButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PlotTargetRegionButton.FontWeight = 'bold';
            app.PlotTargetRegionButton.Layout.Row = 4;
            app.PlotTargetRegionButton.Layout.Column = [5 6];
            app.PlotTargetRegionButton.Text = 'Plot Target Region';

            % Create NorthEastLatitudeEditFieldLabel
            app.NorthEastLatitudeEditFieldLabel = uilabel(app.GridLayout2);
            app.NorthEastLatitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthEastLatitudeEditFieldLabel.Layout.Row = 1;
            app.NorthEastLatitudeEditFieldLabel.Layout.Column = [1 2];
            app.NorthEastLatitudeEditFieldLabel.Text = 'North-East Latitude';

            % Create NorthEastLatitudeEditField
            app.NorthEastLatitudeEditField = uieditfield(app.GridLayout2, 'numeric');
            app.NorthEastLatitudeEditField.ValueDisplayFormat = '%.4f';
            app.NorthEastLatitudeEditField.HorizontalAlignment = 'left';
            app.NorthEastLatitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthEastLatitudeEditField.Layout.Row = 1;
            app.NorthEastLatitudeEditField.Layout.Column = 3;
            app.NorthEastLatitudeEditField.Value = 33.1947;

            % Create SouthWestLongitudeLabel
            app.SouthWestLongitudeLabel = uilabel(app.GridLayout2);
            app.SouthWestLongitudeLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SouthWestLongitudeLabel.Layout.Row = 2;
            app.SouthWestLongitudeLabel.Layout.Column = [1 2];
            app.SouthWestLongitudeLabel.Text = 'South-West Latitude';

            % Create SouthWestLatitudeEditField
            app.SouthWestLatitudeEditField = uieditfield(app.GridLayout2, 'numeric');
            app.SouthWestLatitudeEditField.ValueDisplayFormat = '%.4f';
            app.SouthWestLatitudeEditField.HorizontalAlignment = 'left';
            app.SouthWestLatitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SouthWestLatitudeEditField.Layout.Row = 2;
            app.SouthWestLatitudeEditField.Layout.Column = 3;
            app.SouthWestLatitudeEditField.Value = 33.2647;

            % Create NorthEastLongitudeEditFieldLabel
            app.NorthEastLongitudeEditFieldLabel = uilabel(app.GridLayout2);
            app.NorthEastLongitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthEastLongitudeEditFieldLabel.Layout.Row = 1;
            app.NorthEastLongitudeEditFieldLabel.Layout.Column = [4 5];
            app.NorthEastLongitudeEditFieldLabel.Text = 'North-East Longitude';

            % Create NorthEastLongitudeEditField
            app.NorthEastLongitudeEditField = uieditfield(app.GridLayout2, 'numeric');
            app.NorthEastLongitudeEditField.ValueDisplayFormat = '%.4f';
            app.NorthEastLongitudeEditField.HorizontalAlignment = 'left';
            app.NorthEastLongitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthEastLongitudeEditField.Layout.Row = 1;
            app.NorthEastLongitudeEditField.Layout.Column = 6;
            app.NorthEastLongitudeEditField.Value = -97.1979;

            % Create SouthWestLongitudeEditField_2Label
            app.SouthWestLongitudeEditField_2Label = uilabel(app.GridLayout2);
            app.SouthWestLongitudeEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SouthWestLongitudeEditField_2Label.Layout.Row = 2;
            app.SouthWestLongitudeEditField_2Label.Layout.Column = [4 5];
            app.SouthWestLongitudeEditField_2Label.Text = 'South-West Longitude';

            % Create SouthWestLongitudeEditField
            app.SouthWestLongitudeEditField = uieditfield(app.GridLayout2, 'numeric');
            app.SouthWestLongitudeEditField.ValueDisplayFormat = '%.4f';
            app.SouthWestLongitudeEditField.HorizontalAlignment = 'left';
            app.SouthWestLongitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SouthWestLongitudeEditField.Layout.Row = 2;
            app.SouthWestLongitudeEditField.Layout.Column = 6;
            app.SouthWestLongitudeEditField.Value = -97.1045;

            % Create AdvancedPropertiesButton
            app.AdvancedPropertiesButton = uibutton(app.GridLayout2, 'push');
            app.AdvancedPropertiesButton.ButtonPushedFcn = createCallbackFcn(app, @AdvancedPropertiesButtonPushed, true);
            app.AdvancedPropertiesButton.HorizontalAlignment = 'left';
            app.AdvancedPropertiesButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.AdvancedPropertiesButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.AdvancedPropertiesButton.Layout.Row = 4;
            app.AdvancedPropertiesButton.Layout.Column = [3 4];
            app.AdvancedPropertiesButton.Text = 'Advanced Properties';

            % Create PropagationModelDropDownLabel
            app.PropagationModelDropDownLabel = uilabel(app.GridLayout2);
            app.PropagationModelDropDownLabel.FontWeight = 'bold';
            app.PropagationModelDropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PropagationModelDropDownLabel.Layout.Row = 3;
            app.PropagationModelDropDownLabel.Layout.Column = [1 2];
            app.PropagationModelDropDownLabel.Text = 'Propagation Model';

            % Create PropagationModelDropDown
            app.PropagationModelDropDown = uidropdown(app.GridLayout2);
            app.PropagationModelDropDown.Items = {'freespace', 'close-in', 'rain', 'gas', 'fog', 'longley-rice', 'raytracing', 'user-defined'};
            app.PropagationModelDropDown.ItemsData = {'freespace', 'close-in', 'rain', 'gas', 'fog', 'longley-rice', 'raytracing', 'userdefined'};
            app.PropagationModelDropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PropagationModelDropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PropagationModelDropDown.Layout.Row = 4;
            app.PropagationModelDropDown.Layout.Column = [1 2];
            app.PropagationModelDropDown.Value = 'raytracing';

            % Create SyntheticTrajectoryGeneratorTab
            app.SyntheticTrajectoryGeneratorTab = uitab(app.TabGroup);
            app.SyntheticTrajectoryGeneratorTab.Title = 'Trajectory Lab';
            app.SyntheticTrajectoryGeneratorTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SyntheticTrajectoryGeneratorTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.SyntheticTrajectoryGeneratorTab);
            app.TabGroup4.Position = [-1 -1 469 161];

            % Create RandomPathGenerationTab
            app.RandomPathGenerationTab = uitab(app.TabGroup4);
            app.RandomPathGenerationTab.Title = 'Trajectory Authoring';
            app.RandomPathGenerationTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomPathGenerationTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create TabGroup6_4
            app.TabGroup6_4 = uitabgroup(app.RandomPathGenerationTab);
            app.TabGroup6_4.Position = [1 1 468 139];

            % Create PathGenerationTab
            app.PathGenerationTab = uitab(app.TabGroup6_4);
            app.PathGenerationTab.Title = 'Path Design';
            app.PathGenerationTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PathGenerationTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create RandomangleButton
            app.RandomangleButton = uibutton(app.PathGenerationTab, 'push');
            app.RandomangleButton.ButtonPushedFcn = createCallbackFcn(app, @RandomangleButtonPushed, true);
            app.RandomangleButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomangleButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomangleButton.Position = [24 14 93 23];
            app.RandomangleButton.Text = 'Random angle';

            % Create NumberoftrajectoriesEditFieldLabel
            app.NumberoftrajectoriesEditFieldLabel = uilabel(app.PathGenerationTab);
            app.NumberoftrajectoriesEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberoftrajectoriesEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NumberoftrajectoriesEditFieldLabel.Position = [206 87 123 22];
            app.NumberoftrajectoriesEditFieldLabel.Text = 'Number of trajectories';

            % Create NumberoftrajectoriesEditField
            app.NumberoftrajectoriesEditField = uieditfield(app.PathGenerationTab, 'numeric');
            app.NumberoftrajectoriesEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NumberoftrajectoriesEditField.Position = [344 87 100 22];
            app.NumberoftrajectoriesEditField.Value = 2;

            % Create NWLatitudeEditFieldLabel
            app.NWLatitudeEditFieldLabel = uilabel(app.PathGenerationTab);
            app.NWLatitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NWLatitudeEditFieldLabel.Position = [8 84 71 22];
            app.NWLatitudeEditFieldLabel.Text = 'NW Latitude';

            % Create NWLatitudeEditField
            app.NWLatitudeEditField = uieditfield(app.PathGenerationTab, 'numeric');
            app.NWLatitudeEditField.ValueDisplayFormat = '%.5f';
            app.NWLatitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NWLatitudeEditField.Position = [94 84 100 22];
            app.NWLatitudeEditField.Value = 29.83387;

            % Create NWLongitudeEditFieldLabel
            app.NWLongitudeEditFieldLabel = uilabel(app.PathGenerationTab);
            app.NWLongitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NWLongitudeEditFieldLabel.Position = [7 50 81 22];
            app.NWLongitudeEditFieldLabel.Text = 'NW Longitude';

            % Create NWLongitudeEditField
            app.NWLongitudeEditField = uieditfield(app.PathGenerationTab, 'numeric');
            app.NWLongitudeEditField.ValueDisplayFormat = '%.5f';
            app.NWLongitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NWLongitudeEditField.Position = [94 50 100 22];
            app.NWLongitudeEditField.Value = -95.4289;

            % Create BuildingAvoidanceSpinnerLabel
            app.BuildingAvoidanceSpinnerLabel = uilabel(app.PathGenerationTab);
            app.BuildingAvoidanceSpinnerLabel.HorizontalAlignment = 'right';
            app.BuildingAvoidanceSpinnerLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.BuildingAvoidanceSpinnerLabel.Position = [206 50 106 22];
            app.BuildingAvoidanceSpinnerLabel.Text = 'Building Avoidance';

            % Create BuildingAvoidanceSpinner
            app.BuildingAvoidanceSpinner = uispinner(app.PathGenerationTab);
            app.BuildingAvoidanceSpinner.Limits = [1 5];
            app.BuildingAvoidanceSpinner.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.BuildingAvoidanceSpinner.Position = [344 50 100 22];
            app.BuildingAvoidanceSpinner.Value = 1;

            % Create FixangleButton
            app.FixangleButton = uibutton(app.PathGenerationTab, 'push');
            app.FixangleButton.ButtonPushedFcn = createCallbackFcn(app, @FixangleButtonPushed, true);
            app.FixangleButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.FixangleButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.FixangleButton.Position = [178 15 93 23];
            app.FixangleButton.Text = 'Fix angle';

            % Create PairwiseTargetButton
            app.PairwiseTargetButton = uibutton(app.PathGenerationTab, 'push');
            app.PairwiseTargetButton.ButtonPushedFcn = createCallbackFcn(app, @PairwiseTargetButtonPushed, true);
            app.PairwiseTargetButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PairwiseTargetButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PairwiseTargetButton.Position = [335 14 100 23];
            app.PairwiseTargetButton.Text = 'PairwiseTarget';

            % Create PathVisualizationandSimulationTab
            app.PathVisualizationandSimulationTab = uitab(app.TabGroup6_4);
            app.PathVisualizationandSimulationTab.Title = 'Trajectory Playback';
            app.PathVisualizationandSimulationTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PathVisualizationandSimulationTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create SelectTrajectoryDropDownLabel
            app.SelectTrajectoryDropDownLabel = uilabel(app.PathVisualizationandSimulationTab);
            app.SelectTrajectoryDropDownLabel.HorizontalAlignment = 'right';
            app.SelectTrajectoryDropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SelectTrajectoryDropDownLabel.Position = [6 86 94 22];
            app.SelectTrajectoryDropDownLabel.Text = 'Select Trajectory';

            % Create SelectTrajectoryDropDown
            app.SelectTrajectoryDropDown = uidropdown(app.PathVisualizationandSimulationTab);
            app.SelectTrajectoryDropDown.Items = {};
            app.SelectTrajectoryDropDown.ValueChangedFcn = createCallbackFcn(app, @SelectTrajectoryDropDownValueChanged, true);
            app.SelectTrajectoryDropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SelectTrajectoryDropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SelectTrajectoryDropDown.Placeholder = 'None';
            app.SelectTrajectoryDropDown.Position = [115 86 100 22];
            app.SelectTrajectoryDropDown.Value = {};

            % Create VisualizeTrajectoryButton
            app.VisualizeTrajectoryButton = uibutton(app.PathVisualizationandSimulationTab, 'push');
            app.VisualizeTrajectoryButton.ButtonPushedFcn = createCallbackFcn(app, @VisualizeTrajectoryButtonPushed, true);
            app.VisualizeTrajectoryButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VisualizeTrajectoryButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeTrajectoryButton.Position = [19 43 118 22];
            app.VisualizeTrajectoryButton.Text = 'Visualize Trajectory';

            % Create SimulateSignalAlongTrajectoryButton
            app.SimulateSignalAlongTrajectoryButton = uibutton(app.PathVisualizationandSimulationTab, 'push');
            app.SimulateSignalAlongTrajectoryButton.ButtonPushedFcn = createCallbackFcn(app, @SimulateSignalAlongTrajectoryButtonPushed, true);
            app.SimulateSignalAlongTrajectoryButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SimulateSignalAlongTrajectoryButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SimulateSignalAlongTrajectoryButton.Position = [240 14 187 22];
            app.SimulateSignalAlongTrajectoryButton.Text = 'Simulate Signal Along Trajectory';

            % Create SaveTrajectoryButton
            app.SaveTrajectoryButton = uibutton(app.PathVisualizationandSimulationTab, 'push');
            app.SaveTrajectoryButton.ButtonPushedFcn = createCallbackFcn(app, @SaveTrajectoryButtonPushed, true);
            app.SaveTrajectoryButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SaveTrajectoryButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SaveTrajectoryButton.Position = [240 86 100 22];
            app.SaveTrajectoryButton.Text = 'Save Trajectory';

            % Create SaveAllButton
            app.SaveAllButton = uibutton(app.PathVisualizationandSimulationTab, 'push');
            app.SaveAllButton.ButtonPushedFcn = createCallbackFcn(app, @SaveAllButtonPushed, true);
            app.SaveAllButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SaveAllButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SaveAllButton.Position = [367 88 100 22];
            app.SaveAllButton.Text = 'Save All';

            % Create SimulateAllButton
            app.SimulateAllButton = uibutton(app.PathVisualizationandSimulationTab, 'push');
            app.SimulateAllButton.ButtonPushedFcn = createCallbackFcn(app, @SimulateAllButtonPushed, true);
            app.SimulateAllButton.HorizontalAlignment = 'left';
            app.SimulateAllButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SimulateAllButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SimulateAllButton.Position = [19 14 76 22];
            app.SimulateAllButton.Text = 'Simulate All';

            % Create VisualizeABandA1AngleButton
            app.VisualizeABandA1AngleButton = uibutton(app.PathVisualizationandSimulationTab, 'push');
            app.VisualizeABandA1AngleButton.ButtonPushedFcn = createCallbackFcn(app, @VisualizeABandA1AngleButtonPushed, true);
            app.VisualizeABandA1AngleButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VisualizeABandA1AngleButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeABandA1AngleButton.Position = [240 45 179 23];
            app.VisualizeABandA1AngleButton.Text = 'VisualizeABandA1AngleButton';

            % Create VehicleVariationTab
            app.VehicleVariationTab = uitab(app.TabGroup6_4);
            app.VehicleVariationTab.Title = 'Vehicle Models';
            app.VehicleVariationTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VehicleVariationTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create VehicleTree
            app.VehicleTree = uitree(app.VehicleVariationTab, 'checkbox');
            app.VehicleTree.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VehicleTree.Position = [7 2 150 108];

            % Create VehiclesNode
            app.VehiclesNode = uitreenode(app.VehicleTree);
            app.VehiclesNode.Text = 'Vehicles';

            % Create UnicycleNode
            app.UnicycleNode = uitreenode(app.VehiclesNode);
            app.UnicycleNode.Text = 'Unicycle';

            % Create BicycleNode
            app.BicycleNode = uitreenode(app.VehiclesNode);
            app.BicycleNode.Text = 'Bicycle';

            % Create DifferentialNode
            app.DifferentialNode = uitreenode(app.VehiclesNode);
            app.DifferentialNode.Text = 'Differential';

            % Assign Checked Nodes
            app.VehicleTree.CheckedNodes = [app.UnicycleNode, app.BicycleNode, app.DifferentialNode, app.VehiclesNode];

            % Create VisualizeVehicleVariationsButton
            app.VisualizeVehicleVariationsButton = uibutton(app.VehicleVariationTab, 'push');
            app.VisualizeVehicleVariationsButton.ButtonPushedFcn = createCallbackFcn(app, @VisualizeVehicleVariationsButtonPushed, true);
            app.VisualizeVehicleVariationsButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VisualizeVehicleVariationsButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeVehicleVariationsButton.Position = [274 47 160 22];
            app.VisualizeVehicleVariationsButton.Text = 'Visualize Vehicle Variations';

            % Create TransformerGenerationTab
            app.TransformerGenerationTab = uitab(app.TabGroup4);
            app.TransformerGenerationTab.Title = 'Sequence Generation';
            app.TransformerGenerationTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.TransformerGenerationTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create TabGroup6_3
            app.TabGroup6_3 = uitabgroup(app.TransformerGenerationTab);
            app.TabGroup6_3.Position = [1 2 470 135];

            % Create AllNodeVisualizationTab
            app.AllNodeVisualizationTab = uitab(app.TabGroup6_3);
            app.AllNodeVisualizationTab.Title = 'Network Nodes';
            app.AllNodeVisualizationTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.AllNodeVisualizationTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create VisualizeNetworkNodesButton
            app.VisualizeNetworkNodesButton = uibutton(app.AllNodeVisualizationTab, 'push');
            app.VisualizeNetworkNodesButton.ButtonPushedFcn = createCallbackFcn(app, @VisualizeNetworkNodesButtonPushed, true);
            app.VisualizeNetworkNodesButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VisualizeNetworkNodesButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeNetworkNodesButton.Position = [150 53 148 23];
            app.VisualizeNetworkNodesButton.Text = 'Visualize Network Nodes';

            % Create VisualizeallnodesforretrievingavailableNodeIDsinnetworkLabel
            app.VisualizeallnodesforretrievingavailableNodeIDsinnetworkLabel = uilabel(app.AllNodeVisualizationTab);
            app.VisualizeallnodesforretrievingavailableNodeIDsinnetworkLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeallnodesforretrievingavailableNodeIDsinnetworkLabel.Position = [57 83 341 22];
            app.VisualizeallnodesforretrievingavailableNodeIDsinnetworkLabel.Text = 'Visualize all nodes for retrieving available Node IDs in network';

            % Create SingleSeedInputTab
            app.SingleSeedInputTab = uitab(app.TabGroup6_3);
            app.SingleSeedInputTab.Title = 'Single Seed';
            app.SingleSeedInputTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SingleSeedInputTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create GenerateTrajectoryButton
            app.GenerateTrajectoryButton = uibutton(app.SingleSeedInputTab, 'push');
            app.GenerateTrajectoryButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateTrajectoryButtonPushed, true);
            app.GenerateTrajectoryButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.GenerateTrajectoryButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.GenerateTrajectoryButton.Position = [332 45 121 23];
            app.GenerateTrajectoryButton.Text = 'Generate Trajectory';

            % Create SeedTrajectoryEditField_2Label
            app.SeedTrajectoryEditField_2Label = uilabel(app.SingleSeedInputTab);
            app.SeedTrajectoryEditField_2Label.HorizontalAlignment = 'right';
            app.SeedTrajectoryEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SeedTrajectoryEditField_2Label.Position = [16 74 89 22];
            app.SeedTrajectoryEditField_2Label.Text = 'Seed Trajectory';

            % Create SeedTrajectoryEditField
            app.SeedTrajectoryEditField = uieditfield(app.SingleSeedInputTab, 'text');
            app.SeedTrajectoryEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SeedTrajectoryEditField.Position = [13 45 313 22];
            app.SeedTrajectoryEditField.Value = '18429, 14796, 2924';

            % Create Label
            app.Label = uilabel(app.SingleSeedInputTab);
            app.Label.HorizontalAlignment = 'center';
            app.Label.WordWrap = 'on';
            app.Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.Label.Position = [7 82 445 22];
            app.Label.Text = '';

            % Create BatchInputsTab
            app.BatchInputsTab = uitab(app.TabGroup6_3);
            app.BatchInputsTab.Title = 'Batch Seeds';
            app.BatchInputsTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.BatchInputsTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create UploadmatFileButton
            app.UploadmatFileButton = uibutton(app.BatchInputsTab, 'push');
            app.UploadmatFileButton.ButtonPushedFcn = createCallbackFcn(app, @UploadmatFileButtonPushed, true);
            app.UploadmatFileButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.UploadmatFileButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.UploadmatFileButton.Position = [176 53 102 23];
            app.UploadmatFileButton.Text = 'Upload .mat File';

            % Create Label_2
            app.Label_2 = uilabel(app.BatchInputsTab);
            app.Label_2.HorizontalAlignment = 'center';
            app.Label_2.WordWrap = 'on';
            app.Label_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.Label_2.Position = [8 83 445 22];
            app.Label_2.Text = '';

            % Create MapPanel_2
            app.MapPanel_2 = uipanel(app.UIFigure);
            app.MapPanel_2.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.MapPanel_2.Title = 'Map Workspace';
            app.MapPanel_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.MapPanel_2.Position = [536 388 888 492];

            % Create MapPanel
            app.MapPanel = uipanel(app.MapPanel_2);
            app.MapPanel.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.MapPanel.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.MapPanel.Position = [8 8 870 448];

            % Create BaseMapDropDownLabel
            app.BaseMapDropDownLabel = uilabel(app.MapPanel_2);
            app.BaseMapDropDownLabel.HorizontalAlignment = 'right';
            app.BaseMapDropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.BaseMapDropDownLabel.Position = [18 458 59 22];
            app.BaseMapDropDownLabel.Text = 'Base Map';

            % Create BaseMapDropDown
            app.BaseMapDropDown = uidropdown(app.MapPanel_2);
            app.BaseMapDropDown.Items = {'streets', 'darkwater', 'grayland', 'bluegreen', 'grayterrain', 'colorterrain', 'landcover', 'streets-light', 'streets-dark', 'satellite', 'topographic'};
            app.BaseMapDropDown.ValueChangedFcn = createCallbackFcn(app, @BaseMapDropDownValueChanged, true);
            app.BaseMapDropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.BaseMapDropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.BaseMapDropDown.Position = [86 458 130 22];
            app.BaseMapDropDown.Value = 'streets';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.UIFigure);
            app.TabGroup3.Position = [16 18 500 636];

            % Create SignalMapGenerationTab_2
            app.SignalMapGenerationTab_2 = uitab(app.TabGroup3);
            app.SignalMapGenerationTab_2.Title = 'Dataset and Signal Maps';
            app.SignalMapGenerationTab_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.SignalMapGenerationTab_2);
            app.GridLayout.ColumnWidth = {43, 70, 62, 45, 50, 50, 10, 56};
            app.GridLayout.RowHeight = {22, 22, 27, 23, 22, 22, 22, 22, 22, 22, 22, 22, 30, 22, 22, 22};
            app.GridLayout.ColumnSpacing = 5.4;
            app.GridLayout.RowSpacing = 6.94117647058824;
            app.GridLayout.Padding = [5.4 6.94117647058824 5.4 6.94117647058824];
            app.GridLayout.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];

            % Create GenerateRandomSitesButton
            app.GenerateRandomSitesButton = uibutton(app.GridLayout, 'push');
            app.GenerateRandomSitesButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateRandomSitesButtonPushed, true);
            app.GenerateRandomSitesButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.GenerateRandomSitesButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.GenerateRandomSitesButton.Layout.Row = 3;
            app.GenerateRandomSitesButton.Layout.Column = [5 8];
            app.GenerateRandomSitesButton.Text = 'Generate Random Sites';

            % Create VisualizeSiteCoverageAreaButton
            app.VisualizeSiteCoverageAreaButton = uibutton(app.GridLayout, 'push');
            app.VisualizeSiteCoverageAreaButton.ButtonPushedFcn = createCallbackFcn(app, @VisualizeSiteCoverageAreaButtonPushed, true);
            app.VisualizeSiteCoverageAreaButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VisualizeSiteCoverageAreaButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeSiteCoverageAreaButton.Enable = 'off';
            app.VisualizeSiteCoverageAreaButton.Visible = 'off';
            app.VisualizeSiteCoverageAreaButton.Layout.Row = 6;
            app.VisualizeSiteCoverageAreaButton.Layout.Column = [5 8];
            app.VisualizeSiteCoverageAreaButton.Text = 'Visualize Site Coverage Area';

            % Create SaveButton
            app.SaveButton = uibutton(app.GridLayout, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.HorizontalAlignment = 'left';
            app.SaveButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SaveButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SaveButton.Layout.Row = 9;
            app.SaveButton.Layout.Column = 5;
            app.SaveButton.Text = 'Save';

            % Create MobilityButton
            app.MobilityButton = uibutton(app.GridLayout, 'push');
            app.MobilityButton.ButtonPushedFcn = createCallbackFcn(app, @MobilityButtonPushed, true);
            app.MobilityButton.WordWrap = 'on';
            app.MobilityButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.MobilityButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.MobilityButton.Layout.Row = 4;
            app.MobilityButton.Layout.Column = 5;
            app.MobilityButton.Text = 'Mobility';

            % Create AdvancedAntennaPropertiesButton
            app.AdvancedAntennaPropertiesButton = uibutton(app.GridLayout, 'push');
            app.AdvancedAntennaPropertiesButton.ButtonPushedFcn = createCallbackFcn(app, @AdvancedAntennaPropertiesButtonPushed, true);
            app.AdvancedAntennaPropertiesButton.HorizontalAlignment = 'left';
            app.AdvancedAntennaPropertiesButton.WordWrap = 'on';
            app.AdvancedAntennaPropertiesButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.AdvancedAntennaPropertiesButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.AdvancedAntennaPropertiesButton.Layout.Row = 4;
            app.AdvancedAntennaPropertiesButton.Layout.Column = [6 8];
            app.AdvancedAntennaPropertiesButton.Text = 'Advanced Antenna Properties';

            % Create GenerateregionheatmapLabel
            app.GenerateregionheatmapLabel = uilabel(app.GridLayout);
            app.GenerateregionheatmapLabel.FontWeight = 'bold';
            app.GenerateregionheatmapLabel.FontColor = [0 0 1];
            app.GenerateregionheatmapLabel.Layout.Row = 2;
            app.GenerateregionheatmapLabel.Layout.Column = [1 3];
            app.GenerateregionheatmapLabel.Text = 'Generate region heatmap';

            % Create NorthWestLatitudeEditFieldLabel
            app.NorthWestLatitudeEditFieldLabel = uilabel(app.GridLayout);
            app.NorthWestLatitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthWestLatitudeEditFieldLabel.Layout.Row = 1;
            app.NorthWestLatitudeEditFieldLabel.Layout.Column = [1 2];
            app.NorthWestLatitudeEditFieldLabel.Text = 'North-West Latitude';

            % Create NorthWestLatitudeEditField
            app.NorthWestLatitudeEditField = uieditfield(app.GridLayout, 'numeric');
            app.NorthWestLatitudeEditField.ValueDisplayFormat = '%.4f';
            app.NorthWestLatitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthWestLatitudeEditField.Layout.Row = 1;
            app.NorthWestLatitudeEditField.Layout.Column = 3;
            app.NorthWestLatitudeEditField.Value = 33.2145;

            % Create NorthWestLongitudeEditFieldLabel
            app.NorthWestLongitudeEditFieldLabel = uilabel(app.GridLayout);
            app.NorthWestLongitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthWestLongitudeEditFieldLabel.Layout.Row = 1;
            app.NorthWestLongitudeEditFieldLabel.Layout.Column = [5 7];
            app.NorthWestLongitudeEditFieldLabel.Text = 'North-West Longitude';

            % Create NorthWestLongitudeEditField
            app.NorthWestLongitudeEditField = uieditfield(app.GridLayout, 'numeric');
            app.NorthWestLongitudeEditField.ValueDisplayFormat = '%.4f';
            app.NorthWestLongitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NorthWestLongitudeEditField.Layout.Row = 1;
            app.NorthWestLongitudeEditField.Layout.Column = 8;
            app.NorthWestLongitudeEditField.Value = -97.1442;

            % Create DistributionDropDown_2Label
            app.DistributionDropDown_2Label = uilabel(app.GridLayout);
            app.DistributionDropDown_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.DistributionDropDown_2Label.Layout.Row = 4;
            app.DistributionDropDown_2Label.Layout.Column = [1 4];
            app.DistributionDropDown_2Label.Text = 'Distribution';

            % Create DistributionDropDown_2
            app.DistributionDropDown_2 = uidropdown(app.GridLayout);
            app.DistributionDropDown_2.Items = {'Linear'};
            app.DistributionDropDown_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.DistributionDropDown_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.DistributionDropDown_2.Layout.Row = 4;
            app.DistributionDropDown_2.Layout.Column = [3 4];
            app.DistributionDropDown_2.Value = 'Linear';

            % Create NumberofTransmitterinaRegionDropDownLabel
            app.NumberofTransmitterinaRegionDropDownLabel = uilabel(app.GridLayout);
            app.NumberofTransmitterinaRegionDropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NumberofTransmitterinaRegionDropDownLabel.Layout.Row = 3;
            app.NumberofTransmitterinaRegionDropDownLabel.Layout.Column = [1 3];
            app.NumberofTransmitterinaRegionDropDownLabel.Text = 'Number of Transmitter in a Region';

            % Create NumberofTransmitterinaRegionDropDown
            app.NumberofTransmitterinaRegionDropDown = uidropdown(app.GridLayout);
            app.NumberofTransmitterinaRegionDropDown.Items = {'1', '2'};
            app.NumberofTransmitterinaRegionDropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NumberofTransmitterinaRegionDropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.NumberofTransmitterinaRegionDropDown.Layout.Row = 3;
            app.NumberofTransmitterinaRegionDropDown.Layout.Column = 4;
            app.NumberofTransmitterinaRegionDropDown.Value = '1';

            % Create RandomSitesDropDownLabel
            app.RandomSitesDropDownLabel = uilabel(app.GridLayout);
            app.RandomSitesDropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomSitesDropDownLabel.Enable = 'off';
            app.RandomSitesDropDownLabel.Visible = 'off';
            app.RandomSitesDropDownLabel.Layout.Row = 11;
            app.RandomSitesDropDownLabel.Layout.Column = [1 3];
            app.RandomSitesDropDownLabel.Text = 'Random Sites';

            % Create RandomSitesDropDown
            app.RandomSitesDropDown = uidropdown(app.GridLayout);
            app.RandomSitesDropDown.Enable = 'off';
            app.RandomSitesDropDown.Visible = 'off';
            app.RandomSitesDropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomSitesDropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomSitesDropDown.Layout.Row = 11;
            app.RandomSitesDropDown.Layout.Column = [4 5];

            % Create PathofDirectoryEditFieldLabel
            app.PathofDirectoryEditFieldLabel = uilabel(app.GridLayout);
            app.PathofDirectoryEditFieldLabel.FontWeight = 'bold';
            app.PathofDirectoryEditFieldLabel.Layout.Row = 7;
            app.PathofDirectoryEditFieldLabel.Layout.Column = [1 4];
            app.PathofDirectoryEditFieldLabel.Text = 'Path of Directory ';

            % Create PathofDirectoryEditField
            app.PathofDirectoryEditField = uieditfield(app.GridLayout, 'text');
            app.PathofDirectoryEditField.HorizontalAlignment = 'center';
            app.PathofDirectoryEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PathofDirectoryEditField.Layout.Row = [8 10];
            app.PathofDirectoryEditField.Layout.Column = [1 4];
            app.PathofDirectoryEditField.Value = 'C:\Users\OneDrive\Desktop\test';

            % Create StatusEditFieldLabel
            app.StatusEditFieldLabel = uilabel(app.GridLayout);
            app.StatusEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.StatusEditFieldLabel.Enable = 'off';
            app.StatusEditFieldLabel.Layout.Row = 8;
            app.StatusEditFieldLabel.Layout.Column = 5;
            app.StatusEditFieldLabel.Text = 'Status';

            % Create StatusEditField
            app.StatusEditField = uieditfield(app.GridLayout, 'text');
            app.StatusEditField.Editable = 'off';
            app.StatusEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.StatusEditField.Enable = 'off';
            app.StatusEditField.Layout.Row = 8;
            app.StatusEditField.Layout.Column = [6 8];
            app.StatusEditField.Value = 'Not Saving';

            % Create NumberofSampleEditFieldLabel
            app.NumberofSampleEditFieldLabel = uilabel(app.GridLayout);
            app.NumberofSampleEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NumberofSampleEditFieldLabel.Enable = 'off';
            app.NumberofSampleEditFieldLabel.Layout.Row = 5;
            app.NumberofSampleEditFieldLabel.Layout.Column = [5 7];
            app.NumberofSampleEditFieldLabel.Text = 'Number of Sample ';

            % Create NumberofSampleEditField
            app.NumberofSampleEditField = uieditfield(app.GridLayout, 'numeric');
            app.NumberofSampleEditField.Limits = [1 Inf];
            app.NumberofSampleEditField.ValueDisplayFormat = '%.0f';
            app.NumberofSampleEditField.Editable = 'off';
            app.NumberofSampleEditField.HorizontalAlignment = 'left';
            app.NumberofSampleEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NumberofSampleEditField.Enable = 'off';
            app.NumberofSampleEditField.Layout.Row = 5;
            app.NumberofSampleEditField.Layout.Column = 8;
            app.NumberofSampleEditField.Value = 65536;

            % Create mEditFieldLabel
            app.mEditFieldLabel = uilabel(app.GridLayout);
            app.mEditFieldLabel.HorizontalAlignment = 'right';
            app.mEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.mEditFieldLabel.Enable = 'off';
            app.mEditFieldLabel.Visible = 'off';
            app.mEditFieldLabel.Layout.Row = 13;
            app.mEditFieldLabel.Layout.Column = 5;
            app.mEditFieldLabel.Text = 'm';

            % Create mEditField
            app.mEditField = uieditfield(app.GridLayout, 'numeric');
            app.mEditField.Limits = [1 Inf];
            app.mEditField.ValueChangedFcn = createCallbackFcn(app, @mEditFieldValueChanged, true);
            app.mEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.mEditField.Enable = 'off';
            app.mEditField.Visible = 'off';
            app.mEditField.Layout.Row = 16;
            app.mEditField.Layout.Column = [6 7];
            app.mEditField.Value = 1;

            % Create TransmitterFrequencye9HzEditField_2Label
            app.TransmitterFrequencye9HzEditField_2Label = uilabel(app.GridLayout);
            app.TransmitterFrequencye9HzEditField_2Label.FontWeight = 'bold';
            app.TransmitterFrequencye9HzEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterFrequencye9HzEditField_2Label.Layout.Row = 5;
            app.TransmitterFrequencye9HzEditField_2Label.Layout.Column = [1 3];
            app.TransmitterFrequencye9HzEditField_2Label.Text = 'Transmitter Frequency (*e9 Hz)';

            % Create TransmitterFrequencye9HzEditField_2
            app.TransmitterFrequencye9HzEditField_2 = uieditfield(app.GridLayout, 'numeric');
            app.TransmitterFrequencye9HzEditField_2.HorizontalAlignment = 'left';
            app.TransmitterFrequencye9HzEditField_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterFrequencye9HzEditField_2.Layout.Row = 5;
            app.TransmitterFrequencye9HzEditField_2.Layout.Column = 4;
            app.TransmitterFrequencye9HzEditField_2.Value = 5.9;

            % Create TransmitterPowerdBmEditFieldLabel
            app.TransmitterPowerdBmEditFieldLabel = uilabel(app.GridLayout);
            app.TransmitterPowerdBmEditFieldLabel.FontWeight = 'bold';
            app.TransmitterPowerdBmEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterPowerdBmEditFieldLabel.Layout.Row = 6;
            app.TransmitterPowerdBmEditFieldLabel.Layout.Column = [1 3];
            app.TransmitterPowerdBmEditFieldLabel.Text = 'Transmitter Power (dBm)';

            % Create TransmitterPowerdBmEditField
            app.TransmitterPowerdBmEditField = uieditfield(app.GridLayout, 'numeric');
            app.TransmitterPowerdBmEditField.HorizontalAlignment = 'left';
            app.TransmitterPowerdBmEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterPowerdBmEditField.Layout.Row = 6;
            app.TransmitterPowerdBmEditField.Layout.Column = 4;
            app.TransmitterPowerdBmEditField.Value = 23;

            % Create RandomTransmiterSite1DropDownLabel
            app.RandomTransmiterSite1DropDownLabel = uilabel(app.GridLayout);
            app.RandomTransmiterSite1DropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite1DropDownLabel.Enable = 'off';
            app.RandomTransmiterSite1DropDownLabel.Visible = 'off';
            app.RandomTransmiterSite1DropDownLabel.Layout.Row = 12;
            app.RandomTransmiterSite1DropDownLabel.Layout.Column = [1 3];
            app.RandomTransmiterSite1DropDownLabel.Text = 'Random Transmiter Site1 ';

            % Create RandomTransmiterSite1DropDown
            app.RandomTransmiterSite1DropDown = uidropdown(app.GridLayout);
            app.RandomTransmiterSite1DropDown.Enable = 'off';
            app.RandomTransmiterSite1DropDown.Visible = 'off';
            app.RandomTransmiterSite1DropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite1DropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomTransmiterSite1DropDown.Layout.Row = 12;
            app.RandomTransmiterSite1DropDown.Layout.Column = [4 5];

            % Create RandomTransmiterSite2DropDownLabel
            app.RandomTransmiterSite2DropDownLabel = uilabel(app.GridLayout);
            app.RandomTransmiterSite2DropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite2DropDownLabel.Enable = 'off';
            app.RandomTransmiterSite2DropDownLabel.Visible = 'off';
            app.RandomTransmiterSite2DropDownLabel.Layout.Row = 13;
            app.RandomTransmiterSite2DropDownLabel.Layout.Column = [1 3];
            app.RandomTransmiterSite2DropDownLabel.Text = 'Random Transmiter Site2 ';

            % Create RandomTransmiterSite2DropDown
            app.RandomTransmiterSite2DropDown = uidropdown(app.GridLayout);
            app.RandomTransmiterSite2DropDown.Enable = 'off';
            app.RandomTransmiterSite2DropDown.Visible = 'off';
            app.RandomTransmiterSite2DropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite2DropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomTransmiterSite2DropDown.Layout.Row = 13;
            app.RandomTransmiterSite2DropDown.Layout.Column = [4 5];

            % Create DatasetGenerationProgressButton
            app.DatasetGenerationProgressButton = uibutton(app.GridLayout, 'push');
            app.DatasetGenerationProgressButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.DatasetGenerationProgressButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.DatasetGenerationProgressButton.Layout.Row = [14 15];
            app.DatasetGenerationProgressButton.Layout.Column = [1 4];
            app.DatasetGenerationProgressButton.Text = 'Dataset Generation Progress';

            % Create GenerateButton
            app.GenerateButton = uibutton(app.GridLayout, 'push');
            app.GenerateButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateButtonPushed, true);
            app.GenerateButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.GenerateButton.FontWeight = 'bold';
            app.GenerateButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.GenerateButton.Layout.Row = 14;
            app.GenerateButton.Layout.Column = [5 8];
            app.GenerateButton.Text = 'Generate';

            % Create PlotButton
            app.PlotButton = uibutton(app.GridLayout, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.HorizontalAlignment = 'left';
            app.PlotButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PlotButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PlotButton.Layout.Row = 15;
            app.PlotButton.Layout.Column = 5;
            app.PlotButton.Text = 'Plot ';

            % Create CancelButton
            app.CancelButton = uibutton(app.GridLayout, 'push');
            app.CancelButton.ButtonPushedFcn = createCallbackFcn(app, @CancelButtonPushed, true);
            app.CancelButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.CancelButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.CancelButton.Layout.Row = 15;
            app.CancelButton.Layout.Column = [6 8];
            app.CancelButton.Text = 'Cancel';

            % Create SwarmPropertiesTab
            app.SwarmPropertiesTab = uitab(app.TabGroup3);
            app.SwarmPropertiesTab.Title = 'Sites and Coverage';
            app.SwarmPropertiesTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SwarmPropertiesTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create Panel
            app.Panel = uipanel(app.SwarmPropertiesTab);
            app.Panel.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.Panel.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.Panel.Position = [6 10 486 580];

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.Panel);
            app.GridLayout3.ColumnWidth = {'1.26x', 66, '4.11x', '1x', 53, 116, '1.41x'};
            app.GridLayout3.RowHeight = {225, 57, 23, 157};
            app.GridLayout3.ColumnSpacing = 3.375;
            app.GridLayout3.RowSpacing = 7.6;
            app.GridLayout3.Padding = [3.375 7.6 3.375 7.6];
            app.GridLayout3.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];

            % Create TabGroup_2
            app.TabGroup_2 = uitabgroup(app.GridLayout3);
            app.TabGroup_2.Layout.Row = 1;
            app.TabGroup_2.Layout.Column = [1 7];

            % Create FileUploadTab
            app.FileUploadTab = uitab(app.TabGroup_2);
            app.FileUploadTab.Title = 'File Upload';
            app.FileUploadTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.FileUploadTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create UploadFileButton
            app.UploadFileButton = uibutton(app.FileUploadTab, 'push');
            app.UploadFileButton.ButtonPushedFcn = createCallbackFcn(app, @UploadFileButtonPushed, true);
            app.UploadFileButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.UploadFileButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.UploadFileButton.Position = [183 153 100 23];
            app.UploadFileButton.Text = 'Upload File';

            % Create PathofFileUploadedEditFieldLabel
            app.PathofFileUploadedEditFieldLabel = uilabel(app.FileUploadTab);
            app.PathofFileUploadedEditFieldLabel.HorizontalAlignment = 'right';
            app.PathofFileUploadedEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PathofFileUploadedEditFieldLabel.Position = [178 94 121 22];
            app.PathofFileUploadedEditFieldLabel.Text = 'Path of File Uploaded';

            % Create PathofFileUploadedEditField
            app.PathofFileUploadedEditField = uieditfield(app.FileUploadTab, 'text');
            app.PathofFileUploadedEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PathofFileUploadedEditField.Position = [71 48 332 49];

            % Create TransmitterTab_2
            app.TransmitterTab_2 = uitab(app.TabGroup_2);
            app.TransmitterTab_2.Title = 'Transmitter';
            app.TransmitterTab_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.TransmitterTab_2.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.TransmitterTab_2);
            app.GridLayout4.ColumnWidth = {48, 100, 58, '1x', '1.14x', 56, '1.93x'};
            app.GridLayout4.RowHeight = {22, 22, '1x', 22, 22, 23};
            app.GridLayout4.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];

            % Create TransmitterAddSiteButton
            app.TransmitterAddSiteButton = uibutton(app.GridLayout4, 'push');
            app.TransmitterAddSiteButton.ButtonPushedFcn = createCallbackFcn(app, @TransmitterAddSiteButtonPushed, true);
            app.TransmitterAddSiteButton.HorizontalAlignment = 'left';
            app.TransmitterAddSiteButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.TransmitterAddSiteButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterAddSiteButton.Layout.Row = 6;
            app.TransmitterAddSiteButton.Layout.Column = 6;
            app.TransmitterAddSiteButton.Text = 'Add Site';

            % Create Frequencye9Label
            app.Frequencye9Label = uilabel(app.GridLayout4);
            app.Frequencye9Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.Frequencye9Label.Layout.Row = 4;
            app.Frequencye9Label.Layout.Column = [1 2];
            app.Frequencye9Label.Text = 'Frequency (*e9 Hz)';

            % Create TransmitterFrequencye9HzEditField
            app.TransmitterFrequencye9HzEditField = uieditfield(app.GridLayout4, 'numeric');
            app.TransmitterFrequencye9HzEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterFrequencye9HzEditField.Layout.Row = 4;
            app.TransmitterFrequencye9HzEditField.Layout.Column = [3 5];
            app.TransmitterFrequencye9HzEditField.Value = 6;

            % Create AntennaHeightmetersEditFieldLabel
            app.AntennaHeightmetersEditFieldLabel = uilabel(app.GridLayout4);
            app.AntennaHeightmetersEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.AntennaHeightmetersEditFieldLabel.Layout.Row = 5;
            app.AntennaHeightmetersEditFieldLabel.Layout.Column = [1 2];
            app.AntennaHeightmetersEditFieldLabel.Text = 'Antenna Height (meters)';

            % Create AntennaHeightmetersEditField
            app.AntennaHeightmetersEditField = uieditfield(app.GridLayout4, 'numeric');
            app.AntennaHeightmetersEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.AntennaHeightmetersEditField.Layout.Row = 5;
            app.AntennaHeightmetersEditField.Layout.Column = [3 5];
            app.AntennaHeightmetersEditField.Value = 60;

            % Create TransmitterPowerwattsEditFieldLabel
            app.TransmitterPowerwattsEditFieldLabel = uilabel(app.GridLayout4);
            app.TransmitterPowerwattsEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterPowerwattsEditFieldLabel.Layout.Row = 6;
            app.TransmitterPowerwattsEditFieldLabel.Layout.Column = [1 2];
            app.TransmitterPowerwattsEditFieldLabel.Text = 'Transmitter Power (watts)';

            % Create TransmitterPowerwattsEditField
            app.TransmitterPowerwattsEditField = uieditfield(app.GridLayout4, 'numeric');
            app.TransmitterPowerwattsEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterPowerwattsEditField.Layout.Row = 6;
            app.TransmitterPowerwattsEditField.Layout.Column = [3 5];
            app.TransmitterPowerwattsEditField.Value = 15;

            % Create NameofSiteEditFieldLabel
            app.NameofSiteEditFieldLabel = uilabel(app.GridLayout4);
            app.NameofSiteEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NameofSiteEditFieldLabel.Layout.Row = 1;
            app.NameofSiteEditFieldLabel.Layout.Column = 1;
            app.NameofSiteEditFieldLabel.Text = 'Name of Site';

            % Create TransmitterNameofSiteEditField
            app.TransmitterNameofSiteEditField = uieditfield(app.GridLayout4, 'text');
            app.TransmitterNameofSiteEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterNameofSiteEditField.Layout.Row = 1;
            app.TransmitterNameofSiteEditField.Layout.Column = 2;
            app.TransmitterNameofSiteEditField.Value = 'DiscoveryPark';

            % Create LongitudeEditFieldLabel
            app.LongitudeEditFieldLabel = uilabel(app.GridLayout4);
            app.LongitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.LongitudeEditFieldLabel.Layout.Row = 2;
            app.LongitudeEditFieldLabel.Layout.Column = 3;
            app.LongitudeEditFieldLabel.Text = 'Longitude';

            % Create TransmitterLongitudeEditField
            app.TransmitterLongitudeEditField = uieditfield(app.GridLayout4, 'numeric');
            app.TransmitterLongitudeEditField.ValueDisplayFormat = '%.4f';
            app.TransmitterLongitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterLongitudeEditField.Layout.Row = 2;
            app.TransmitterLongitudeEditField.Layout.Column = [4 5];
            app.TransmitterLongitudeEditField.Value = -97.1526;

            % Create LatitudeEditFieldLabel
            app.LatitudeEditFieldLabel = uilabel(app.GridLayout4);
            app.LatitudeEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.LatitudeEditFieldLabel.Layout.Row = 2;
            app.LatitudeEditFieldLabel.Layout.Column = 1;
            app.LatitudeEditFieldLabel.Text = 'Latitude';

            % Create TransmiterLatitudeEditField
            app.TransmiterLatitudeEditField = uieditfield(app.GridLayout4, 'numeric');
            app.TransmiterLatitudeEditField.ValueDisplayFormat = '%.4f';
            app.TransmiterLatitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmiterLatitudeEditField.Layout.Row = 2;
            app.TransmiterLatitudeEditField.Layout.Column = 2;
            app.TransmiterLatitudeEditField.Value = 33.2538;

            % Create ReceiverTab_2
            app.ReceiverTab_2 = uitab(app.TabGroup_2);
            app.ReceiverTab_2.Title = 'Receiver';
            app.ReceiverTab_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.ReceiverTab_2.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.ReceiverTab_2);
            app.GridLayout5.ColumnWidth = {'1x', 48, 27, '2.16x', 30, 70, '2.32x'};
            app.GridLayout5.RowHeight = {'1x', 22, '1.33x', 22, '1.73x', 23};
            app.GridLayout5.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];

            % Create ReceiverAddSiteButton
            app.ReceiverAddSiteButton = uibutton(app.GridLayout5, 'push');
            app.ReceiverAddSiteButton.ButtonPushedFcn = createCallbackFcn(app, @ReceiverAddSiteButtonPushed, true);
            app.ReceiverAddSiteButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.ReceiverAddSiteButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverAddSiteButton.Layout.Row = 4;
            app.ReceiverAddSiteButton.Layout.Column = [5 6];
            app.ReceiverAddSiteButton.Text = 'Add Site';

            % Create ReceiverSentivityEditFieldLabel
            app.ReceiverSentivityEditFieldLabel = uilabel(app.GridLayout5);
            app.ReceiverSentivityEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverSentivityEditFieldLabel.Layout.Row = 3;
            app.ReceiverSentivityEditFieldLabel.Layout.Column = [5 6];
            app.ReceiverSentivityEditFieldLabel.Text = 'Receiver Sentivity';

            % Create ReceiverSentivityEditField
            app.ReceiverSentivityEditField = uieditfield(app.GridLayout5, 'numeric');
            app.ReceiverSentivityEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverSentivityEditField.Layout.Row = 3;
            app.ReceiverSentivityEditField.Layout.Column = 7;
            app.ReceiverSentivityEditField.Value = -90;

            % Create NameofSiteEditField_2Label
            app.NameofSiteEditField_2Label = uilabel(app.GridLayout5);
            app.NameofSiteEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.NameofSiteEditField_2Label.Layout.Row = 2;
            app.NameofSiteEditField_2Label.Layout.Column = [1 2];
            app.NameofSiteEditField_2Label.Text = 'Name of Site';

            % Create ReceiverNameofSiteEditField
            app.ReceiverNameofSiteEditField = uieditfield(app.GridLayout5, 'text');
            app.ReceiverNameofSiteEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverNameofSiteEditField.Layout.Row = 2;
            app.ReceiverNameofSiteEditField.Layout.Column = [3 4];
            app.ReceiverNameofSiteEditField.Value = 'UNTUnion';

            % Create LatitudeEditField_2Label
            app.LatitudeEditField_2Label = uilabel(app.GridLayout5);
            app.LatitudeEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.LatitudeEditField_2Label.Layout.Row = 3;
            app.LatitudeEditField_2Label.Layout.Column = [1 3];
            app.LatitudeEditField_2Label.Text = 'Latitude';

            % Create ReceiverLatitudeEditField
            app.ReceiverLatitudeEditField = uieditfield(app.GridLayout5, 'numeric');
            app.ReceiverLatitudeEditField.ValueDisplayFormat = '%.4f';
            app.ReceiverLatitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverLatitudeEditField.Layout.Row = 3;
            app.ReceiverLatitudeEditField.Layout.Column = [3 4];
            app.ReceiverLatitudeEditField.Value = 33.2107;

            % Create LongitudeEditField_2Label
            app.LongitudeEditField_2Label = uilabel(app.GridLayout5);
            app.LongitudeEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.LongitudeEditField_2Label.Layout.Row = 4;
            app.LongitudeEditField_2Label.Layout.Column = [1 3];
            app.LongitudeEditField_2Label.Text = 'Longitude';

            % Create ReceiverLongitudeEditField
            app.ReceiverLongitudeEditField = uieditfield(app.GridLayout5, 'numeric');
            app.ReceiverLongitudeEditField.ValueDisplayFormat = '%.4f';
            app.ReceiverLongitudeEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverLongitudeEditField.Layout.Row = 4;
            app.ReceiverLongitudeEditField.Layout.Column = [3 4];
            app.ReceiverLongitudeEditField.Value = -97.1473;

            % Create PlotcoverageAreaButton
            app.PlotcoverageAreaButton = uibutton(app.GridLayout3, 'push');
            app.PlotcoverageAreaButton.ButtonPushedFcn = createCallbackFcn(app, @PlotcoverageAreaButtonPushed, true);
            app.PlotcoverageAreaButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PlotcoverageAreaButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PlotcoverageAreaButton.Layout.Row = 3;
            app.PlotcoverageAreaButton.Layout.Column = 6;
            app.PlotcoverageAreaButton.Text = 'Plot coverage Area';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.GridLayout3);
            app.TabGroup2.Layout.Row = 4;
            app.TabGroup2.Layout.Column = [1 7];

            % Create DirectionalAntennaTab
            app.DirectionalAntennaTab = uitab(app.TabGroup2);
            app.DirectionalAntennaTab.Title = 'Directional Antenna';
            app.DirectionalAntennaTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.DirectionalAntennaTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create PlotDirectivityPatternButton
            app.PlotDirectivityPatternButton = uibutton(app.DirectionalAntennaTab, 'push');
            app.PlotDirectivityPatternButton.ButtonPushedFcn = createCallbackFcn(app, @PlotDirectivityPatternButtonPushed2, true);
            app.PlotDirectivityPatternButton.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.PlotDirectivityPatternButton.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PlotDirectivityPatternButton.Position = [303 76 134 23];
            app.PlotDirectivityPatternButton.Text = 'Plot Directivity Pattern';

            % Create TiltAngleEditFieldLabel
            app.TiltAngleEditFieldLabel = uilabel(app.DirectionalAntennaTab);
            app.TiltAngleEditFieldLabel.HorizontalAlignment = 'right';
            app.TiltAngleEditFieldLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TiltAngleEditFieldLabel.Position = [20 76 54 22];
            app.TiltAngleEditFieldLabel.Text = 'Tilt Angle';

            % Create TiltAngleEditField
            app.TiltAngleEditField = uieditfield(app.DirectionalAntennaTab, 'numeric');
            app.TiltAngleEditField.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TiltAngleEditField.Position = [89 76 100 22];
            app.TiltAngleEditField.Value = 90;

            % Create TiltAxisDropDownLabel
            app.TiltAxisDropDownLabel = uilabel(app.DirectionalAntennaTab);
            app.TiltAxisDropDownLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TiltAxisDropDownLabel.Position = [26 44 46 22];
            app.TiltAxisDropDownLabel.Text = 'Tilt Axis';

            % Create TiltAxisDropDown
            app.TiltAxisDropDown = uidropdown(app.DirectionalAntennaTab);
            app.TiltAxisDropDown.Items = {'x', 'y'};
            app.TiltAxisDropDown.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TiltAxisDropDown.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.TiltAxisDropDown.Position = [87 44 103 22];
            app.TiltAxisDropDown.Value = 'x';

            % Create ReceiverSitesListBoxLabel
            app.ReceiverSitesListBoxLabel = uilabel(app.GridLayout3);
            app.ReceiverSitesListBoxLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ReceiverSitesListBoxLabel.HorizontalAlignment = 'center';
            app.ReceiverSitesListBoxLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverSitesListBoxLabel.Layout.Row = 2;
            app.ReceiverSitesListBoxLabel.Layout.Column = [4 5];
            app.ReceiverSitesListBoxLabel.Text = {'Receiver'; 'Sites'};

            % Create ReceiverSitesListBox
            app.ReceiverSitesListBox = uilistbox(app.GridLayout3);
            app.ReceiverSitesListBox.Items = {};
            app.ReceiverSitesListBox.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.ReceiverSitesListBox.Layout.Row = 2;
            app.ReceiverSitesListBox.Layout.Column = [6 7];
            app.ReceiverSitesListBox.Value = {};

            % Create TransmitterSitesListBoxLabel
            app.TransmitterSitesListBoxLabel = uilabel(app.GridLayout3);
            app.TransmitterSitesListBoxLabel.HorizontalAlignment = 'center';
            app.TransmitterSitesListBoxLabel.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterSitesListBoxLabel.Layout.Row = 2;
            app.TransmitterSitesListBoxLabel.Layout.Column = [1 2];
            app.TransmitterSitesListBoxLabel.Text = {'Transmitter'; 'Sites'};

            % Create TransmitterSitesListBox
            app.TransmitterSitesListBox = uilistbox(app.GridLayout3);
            app.TransmitterSitesListBox.Items = {};
            app.TransmitterSitesListBox.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.TransmitterSitesListBox.Layout.Row = 2;
            app.TransmitterSitesListBox.Layout.Column = 3;
            app.TransmitterSitesListBox.Value = {};

            % Create FileUploadforDatasetTab
            app.FileUploadforDatasetTab = uitab(app.TabGroup3);
            app.FileUploadforDatasetTab.Title = 'File Upload for Dataset';
            app.FileUploadforDatasetTab.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.FileUploadforDatasetTab.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];

            % Create VisualizeSiteCoverageAreaButton_2
            app.VisualizeSiteCoverageAreaButton_2 = uibutton(app.FileUploadforDatasetTab, 'push');
            app.VisualizeSiteCoverageAreaButton_2.ButtonPushedFcn = createCallbackFcn(app, @VisualizeSiteCoverageAreaButton_2Pushed, true);
            app.VisualizeSiteCoverageAreaButton_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.VisualizeSiteCoverageAreaButton_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.VisualizeSiteCoverageAreaButton_2.Enable = 'off';
            app.VisualizeSiteCoverageAreaButton_2.Visible = 'off';
            app.VisualizeSiteCoverageAreaButton_2.Position = [138 227 171 22];
            app.VisualizeSiteCoverageAreaButton_2.Text = 'Visualize Site Coverage Area';

            % Create RandomSitesDropDown_2Label
            app.RandomSitesDropDown_2Label = uilabel(app.FileUploadforDatasetTab);
            app.RandomSitesDropDown_2Label.HorizontalAlignment = 'right';
            app.RandomSitesDropDown_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomSitesDropDown_2Label.Enable = 'off';
            app.RandomSitesDropDown_2Label.Visible = 'off';
            app.RandomSitesDropDown_2Label.Position = [6 298 81 22];
            app.RandomSitesDropDown_2Label.Text = 'Random Sites';

            % Create RandomSitesDropDown_2
            app.RandomSitesDropDown_2 = uidropdown(app.FileUploadforDatasetTab);
            app.RandomSitesDropDown_2.Enable = 'off';
            app.RandomSitesDropDown_2.Visible = 'off';
            app.RandomSitesDropDown_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomSitesDropDown_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomSitesDropDown_2.Position = [102 298 140 22];

            % Create RandomTransmiterSite1DropDown_2Label
            app.RandomTransmiterSite1DropDown_2Label = uilabel(app.FileUploadforDatasetTab);
            app.RandomTransmiterSite1DropDown_2Label.HorizontalAlignment = 'right';
            app.RandomTransmiterSite1DropDown_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite1DropDown_2Label.Enable = 'off';
            app.RandomTransmiterSite1DropDown_2Label.Visible = 'off';
            app.RandomTransmiterSite1DropDown_2Label.Position = [0 266 145 22];
            app.RandomTransmiterSite1DropDown_2Label.Text = 'Random Transmiter Site1 ';

            % Create RandomTransmiterSite1DropDown_2
            app.RandomTransmiterSite1DropDown_2 = uidropdown(app.FileUploadforDatasetTab);
            app.RandomTransmiterSite1DropDown_2.Enable = 'off';
            app.RandomTransmiterSite1DropDown_2.Visible = 'off';
            app.RandomTransmiterSite1DropDown_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite1DropDown_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomTransmiterSite1DropDown_2.Position = [151 266 80 22];

            % Create RandomTransmiterSite2DropDown_2Label
            app.RandomTransmiterSite2DropDown_2Label = uilabel(app.FileUploadforDatasetTab);
            app.RandomTransmiterSite2DropDown_2Label.HorizontalAlignment = 'right';
            app.RandomTransmiterSite2DropDown_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite2DropDown_2Label.Enable = 'off';
            app.RandomTransmiterSite2DropDown_2Label.Visible = 'off';
            app.RandomTransmiterSite2DropDown_2Label.Position = [233 266 145 22];
            app.RandomTransmiterSite2DropDown_2Label.Text = 'Random Transmiter Site2 ';

            % Create RandomTransmiterSite2DropDown_2
            app.RandomTransmiterSite2DropDown_2 = uidropdown(app.FileUploadforDatasetTab);
            app.RandomTransmiterSite2DropDown_2.Enable = 'off';
            app.RandomTransmiterSite2DropDown_2.Visible = 'off';
            app.RandomTransmiterSite2DropDown_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.RandomTransmiterSite2DropDown_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.RandomTransmiterSite2DropDown_2.Position = [384 266 82 22];

            % Create SaveFilesButton_3
            app.SaveFilesButton_3 = uibutton(app.FileUploadforDatasetTab, 'push');
            app.SaveFilesButton_3.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveFilesButton_3.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.SaveFilesButton_3.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SaveFilesButton_3.Position = [86 109 100 22];
            app.SaveFilesButton_3.Text = 'Save Files';

            % Create SavingStatusEditField_2Label
            app.SavingStatusEditField_2Label = uilabel(app.FileUploadforDatasetTab);
            app.SavingStatusEditField_2Label.HorizontalAlignment = 'right';
            app.SavingStatusEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SavingStatusEditField_2Label.Enable = 'off';
            app.SavingStatusEditField_2Label.Position = [221 109 80 22];
            app.SavingStatusEditField_2Label.Text = 'Saving Status';

            % Create SavingStatusEditField_2
            app.SavingStatusEditField_2 = uieditfield(app.FileUploadforDatasetTab, 'text');
            app.SavingStatusEditField_2.Editable = 'off';
            app.SavingStatusEditField_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.SavingStatusEditField_2.Enable = 'off';
            app.SavingStatusEditField_2.Position = [316 109 131 22];
            app.SavingStatusEditField_2.Value = 'Not Saving';

            % Create UploadFileButton_2
            app.UploadFileButton_2 = uibutton(app.FileUploadforDatasetTab, 'push');
            app.UploadFileButton_2.ButtonPushedFcn = createCallbackFcn(app, @UploadFileButton_2Pushed, true);
            app.UploadFileButton_2.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.UploadFileButton_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.UploadFileButton_2.Position = [179 461 100 23];
            app.UploadFileButton_2.Text = 'Upload File';

            % Create PathofFileUploadedEditField_2Label
            app.PathofFileUploadedEditField_2Label = uilabel(app.FileUploadforDatasetTab);
            app.PathofFileUploadedEditField_2Label.HorizontalAlignment = 'right';
            app.PathofFileUploadedEditField_2Label.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PathofFileUploadedEditField_2Label.Position = [169 430 121 22];
            app.PathofFileUploadedEditField_2Label.Text = 'Path of File Uploaded';

            % Create PathofFileUploadedEditField_2
            app.PathofFileUploadedEditField_2 = uieditfield(app.FileUploadforDatasetTab, 'text');
            app.PathofFileUploadedEditField_2.FontColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.PathofFileUploadedEditField_2.Position = [62 384 332 49];

            % Create DirectivityPatternPanel
            app.DirectivityPatternPanel = uipanel(app.UIFigure);
            app.DirectivityPatternPanel.Title = 'Antenna Pattern Preview';
            app.DirectivityPatternPanel.BackgroundColor = [0.96078431372549 0.96078431372549 0.96078431372549];
            app.DirectivityPatternPanel.Position = [536 18 888 348];

            % Create DirectivityPlot
            app.DirectivityPlot = uiaxes(app.DirectivityPatternPanel);
            app.DirectivityPlot.XColor = [1 1 1];
            app.DirectivityPlot.XTick = [];
            app.DirectivityPlot.YColor = [1 1 1];
            app.DirectivityPlot.YTick = [];
            app.DirectivityPlot.Position = [10 8 868 312];

            % Create ContextMenu
            app.ContextMenu = uicontextmenu(app.UIFigure);

            % Create Menu
            app.Menu = uimenu(app.ContextMenu);
            app.Menu.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.Menu.Text = 'Menu';

            % Create Menu2
            app.Menu2 = uimenu(app.ContextMenu);
            app.Menu2.ForegroundColor = [0.129411764705882 0.129411764705882 0.129411764705882];
            app.Menu2.Text = 'Menu2';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app_codex

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
