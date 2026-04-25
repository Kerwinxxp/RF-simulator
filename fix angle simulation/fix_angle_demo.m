function fix_angle_demo()
% FIX_ANGLE_DEMO  Demo version of fix_angle_trajectory.m + generate_fix_angle.m.
%
% Mirrors the actual two-stage pipeline but with reduced parameters:
%   * 1 region (instead of 5x5 = 25)
%   * 64 x 64 occupancy grid (instead of 256 x 256)
%   * 3 trajectories (instead of 25)
%   * 30 waypoints per trajectory (instead of 100)
%   * sigstrength only for 1 trajectory's first waypoint (instead of all 100 x 25)
%
% Outputs (saved to this folder):
%   stage1_region_tiling.png        5x5 region tiling diagram
%   stage2_osm_buildings.png        OSM buildings + region bounding box
%   stage2_occupancy_mask.png       64x64 binary occupancy from real OSM
%   stage3_rrt_trajectories.png     3 RRT-planned trajectories
%   stage4_target_arrows.png        trajectory + target + bearing arrows (NEW)
%   stage4_bearing_polar.png        polar histogram of computed bearings
%   stage5_antenna_pattern.png      8x8 URA Gaussian directivity
%   stage5_signal_heatmap.png       sigstrength output for one waypoint (NEW)

DEMO_DIR = fileparts(mfilename('fullpath'));
ROOT     = fileparts(DEMO_DIR);
addpath(ROOT);
addpath(fullfile(ROOT,'generateTrajectoryMaps'));   % for the trajectory class

fprintf('=== fix_angle_demo ===\nOutput: %s\n', DEMO_DIR);
total_t = tic;

%% Region setup
nw_lat = 29.8362;
nw_lon = -95.4316;
R = 6371*1000; d = 256;
delta_lat = (d/R)*(180/pi);
delta_lon = (d/(R*cosd(nw_lat)))*(180/pi);
se_lat = nw_lat - delta_lat;
se_lon = nw_lon + delta_lon;

%% Stage 1: region tiling
fprintf('\n[1/8] region tiling...\n'); t = tic;
fig = figure('Color','w','Position',[100 100 700 540],'Visible','off');
ax  = gca; hold(ax,'on');
for k = 0:4
    for l = 0:4
        nlat = nw_lat - k*delta_lat*1.02;
        nlon = nw_lon + l*delta_lon*1.02;
        rectangle(ax,'Position',[nlon, nlat-delta_lat, delta_lon, delta_lat], ...
                  'EdgeColor',[0.18 0.36 1],'LineWidth',1.2, ...
                  'FaceColor',[0.18 0.36 1, 0.08]);
        plot(ax,nlon,nlat,'o','MarkerSize',5, ...
             'MarkerFaceColor',[0.85 0.18 0.25],'MarkerEdgeColor','w');
    end
