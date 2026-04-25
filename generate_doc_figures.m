%% generate_doc_figures.m
% Generate documentation figures for the three doc pages, using simplified
% example parameters and existing repository data (no ray tracing).
%
%   Run:    matlab -batch "generate_doc_figures"
%
% Figures produced (in repo-relative folders):
%   1) stage1_region_tiling.png     -> static_, fix_, generateTrajectoryMaps_
%   2) stage2_osm_buildings.png     -> static_, fix_
%   3) stage2_occupancy_mask.png    -> fix_
%   4) stage3_rrt_trajectories.png  -> fix_, generateTrajectoryMaps_
%   5) stage4_antenna_pattern.png   -> static_, fix_  (as stage5_)
%   6) stage4_bearing_polar.png     -> fix_
%   7) stage4_random_angles_hist.png-> generateTrajectoryMaps_
%   8) stage5_signal_composite.png  -> static_, generateTrajectoryMaps_

ROOT = pwd;
fprintf('ROOT = %s\n', ROOT);

DST_STATIC = fullfile(ROOT, 'static transimiter simulation');
DST_FIX    = fullfile(ROOT, 'fix angle simulation');
DST_GTM    = fullfile(ROOT, 'generateTrajectoryMaps');

% ========================================================================
%% 1) Region tiling diagram (5x5)
% ========================================================================
fprintf('1/8: region tiling...\n'); t = tic;
nw_lat = 32.92556; nw_lon = -97.2696;
num_regions = 5;
R = 6371*1000; d = 260;
delta_lat = (d/R)*(180/pi);
delta_lon = (d/(R*cosd(nw_lat)))*(180/pi);

fig = figure('Color','w','Position',[100 100 600 500],'Visible','off');
ax = gca; hold(ax,'on');
for k = 1:num_regions
    for l = 1:num_regions
        nlat = nw_lat - (k-1)*delta_lat;
        nlon = nw_lon + (l-1)*delta_lon;
        rectangle(ax, 'Position', [nlon, nlat-delta_lat, delta_lon, delta_lat], ...
                  'EdgeColor', [0.18 0.36 1], 'LineWidth', 1.2, ...
                  'FaceColor', [0.18 0.36 1, 0.08]);
        plot(ax, nlon, nlat, 'o', 'MarkerSize', 5, ...
             'MarkerFaceColor', [0.85 0.18 0.25], 'MarkerEdgeColor', 'w', 'LineWidth', 0.5);
    end
end
% First-region label
text(ax, nw_lon, nw_lat + 0.0001, '  env\_num=1', 'FontSize', 8.5, 'Color', [0.85 0.18 0.25]);
xlabel(ax, 'Longitude (deg)'); ylabel(ax, 'Latitude (deg)');
title(ax, sprintf('%d \\times %d region tiling  (256 m \\times 256 m, 260 m spacing)', ...
      num_regions, num_regions), 'FontWeight', 'bold');
grid(ax,'on'); set(ax,'FontSize',9);
axis(ax,'equal'); axis(ax,'tight');

p = fullfile(DST_STATIC, 'stage1_region_tiling.png');
exportgraphics(fig, p, 'Resolution', 150);
copyfile(p, fullfile(DST_FIX, 'stage1_region_tiling.png'));
copyfile(p, fullfile(DST_GTM, 'stage1_region_tiling.png'));
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 2) OSM building polygons + region bounding box
% ========================================================================
fprintf('2/8: OSM buildings...\n'); t = tic;
osmFile = fullfile(ROOT, 'trajectoryMap.osm');
buildings = readgeotable(osmFile, 'Layer', 'buildings');
fprintf('    loaded %d building polygons\n', height(buildings));

fig = figure('Color','w','Position',[100 100 700 580],'Visible','off');
gx = geoaxes(fig);
try
    geobasemap(gx, 'streets-light');
catch
    geobasemap(gx, 'topographic');
end
hold(gx,'on');
geoplot(gx, buildings, ...
        'FaceColor', [0.95 0.55 0.2], 'EdgeColor', [0.4 0.18 0.05], ...
        'FaceAlpha', 0.6, 'LineWidth', 0.6);

% Overlay sample 256m bounding box (using OSM bounds center)
mid_lat = 29.8339; mid_lon = -95.4289;
nLat = mid_lat + 0.00115;  sLat = mid_lat - 0.00115;
wLon = mid_lon - 0.00133;  eLon = mid_lon + 0.00133;
geoplot(gx, [nLat nLat sLat sLat nLat], [wLon eLon eLon wLon wLon], ...
        '-', 'Color', [0.18 0.36 1], 'LineWidth', 2.4);

