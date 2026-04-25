function generateTrajectoryMaps_demo()
% GENERATETRAJECTORYMAPS_DEMO  Demo of test1.m + trajectorySignalStrengthScript.m + generateTrajectoryMaps.m.
%
% Reduced parameters for fast iteration:
%   * 1 region (instead of 10x10 = 100)
%   * 64 x 64 grid (instead of 256 x 256)
%   * 3 trajectories (instead of 50)
%   * 30 waypoints per trajectory
%   * sigstrength only for 1 waypoint
%
% Outputs (saved to this folder):
%   stage1_region_tiling.png        5x5 region tiling diagram
%   stage3_rrt_trajectories.png     3 RRT-planned trajectories
%   stage3_trajectory_class.png     trajectory class properties view (NEW)
%   stage4_random_angles_hist.png   uniform-random AntennaAngle histogram
%   stage4_random_arrows.png        TX positions with random angle arrows (NEW)
%   stage5_signal_heatmap.png       per-waypoint sigstrength (NEW)
%   stage5_signal_composite.png     2x3 grid of TX signal maps

DEMO_DIR = fileparts(mfilename('fullpath'));
ROOT     = fileparts(DEMO_DIR);
addpath(ROOT);
addpath(DEMO_DIR);   % for trajectory class

fprintf('=== generateTrajectoryMaps_demo ===\nOutput: %s\n', DEMO_DIR);
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
fprintf('\n[1/7] region tiling...\n'); t = tic;
fig = figure('Color','w','Position',[100 100 700 540],'Visible','off');
ax = gca; hold(ax,'on');
for k = 0:4
    for l = 0:4
        nlat = nw_lat - k*delta_lat*1.02;
        nlon = nw_lon + l*delta_lon*1.02;
        rectangle(ax,'Position',[nlon, nlat-delta_lat, delta_lon, delta_lat], ...
                  'EdgeColor',[0.18 0.36 1],'LineWidth',1.2, ...
                  'FaceColor',[0.18 0.36 1, 0.08]);
        plot(ax,nlon,nlat,'o','MarkerSize',5,'MarkerFaceColor',[0.85 0.18 0.25],'MarkerEdgeColor','w');
    end