end
xlabel(ax,'Longitude (deg)'); ylabel(ax,'Latitude (deg)');
title(ax,'Stage 1: 5\times5 region tiling (256 m \times 256 m, 260 m spacing)','FontWeight','bold');
grid(ax,'on'); axis(ax,'equal'); axis(ax,'tight'); set(ax,'FontSize',10);
exportgraphics(fig,fullfile(DEMO_DIR,'stage1_region_tiling.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 2a: OSM buildings + bounding box
fprintf('\n[2/8] OSM buildings...\n'); t = tic;
osmFile = fullfile(ROOT,'trajectoryMap.osm');
buildings = readgeotable(osmFile,'Layer','buildings');
fprintf('   loaded %d buildings\n', height(buildings));

fig = figure('Color','w','Position',[100 100 720 560],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.95 0.55 0.2],'EdgeColor',[0.4 0.18 0.05], ...
        'FaceAlpha',0.6,'LineWidth',0.5);
geoplot(gx,[nw_lat nw_lat se_lat se_lat nw_lat],[nw_lon se_lon se_lon nw_lon nw_lon], ...
        '-','Color',[0.18 0.36 1],'LineWidth',2.4);
title(gx,sprintf('Stage 2: %d OSM buildings + 256 m region (blue)',height(buildings)),'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage2_osm_buildings.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 2b: build the 64x64 occupancy mask (from real OSM)
fprintf('\n[3/8] occupancy mask...\n'); t = tic;
gridSize = 64;
lat_range = linspace(nw_lat, se_lat, gridSize);
lon_range = linspace(nw_lon, se_lon, gridSize);
[lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
N = gridSize*gridSize;
flatLat = lat_mesh(:); flatLon = lon_mesh(:);
points = geopointshape(flatLat, flatLon);

occ = false(N,1);
for i = 1:height(buildings)
    try
        in = isinterior(buildings(i,1).Shape, points);
        if numel(in) == N
            occ = occ | logical(in(:));
        end
    catch
    end
end
mask = reshape(occ, gridSize, gridSize);

fig = figure('Color','w','Position',[100 100 600 560],'Visible','off');
ax = gca;
imagesc(ax, mask);
colormap(ax, [1 1 1; 0.18 0.18 0.22]);
axis(ax,'image'); ax.YDir = 'normal';
xlabel(ax,'grid x'); ylabel(ax,'grid y');
title(ax,sprintf('%d \\times %d occupancy mask  (%d / %d cells inside buildings)', ...
      gridSize, gridSize, sum(occ), N),'FontWeight','bold');
set(ax,'FontSize',10);
exportgraphics(fig,fullfile(DEMO_DIR,'stage2_occupancy_mask.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 3: RRT path planning -- generate 3 trajectories
fprintf('\n[4/8] RRT planning (3 trajectories)...\n'); t = tic;

state_space = stateSpaceSE2;
state_validator = validatorOccupancyMap(state_space);
occ_map = binaryOccupancyMap(mask);
inflate(occ_map, 1);
state_validator.Map = occ_map;
state_validator.ValidationDistance = 5;
state_space.StateBounds = [occ_map.XWorldLimits;
                            occ_map.YWorldLimits;
                            [-pi pi]];
planner = plannerRRT(state_space, state_validator, 'MaxIterations', 2e4);
planner.MaxConnectionDistance = 2;

% Find valid (non-building) cells
[fy, fx] = find(~mask);
valid_cells = [fx, fy];

n_traj = 3;
maxNodes = 30;
trajectories = cell(n_traj, 1);

i = 0;
attempts = 0;
while i < n_traj && attempts < 30
    attempts = attempts + 1;
    rs = valid_cells(randi(size(valid_cells,1)),:);
    re = valid_cells(randi(size(valid_cells,1)),:);
    if norm(rs - re) < 20, continue; end
    start = [rs(1), rs(2), 0];
    goal  = [re(1), re(2), 0];
    try
        [pthObj, ~] = planner.plan(start, goal);
    catch
        continue;
    end
    if size(pthObj.States,1) < 5
        continue;
    end
    i = i + 1;
    rs_states = round(pthObj.States(:,1:2));
    [u_states, ~] = unique(rs_states, 'rows', 'stable');
    nU = size(u_states,1);
    if nU < maxNodes
        sel = u_states;
    else
        sel_idx = round(linspace(1, nU, maxNodes));
        sel = u_states(sel_idx, :);
    end
    % Convert grid -> lat/lon
    lons = lon_range(min(max(round(sel(:,1)),1), gridSize));
    lats = lat_range(min(max(round(sel(:,2)),1), gridSize));
    trajectories{i} = struct('grid', sel, 'lat', lats(:), 'lon', lons(:), ...
                              'start', rs, 'end', re);
    fprintf('   trajectory %d: %d waypoints\n', i, length(lats));
end

% Plot all 3 trajectories on geoaxes with OSM backdrop
fig = figure('Color','w','Position',[100 100 720 560],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.92 0.92 0.95],'FaceAlpha',0.45, ...
        'EdgeColor',[0.55 0.55 0.62],'LineWidth',0.4,'HandleVisibility','off');
cmap = lines(n_traj);
for i = 1:n_traj
    P = trajectories{i};
    geoplot(gx, P.lat, P.lon, '-','Color',cmap(i,:),'LineWidth',1.8, ...
            'DisplayName', sprintf('Trajectory %d', i));
    geoscatter(gx, P.lat(1), P.lon(1), 80, cmap(i,:),'o','filled', ...
               'MarkerEdgeColor','w','HandleVisibility','off');
    geoscatter(gx, P.lat(end), P.lon(end), 100, cmap(i,:),'^','filled', ...
               'MarkerEdgeColor','w','HandleVisibility','off');
end
title(gx, sprintf('Stage 3: %d RRT-planned trajectories (real planner output)', n_traj), 'FontWeight','bold');
legend(gx,'Location','best','FontSize',8);
exportgraphics(fig,fullfile(DEMO_DIR,'stage3_rrt_trajectories.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 4: pick target, compute bearings, draw arrows
fprintf('\n[5/8] target selection + bearings...\n'); t = tic;
T = trajectories{1};
% Find a valid target NOT in T's path
nodeSet = T.grid;
attempts = 0; tgt = [];
while attempts < 100
    attempts = attempts + 1;
    cand = valid_cells(randi(size(valid_cells,1)),:);
    if ~any(all(cand == nodeSet, 2))
        if norm(cand - mean(nodeSet,1)) > 8   % some distance
            tgt = cand;
            break;
        end
    end
end
if isempty(tgt)
    tgt = valid_cells(randi(size(valid_cells,1)),:);
end
target_lat = lat_range(min(max(round(tgt(2)),1), gridSize));
target_lon = lon_range(min(max(round(tgt(1)),1), gridSize));

% Compute per-waypoint bearing using the SAME math as fix_angle_trajectory.m
nW = size(nodeSet, 1);
bearings = zeros(nW, 1);
for j = 1:nW
    deltaX = tgt(1) - nodeSet(j, 1);
    deltaY = -(tgt(2) - nodeSet(j, 2));   % flip y for geographic
    if deltaX == 0
        ang = 90*(deltaY>0) + 270*(deltaY<0);
    elseif deltaX > 0 && deltaY > 0
        ang = atand(deltaY/deltaX);
    elseif deltaX < 0 && deltaY < 0
        ang = 180 + atand(deltaY/deltaX);
    elseif deltaX < 0
        ang = 180 - abs(atand(deltaY/deltaX));
    else
        ang = 360 - abs(atand(deltaY/deltaX));
    end
    bearings(j) = ang;
end

% Figure 4a: trajectory + target + sample bearing arrows
fig = figure('Color','w','Position',[100 100 720 580],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.92 0.92 0.95],'FaceAlpha',0.5, ...
        'EdgeColor',[0.55 0.55 0.62],'LineWidth',0.4,'HandleVisibility','off');
geoplot(gx,T.lat,T.lon,'-o','Color',[0.18 0.36 1],'LineWidth',1.6, ...
        'MarkerSize',3.5,'MarkerFaceColor',[0.18 0.36 1],'MarkerEdgeColor','none', ...
        'DisplayName','Trajectory (waypoints)');
% Draw arrows from sampled waypoints to target
sampleIdx = round(linspace(1, nW, min(8, nW)));
for j = sampleIdx
    geoplot(gx,[T.lat(j) target_lat],[T.lon(j) target_lon], ...
            '-','Color',[0.85 0.18 0.25, 0.4],'LineWidth',0.8,'HandleVisibility','off');
end
geoscatter(gx, target_lat, target_lon, 200,'red','o','filled', ...
           'MarkerEdgeColor','w','LineWidth',1.5,'DisplayName','Target');
geoscatter(gx, T.lat(1), T.lon(1), 90,[0.18 0.65 0.30],'s','filled', ...
           'MarkerEdgeColor','w','DisplayName','Start');
geoscatter(gx, T.lat(end), T.lon(end), 90,[0.45 0.20 0.55],'^','filled', ...
           'MarkerEdgeColor','w','DisplayName','End');
title(gx, sprintf('Stage 4: trajectory + target + %d sampled bearings (red dashed)', length(sampleIdx)), ...
      'FontWeight','bold');
legend(gx,'Location','best','FontSize',8);
exportgraphics(fig,fullfile(DEMO_DIR,'stage4_target_arrows.png'),'Resolution',130);
close(fig);

% Figure 4b: polar histogram
fig = figure('Color','w','Position',[100 100 600 560],'Visible','off');
polarhistogram(deg2rad(bearings), 18,'FaceColor',[0.18 0.36 1],'EdgeColor','w','LineWidth',0.5);
ax = gca; ax.ThetaZeroLocation = 'top'; ax.ThetaDir = 'clockwise'; ax.FontSize = 10;
title({'Stage 4: distribution of antenna bearings (one trajectory)', ...
       sprintf('%d bearings, mean = %.0f\\circ (direction to target)', nW, mean(bearings))}, ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage4_bearing_polar.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 5a: 3D antenna pattern
fprintf('\n[6/8] antenna pattern...\n'); t = tic;
freq = 28e9;
lambda = physconst('lightspeed')/freq;
beamwidth = randi([6, 20]);
arr = phased.URA('Size',[8 8],'Lattice','Rectangular','ArrayNormal','x');
arr.ElementSpacing = [0.5 0.5]*lambda;
elem = phased.GaussianAntennaElement;
elem.FrequencyRange = [0 freq];
elem.Beamwidth = [beamwidth beamwidth];
arr.Element = elem;

fig = figure('Color','w','Position',[100 100 700 540],'Visible','off');
pattern(arr, freq,'Type','directivity');
view(135, 30);
title(sprintf('Stage 5: antenna pattern at one waypoint (beamwidth=%d\\circ, 28 GHz)',beamwidth), ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage5_antenna_pattern.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 5b: sigstrength for one waypoint pointing at target
fprintf('\n[7/8] sigstrength at one waypoint (slow)...\n'); t = tic;
% Receivers: subsample of free cells
freeIdx = find(~occ);
if length(freeIdx) > 400
    freeIdx = freeIdx(round(linspace(1,length(freeIdx),400)));
end
rx_lats = flatLat(freeIdx);
rx_lons = flatLon(freeIdx);
rx = rxsite('Latitude',rx_lats,'Longitude',rx_lons, ...
            'ReceiverSensitivity',-100,'AntennaHeight',2);

% Pick the middle waypoint
wp = round(nW/2);
wp_lat = T.lat(wp);
wp_lon = T.lon(wp);
wp_bearing = bearings(wp);

siteviewer('Buildings',osmFile,'Visible','off');
tx_wp = txsite('Name','Tx','Latitude',wp_lat,'Longitude',wp_lon, ...
               'TransmitterFrequency',freq,'TransmitterPower',1,'AntennaHeight',2);
tx_wp.Antenna = arr;
tx_wp.AntennaAngle = wp_bearing;

pm = propagationModel('raytracing','Method','sbr','MaxNumReflections',1,'MaxNumDiffractions',0);
sigStre = sigstrength(rx, tx_wp, pm);
sigStre = sigStre(:);
valid = sigStre < 0 & sigStre > -300;
fprintf('   sigstrength: %d valid of %d\n', sum(valid), length(sigStre));

fig = figure('Color','w','Position',[100 100 720 580],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.85 0.85 0.88],'FaceAlpha',0.4, ...
        'EdgeColor','none','HandleVisibility','off');
geoscatter(gx, rx_lats(valid), rx_lons(valid), 22, sigStre(valid),'filled');
geoscatter(gx, wp_lat, wp_lon, 200,'red','pentagram','filled', ...
           'MarkerEdgeColor','w','LineWidth',1.5);
geoscatter(gx, target_lat, target_lon, 110,'magenta','o','filled', ...
           'MarkerEdgeColor','w','LineWidth',1);
geoplot(gx, [wp_lat target_lat], [wp_lon target_lon], '-','Color',[0.85 0.18 0.25, 0.6], 'LineWidth', 1.2);
colormap(gx,'jet');
cb = colorbar(gx); cb.Label.String = 'Power (dBm)';
title(gx, sprintf('Stage 5: signal strength at waypoint %d (bearing=%.0f\\circ to target)', wp, wp_bearing), ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage5_signal_heatmap.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

fprintf('\n[8/8] done.  Total: %.1f s\n', toc(total_t));
end