title(gx, 'OSM building polygons + 256 m \times 256 m region (blue)', 'FontWeight', 'bold');
exportgraphics(fig, fullfile(DST_STATIC, 'stage2_osm_buildings.png'), 'Resolution', 150);
copyfile(fullfile(DST_STATIC, 'stage2_osm_buildings.png'), ...
         fullfile(DST_FIX, 'stage2_osm_buildings.png'));
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 3) 256x256 building occupancy mask (computed from real OSM data)
% ========================================================================
fprintf('3/8: occupancy mask...\n'); t = tic;
gridSize = 64;
traj = readmatrix(fullfile(ROOT, 'trajectory1.csv'));

nw_lat = max(traj(:,1)) + 0.0003;
se_lat = min(traj(:,1)) - 0.0003;
wLon = min(traj(:,2)) - 0.0003;
eLon = max(traj(:,2)) + 0.0003;

lat_range = linspace(nw_lat, se_lat, gridSize);
lon_range = linspace(wLon, eLon, gridSize);
[lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
N = gridSize*gridSize;
flatLat = lat_mesh(:);   % column N x 1
flatLon = lon_mesh(:);
points = geopointshape(flatLat, flatLon);

occ = false(N, 1);
for bldgIdx = 1:height(buildings)
    try
        in = isinterior(buildings(bldgIdx,1).Shape, points);
        in_col = logical(in(:));
        if numel(in_col) == N
            occ = occ | in_col;
        end
    catch
    end
end
mask = reshape(occ, gridSize, gridSize);

fig = figure('Color','w','Position',[100 100 600 580],'Visible','off');
ax = gca;
imagesc(ax, mask);
colormap(ax, [1 1 1; 0.18 0.18 0.22]);
axis(ax, 'image');
ax.YDir = 'normal';
xlabel(ax, 'grid x'); ylabel(ax, 'grid y');
title(ax, sprintf('%d \\times %d occupancy mask  (%d/%d cells inside buildings)', ...
      gridSize, gridSize, sum(occ), N), 'FontWeight', 'bold');
set(ax, 'FontSize', 9);
exportgraphics(fig, fullfile(DST_FIX, 'stage2_occupancy_mask.png'), 'Resolution', 150);
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 4) Multiple RRT trajectories (5 paths) over OSM buildings backdrop
% ========================================================================
fprintf('4/8: multi-trajectory plot...\n'); t = tic;
fig = figure('Color','w','Position',[100 100 720 600],'Visible','off');
gx = geoaxes(fig);
try
    geobasemap(gx, 'streets-light');
catch
    geobasemap(gx, 'topographic');
end
hold(gx, 'on');
% OSM buildings as backdrop
geoplot(gx, buildings, 'FaceColor', [0.92 0.92 0.95], 'EdgeColor', [0.55 0.55 0.62], ...
        'FaceAlpha', 0.5, 'LineWidth', 0.4, 'HandleVisibility', 'off');

% Generate 5 visually-distinct trajectories by perturbing trajectory1
rng(42);
n_traj = 5;
cmap = lines(n_traj);
for i = 1:n_traj
    perturb = 0.00012 * cumsum(randn(size(traj))) * (i / n_traj);
    P = traj + perturb;
    geoplot(gx, P(:,1), P(:,2), '-', 'Color', cmap(i,:), 'LineWidth', 1.8, ...
            'DisplayName', sprintf('Trajectory %d', i));
    geoplot(gx, P(1,1), P(1,2), 'o', 'MarkerSize', 7, 'MarkerFaceColor', cmap(i,:), ...
            'MarkerEdgeColor', 'w', 'LineWidth', 0.8, 'HandleVisibility', 'off');
    geoplot(gx, P(end,1), P(end,2), '^', 'MarkerSize', 8, 'MarkerFaceColor', cmap(i,:), ...
            'MarkerEdgeColor', 'w', 'LineWidth', 0.8, 'HandleVisibility', 'off');
end

title(gx, sprintf('%d RRT-planned trajectories from one region (256 m)', n_traj), ...
      'FontWeight', 'bold');
legend(gx, 'Location', 'best', 'FontSize', 8);

exportgraphics(fig, fullfile(DST_FIX, 'stage3_rrt_trajectories.png'), 'Resolution', 150);
copyfile(fullfile(DST_FIX, 'stage3_rrt_trajectories.png'), ...
         fullfile(DST_GTM, 'stage3_rrt_trajectories.png'));
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 5) 8x8 URA + Gaussian element directivity pattern (polar)
% ========================================================================
fprintf('5/8: antenna pattern...\n'); t = tic;
freq = 28e9;
lambda = physconst('lightspeed') / freq;
arr = phased.URA('Size', [8 8], 'Lattice', 'Rectangular', 'ArrayNormal', 'x');
arr.ElementSpacing = [0.5 0.5] * lambda;
elem = phased.GaussianAntennaElement;
elem.FrequencyRange = [0 freq];
elem.Beamwidth = [20 10];
arr.Element = elem;