end
xlabel(ax,'Longitude (deg)'); ylabel(ax,'Latitude (deg)');
title(ax,'Stage 1: 5\times5 region tiling (256 m \times 256 m, 260 m spacing)','FontWeight','bold');
grid(ax,'on'); axis(ax,'equal'); axis(ax,'tight'); set(ax,'FontSize',10);
exportgraphics(fig,fullfile(DEMO_DIR,'stage1_region_tiling.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 2: load OSM + occupancy
fprintf('\n[2/7] occupancy mask...\n'); t = tic;
osmFile = fullfile(ROOT,'trajectoryMap.osm');
buildings = readgeotable(osmFile,'Layer','buildings');

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
        if numel(in) == N, occ = occ | logical(in(:)); end
    catch
    end
end
mask = reshape(occ, gridSize, gridSize);
fprintf('   %d / %d cells inside buildings\n', sum(occ), N);

%% Stage 3a: RRT - generate 3 trajectory objects (using the trajectory class)
fprintf('\n[3/7] RRT planning + trajectory objects...\n'); t = tic;
state_space = stateSpaceSE2;
state_validator = validatorOccupancyMap(state_space);
occ_map = binaryOccupancyMap(mask);
inflate(occ_map, 1);
state_validator.Map = occ_map;
state_validator.ValidationDistance = 5;
state_space.StateBounds = [occ_map.XWorldLimits; occ_map.YWorldLimits; [-pi pi]];
planner = plannerRRT(state_space, state_validator,'MaxIterations',2e4);
planner.MaxConnectionDistance = 2;

[fy, fx] = find(~mask);
valid_cells = [fx, fy];

n_traj = 3;
maxNodes = 30;
trajs(n_traj,1) = trajectory();
i = 0; attempts = 0;
while i < n_traj && attempts < 30
    attempts = attempts + 1;
    rs = valid_cells(randi(size(valid_cells,1)),:);
    re = valid_cells(randi(size(valid_cells,1)),:);
    if norm(rs-re) < 20, continue; end
    try
        [pthObj,~] = planner.plan([rs(1) rs(2) 0],[re(1) re(2) 0]);
    catch
        continue;
    end
    if size(pthObj.States,1) < 5, continue; end
    i = i + 1;
    rs_states = round(pthObj.States(:,1:2));
    [u_states,~] = unique(rs_states,'rows','stable');
    nU = size(u_states,1);
    if nU < maxNodes
        sel = u_states;
    else
        sel_idx = round(linspace(1,nU,maxNodes));
        sel = u_states(sel_idx,:);
    end
    lons = lon_range(min(max(round(sel(:,1)),1),gridSize));
    lats = lat_range(min(max(round(sel(:,2)),1),gridSize));

    % Use the actual trajectory class
    obj = trajectory();
    obj.Name  = sprintf('Traj %d', i);
    obj.Start = rs;
    obj.End   = re;
    obj.Geopoints = geopointshape(lats(:)', lons(:)');
    trajs(i) = obj;
    fprintf('   trajectory %d: %d waypoints\n', i, length(lats));
end

% Stage 3 figure 1: 3 trajectories overlaid
fig = figure('Color','w','Position',[100 100 720 560],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.92 0.92 0.95],'FaceAlpha',0.45, ...
        'EdgeColor',[0.55 0.55 0.62],'LineWidth',0.4,'HandleVisibility','off');
cmap = lines(n_traj);
for i = 1:n_traj
    P = trajs(i).getPath();
    geoplot(gx, P(:,1), P(:,2), '-','Color',cmap(i,:),'LineWidth',1.8, ...
            'DisplayName', trajs(i).Name);
    geoscatter(gx, P(1,1), P(1,2), 80, cmap(i,:),'o','filled','MarkerEdgeColor','w','HandleVisibility','off');
    geoscatter(gx, P(end,1), P(end,2), 100, cmap(i,:),'^','filled','MarkerEdgeColor','w','HandleVisibility','off');
end
title(gx,sprintf('Stage 3: %d RRT trajectories (trajectory class instances)', n_traj),'FontWeight','bold');
legend(gx,'Location','best','FontSize',8);
exportgraphics(fig,fullfile(DEMO_DIR,'stage3_rrt_trajectories.png'),'Resolution',130);
close(fig);

% Stage 3 figure 2: trajectory class anatomy (NEW)
fig = figure('Color','w','Position',[100 100 700 580],'Visible','off');
ax = gca; hold(ax,'on');
P = trajs(1).getPath();
plot(ax, P(:,2), P(:,1),'-o','Color',[0.18 0.36 1],'LineWidth',1.6, ...
     'MarkerSize',4,'MarkerFaceColor',[0.18 0.36 1],'MarkerEdgeColor','none');
plot(ax, P(1,2),P(1,1),'s','MarkerSize',12,'MarkerFaceColor',[0.18 0.65 0.30],'MarkerEdgeColor','w');
plot(ax, P(end,2),P(end,1),'^','MarkerSize',12,'MarkerFaceColor',[0.45 0.20 0.55],'MarkerEdgeColor','w');
text(ax, P(1,2),P(1,1),'  Start','FontSize',10,'FontWeight','bold','Color',[0.18 0.45 0.20]);
text(ax, P(end,2),P(end,1),'  End','FontSize',10,'FontWeight','bold','Color',[0.45 0.20 0.55]);
text(ax, mean(P(:,2)), max(P(:,1)) + diff(ylim)*0.04, ...
     sprintf('Geopoints (%d waypoints)', size(P,1)), ...
     'HorizontalAlignment','center','FontSize',10,'Color',[0.18 0.36 1],'FontWeight','bold');
xlabel(ax,'Longitude (deg)'); ylabel(ax,'Latitude (deg)');
title(ax,sprintf('Stage 3: trajectory class instance ("%s")  -  Start | End | Geopoints', trajs(1).Name), ...
      'FontWeight','bold');
grid(ax,'on'); set(ax,'FontSize',9); axis(ax,'tight');
exportgraphics(fig,fullfile(DEMO_DIR,'stage3_trajectory_class.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 4: random angles
fprintf('\n[4/7] random angles + arrows...\n'); t = tic;
P1 = trajs(1).getPath();
nW = size(P1,1);
rng(42);
random_angles = rand(nW,1)*360;

% Stage 4a: histogram
fig = figure('Color','w','Position',[100 100 700 420],'Visible','off');
histogram(random_angles, 18,'FaceColor',[0.20 0.65 0.30],'EdgeColor','w','LineWidth',0.8);
xlabel('AntennaAngle (deg)'); ylabel('Number of waypoints');
title({sprintf('Stage 4: random AntennaAngle distribution  (rand() \\times 360, %d waypoints)', nW), ...
       'Uniform [0\circ, 360\circ) -- contrast with fix-angle\''s polar concentration'}, 'FontWeight','bold');
xlim([0 360]); xticks(0:60:360); grid on; set(gca,'FontSize',10);
exportgraphics(fig,fullfile(DEMO_DIR,'stage4_random_angles_hist.png'),'Resolution',130);
close(fig);

% Stage 4b: TX positions with random arrows (NEW)
fig = figure('Color','w','Position',[100 100 720 580],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.92 0.92 0.95],'FaceAlpha',0.45, ...
        'EdgeColor',[0.55 0.55 0.62],'LineWidth',0.4,'HandleVisibility','off');
geoplot(gx, P1(:,1), P1(:,2), '-','Color',[0.5 0.55 0.65],'LineWidth',0.8,'HandleVisibility','off');

arrow_len = 0.00025;
sampleIdx = round(linspace(1, nW, min(12, nW)));
for j = sampleIdx
    a_rad = deg2rad(random_angles(j));
    e_lat = P1(j,1) + arrow_len*cos(a_rad);
    e_lon = P1(j,2) + arrow_len*sin(a_rad);
    geoplot(gx,[P1(j,1) e_lat],[P1(j,2) e_lon], ...
            '-','Color',[0.20 0.65 0.30],'LineWidth',1.6,'HandleVisibility','off');
end
geoscatter(gx, P1(sampleIdx,1), P1(sampleIdx,2), 50,[0.20 0.65 0.30],'o','filled', ...
           'MarkerEdgeColor','w','LineWidth',1, ...
           'DisplayName',sprintf('%d sampled waypoints',length(sampleIdx)));
title(gx,sprintf('Stage 4: %d sampled waypoints with random AntennaAngle vectors',length(sampleIdx)), ...
      'FontWeight','bold');
legend(gx,'Location','best','FontSize',8);
exportgraphics(fig,fullfile(DEMO_DIR,'stage4_random_arrows.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 5a: sigstrength for one waypoint
fprintf('\n[5/7] sigstrength (slow)...\n'); t = tic;
freeIdx = find(~occ);
if length(freeIdx) > 400
    freeIdx = freeIdx(round(linspace(1,length(freeIdx),400)));
end
rx_lats = flatLat(freeIdx);
rx_lons = flatLon(freeIdx);

freq = 28e9; lambda = physconst('lightspeed')/freq;
arr = phased.URA('Size',[8 8],'Lattice','Rectangular','ArrayNormal','x');
arr.ElementSpacing = [0.5 0.5]*lambda;
elem = phased.GaussianAntennaElement;
elem.FrequencyRange = [0 freq];
elem.Beamwidth = [20 10];
arr.Element = elem;

siteviewer('Buildings',osmFile,'Visible','off');
wp = round(nW/2);
wp_lat = P1(wp,1); wp_lon = P1(wp,2);
tx_wp = txsite('Name','Tx','Latitude',wp_lat,'Longitude',wp_lon, ...
               'TransmitterFrequency',freq,'TransmitterPower',1,'AntennaHeight',2);
tx_wp.Antenna = arr;
tx_wp.AntennaAngle = random_angles(wp);

rx = rxsite('Latitude',rx_lats,'Longitude',rx_lons, ...
            'ReceiverSensitivity',-100,'AntennaHeight',2);
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
geoscatter(gx,rx_lats(valid),rx_lons(valid),22,sigStre(valid),'filled');
geoscatter(gx,wp_lat,wp_lon,200,'red','pentagram','filled', ...
           'MarkerEdgeColor','w','LineWidth',1.5);
% Show angle direction
ar = deg2rad(random_angles(wp));
e_lat = wp_lat + 0.0005*cos(ar);
e_lon = wp_lon + 0.0005*sin(ar);
geoplot(gx,[wp_lat e_lat],[wp_lon e_lon],'r-','LineWidth',2);
colormap(gx,'jet');
cb = colorbar(gx); cb.Label.String = 'Power (dBm)';
title(gx,sprintf('Stage 5: signal strength at waypoint %d (random angle = %.0f\\circ)', wp, random_angles(wp)), ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage5_signal_heatmap.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% Stage 5b: composite of 5 sampled waypoints' signal maps
fprintf('\n[6/7] composite (5 waypoints, slow)...\n'); t = tic;
sampleIdx = round(linspace(1, nW, 5));
all_sig = zeros(length(rx_lats), length(sampleIdx));
all_sig(:,1) = sigStre;  % already computed at wp = round(nW/2)
for k = 1:length(sampleIdx)
    if sampleIdx(k) == wp, continue; end
    fprintf('   waypoint %d/%d (idx %d)...\n', k, length(sampleIdx), sampleIdx(k));
    wj = sampleIdx(k);
    tx_w = txsite('Name','Tx','Latitude',P1(wj,1),'Longitude',P1(wj,2), ...
                  'TransmitterFrequency',freq,'TransmitterPower',1,'AntennaHeight',2);
    tx_w.Antenna = arr;
    tx_w.AntennaAngle = random_angles(wj);
    s = sigstrength(rx, tx_w, pm);
    all_sig(:,k) = s(:);
end
% First column was the wp = round(nW/2). Find which k that corresponds to and copy
mid_k = find(sampleIdx == wp, 1);
if ~isempty(mid_k)
    all_sig(:,mid_k) = sigStre;
end

flat = all_sig(:); vals = flat(flat<0 & flat>-300);
prc = prctile(vals,[5,95]);

fig = figure('Color','w','Position',[100 100 1000 700],'Visible','off');
tlay = tiledlayout(fig,2,3,'Padding','compact','TileSpacing','compact');
nexttile;
plot(NaN,NaN); axis off;
text(0.5,0.62,sprintf('%d sampled\nwaypoints', length(sampleIdx)), ...
     'HorizontalAlignment','center','FontSize',12,'FontWeight','bold','Units','normalized');
text(0.5,0.32,'each panel: same\ntrajectory, different\nrandom AntennaAngle', ...
     'HorizontalAlignment','center','FontSize',9,'Units','normalized');

for k = 1:length(sampleIdx)
    nexttile;
    s = all_sig(:,k);
    v = s<0 & s>-300;
    scatter(rx_lons(v), rx_lats(v), 5, s(v),'filled');
    colormap('jet'); clim(prc);
    title(sprintf('wp %d (angle=%.0f\\circ)', sampleIdx(k), random_angles(sampleIdx(k))),'FontSize',9);
    xlabel('Lon','FontSize',7); ylabel('Lat','FontSize',7);
    set(gca,'FontSize',7); axis tight;
end
title(tlay,'Stage 5: per-waypoint signal maps  (random AntennaAngle, shared color scale)', ...
      'FontWeight','bold');
cb = colorbar('eastoutside'); cb.Layout.Tile = 'east';
cb.Label.String = 'Power (dBm)';
exportgraphics(fig,fullfile(DEMO_DIR,'stage5_signal_composite.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

fprintf('\n[7/7] done.  Total: %.1f s\n', toc(total_t));
end