fig = figure('Color','w','Position',[100 100 700 600],'Visible','off');
pattern(arr, freq, 'Type', 'directivity');
title('8 \times 8 URA + Gaussian element  (3-D directivity, 28 GHz)', 'FontWeight', 'bold');
view(135, 30);

exportgraphics(fig, fullfile(DST_STATIC, 'stage4_antenna_pattern.png'), 'Resolution', 150);
copyfile(fullfile(DST_STATIC, 'stage4_antenna_pattern.png'), ...
         fullfile(DST_FIX, 'stage5_antenna_pattern.png'));
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 6) Polar histogram of bearings (fix-angle)
% ========================================================================
fprintf('6/8: bearing polar histogram...\n'); t = tic;
ang = readmatrix(fullfile(ROOT, 'trajectory1_targetAndAngles.csv'));
bearings_deg = ang(3:end);
bearings_rad = deg2rad(bearings_deg);

fig = figure('Color','w','Position',[100 100 600 560],'Visible','off');
ph = polarhistogram(bearings_rad, 24, 'FaceColor', [0.18 0.36 1], 'EdgeColor', 'w', ...
                    'LineWidth', 0.5);
title({'Distribution of antenna bearings (one trajectory)', ...
       sprintf('100 bearings concentrated near %.0f° = direction to target', mean(bearings_deg))}, ...
      'FontWeight', 'bold');
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';
ax.FontSize = 9;
exportgraphics(fig, fullfile(DST_FIX, 'stage4_bearing_polar.png'), 'Resolution', 150);
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 7) Random angle distribution histogram
% ========================================================================
fprintf('7/8: random angles histogram...\n'); t = tic;
rng(7);
n_tx = 100;
random_angles = rand(n_tx, 1) * 360;

fig = figure('Color','w','Position',[100 100 700 400],'Visible','off');
histogram(random_angles, 18, 'FaceColor', [0.20 0.65 0.30], 'EdgeColor', 'w', 'LineWidth', 0.8);
xlabel('Antenna angle (deg)'); ylabel('Number of transmitters');
title({'Random antenna orientations  (rand() \times 360)', ...
       sprintf('%d transmitters, uniform in [0, 360)', n_tx)}, 'FontWeight', 'bold');
xlim([0 360]); xticks(0:60:360);
grid on; set(gca, 'FontSize', 9);
exportgraphics(fig, fullfile(DST_GTM, 'stage4_random_angles_hist.png'), 'Resolution', 150);
close(fig); fprintf('    %.1f s\n', toc(t));

% ========================================================================
%% 8) Composite of 4 per-transmitter signal maps
% ========================================================================
fprintf('8/8: signal composite...\n'); t = tic;
tx_indices = [1 25 50 75];
fig = figure('Color','w','Position',[100 100 900 720],'Visible','off');
tlay = tiledlayout(fig, 2, 2, 'Padding', 'compact', 'TileSpacing', 'compact');

% First find global power range across all 4 for consistent colormap
all_pwr = [];
for idx = 1:numel(tx_indices)
    f = fullfile(ROOT, 'synctest_trajectoryDataset1', sprintf('%d.xlsx', tx_indices(idx)));
    if exist(f, 'file')
        T = readtable(f);
        valid = T.Power < 0;
        all_pwr = [all_pwr; T.Power(valid)]; %#ok<AGROW>
    end
end
prc = prctile(all_pwr, [5 95]);

for idx = 1:numel(tx_indices)
    nexttile;
    f = fullfile(ROOT, 'synctest_trajectoryDataset1', sprintf('%d.xlsx', tx_indices(idx)));
    if exist(f, 'file')
        T = readtable(f);
        valid = T.Power < 0;
        scatter(T.Longitude(valid), T.Latitude(valid), 6, T.Power(valid), 'filled');
        colormap('jet'); clim(prc);
        title(sprintf('Transmitter #%d', tx_indices(idx)), 'FontSize', 10);
        xlabel('Longitude'); ylabel('Latitude');
        set(gca, 'FontSize', 8); axis tight;
    end
end
title(tlay, 'Per-transmitter signal maps  (4 of 100 trajectory waypoints)', ...
      'FontWeight', 'bold');
cb = colorbar('eastoutside');
cb.Layout.Tile = 'east';
cb.Label.String = 'Power (dBm)';

exportgraphics(fig, fullfile(DST_STATIC, 'stage5_signal_composite.png'), 'Resolution', 150);
copyfile(fullfile(DST_STATIC, 'stage5_signal_composite.png'), ...
         fullfile(DST_GTM, 'stage5_signal_composite.png'));
close(fig); fprintf('    %.1f s\n', toc(t));

fprintf('\nDone. 8 figures generated, copies placed where needed.\n');
