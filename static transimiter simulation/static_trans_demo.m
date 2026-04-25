function static_trans_demo()
% STATIC_TRANS_DEMO  Demo version of static_trans.m for documentation figures.
%
% Mirrors static_trans.m but with reduced parameters so the full pipeline runs
% in a few minutes:
%   * 1 region (instead of N rows from target_region_1.xlsx)
%   * 32 x 32 grid (instead of 256 x 256)
%   * 5 transmitters (instead of 135)
%   * coverage_test 'Resolution' = 10 (instead of 1)
%
% Outputs (saved to this folder for the doc HTML to embed):
%   stage1_region_tiling.png        5x5 region tiling diagram
%   stage2_osm_buildings.png        OSM buildings + region bounding box
%   stage3_valid_points.png         coverage_test result (NEW)
%   stage4_antenna_pattern.png      8x8 URA + Gaussian directivity
%   stage4_tx_placement.png         5 transmitters with angle vectors (NEW)
%   stage5_signal_heatmap.png       sigstrength output for Tx 1 (NEW)
%   stage5_signal_composite.png     2x3 composite of all 5 TX signal maps

DEMO_DIR = fileparts(mfilename('fullpath'));
ROOT     = fileparts(DEMO_DIR);
addpath(ROOT);  % so coverage_test.m is reachable

fprintf('=== static_trans_demo ===\nOutput: %s\n', DEMO_DIR);
total_t = tic;

%% Region setup (Houston, matches existing trajectoryMap.osm cache)
nw_lat = 29.8362;
nw_lon = -95.4316;

R = 6371*1000; d = 256;
delta_lat = (d/R)*(180/pi);
delta_lon = (d/(R*cosd(nw_lat)))*(180/pi);
se_lat = nw_lat - delta_lat;
se_lon = nw_lon + delta_lon;

a = sin(deg2rad(se_lat-nw_lat)/2)^2 + ...
    cos(deg2rad(nw_lat))*cos(deg2rad(se_lat)) * ...
    sin(deg2rad(se_lon-nw_lon)/2)^2;
diagonalDistance = R * 2 * atan2(sqrt(a), sqrt(1-a));

%% ---------- Stage 1: region tiling diagram ----------
fprintf('\n[1/6] region tiling...\n'); t = tic;
fig = figure('Color','w','Position',[100 100 700 540],'Visible','off');
ax  = gca; hold(ax,'on');
for k = 0:4
    for l = 0:4
        nlat = nw_lat - k*delta_lat*1.02;
        nlon = nw_lon + l*delta_lon*1.02;
        rectangle(ax, 'Position',[nlon, nlat-delta_lat, delta_lon, delta_lat], ...
                  'EdgeColor',[0.18 0.36 1],'LineWidth',1.2, ...
                  'FaceColor',[0.18 0.36 1, 0.08]);
        plot(ax, nlon, nlat,'o','MarkerSize',5, ...
             'MarkerFaceColor',[0.85 0.18 0.25],'MarkerEdgeColor','w');
    end
end
xlabel(ax,'Longitude (deg)'); ylabel(ax,'Latitude (deg)');
title(ax,'Stage 1: 5\times5 region tiling (256 m \times 256 m, 260 m spacing)','FontWeight','bold');
grid(ax,'on'); axis(ax,'equal'); axis(ax,'tight'); set(ax,'FontSize',10);
exportgraphics(fig,fullfile(DEMO_DIR,'stage1_region_tiling.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% ---------- Stage 2: OSM buildings ----------
fprintf('\n[2/6] OSM buildings...\n'); t = tic;
osmFile = fullfile(ROOT,'trajectoryMap.osm');
buildings = readgeotable(osmFile,'Layer','buildings');
fprintf('   loaded %d building polygons\n', height(buildings));

fig = figure('Color','w','Position',[100 100 720 560],'Visible','off');
gx  = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.95 0.55 0.2],'EdgeColor',[0.4 0.18 0.05], ...
        'FaceAlpha',0.6,'LineWidth',0.5);
geoplot(gx,[nw_lat nw_lat se_lat se_lat nw_lat],[nw_lon se_lon se_lon nw_lon nw_lon], ...
        '-','Color',[0.18 0.36 1],'LineWidth',2.4);
title(gx, sprintf('Stage 2: %d OSM buildings + 256 m region (blue)', height(buildings)), ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage2_osm_buildings.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% ---------- Stage 3: probe TX -> coverage_test ----------
fprintf('\n[3/6] coverage_test (slow)...\n'); t = tic;

gridSize = 32;
lat_range = linspace(nw_lat, se_lat, gridSize);
lon_range = linspace(nw_lon, se_lon, gridSize);
[lat_mesh, lon_mesh] = meshgrid(lat_range, lon_range);
lat_lon_table = [reshape(lat_mesh,1,[]); reshape(lon_mesh,1,[])]';

probe_idx = randi(size(lat_lon_table,1));
probe_lat = lat_lon_table(probe_idx,1);
probe_lon = lat_lon_table(probe_idx,2);

freq = 28e9;
lambda = physconst('lightspeed')/freq;

siteviewer('Buildings',osmFile,'Visible','off');
tx_probe = txsite('Name','Probe','Latitude',probe_lat,'Longitude',probe_lon, ...
                  'TransmitterFrequency',freq,'TransmitterPower',1,'AntennaHeight',2);

arr = phased.URA('Size',[8 8],'Lattice','Rectangular','ArrayNormal','x');
arr.ElementSpacing = [0.5 0.5]*lambda;
elem = phased.GaussianAntennaElement;
elem.FrequencyRange = [0 freq];
elem.Beamwidth = [20 10];
arr.Element = elem;
tx_probe.Antenna = arr;
tx_probe.AntennaAngle = 180;

pm_probe = propagationModel('raytracing','Method','sbr', ...
                            'MaxNumReflections',0,'MaxNumDiffractions',0);
[~,~,datalats,datalons] = coverage_test(tx_probe, pm_probe, ...
                                        'MaxRange',diagonalDistance,'Resolution',10);
inBox = datalats <= nw_lat & datalats >= se_lat & ...
        datalons >= nw_lon & datalons <= se_lon;
filtered = [datalats(inBox), datalons(inBox)];
fprintf('   coverage_test: %d returned, %d in box\n', length(datalats), sum(inBox));

fig = figure('Color','w','Position',[100 100 720 560],'Visible','off');
gx  = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.95 0.55 0.2],'FaceAlpha',0.35,'EdgeColor','none');
geoscatter(gx,filtered(:,1),filtered(:,2),16,[0.18 0.36 1],'filled');
geoscatter(gx,probe_lat,probe_lon,200,'red','pentagram','filled', ...
           'MarkerEdgeColor','w','LineWidth',1.5);
title(gx, sprintf('Stage 3: %d valid (non-building) receiver points from coverage\\_test', sum(inBox)), ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage3_valid_points.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% ---------- Stage 4: place 5 transmitters + show antenna pattern ----------
fprintf('\n[4/6] place 5 TX, antenna pattern...\n'); t = tic;
nTx = 5;
selIdx = randperm(size(filtered,1), nTx);
tx_lats = filtered(selIdx,1);
tx_lons = filtered(selIdx,2);
tx_angles = rand(nTx,1)*360;

txArr = txsite('Name', "Tx" + (1:nTx), 'Latitude',tx_lats,'Longitude',tx_lons, ...
               'TransmitterFrequency',freq,'TransmitterPower',1,'AntennaHeight',2);
for tt = 1:nTx
    arr_t = phased.URA('Size',[8 8],'Lattice','Rectangular','ArrayNormal','x');
    arr_t.ElementSpacing = [0.5 0.5]*lambda;
    elem_t = phased.GaussianAntennaElement;
    elem_t.FrequencyRange = [0 freq];
    elem_t.Beamwidth = [20 10];
    arr_t.Element = elem_t;
    txArr(tt).Antenna = arr_t;
    txArr(tt).AntennaAngle = tx_angles(tt);
end

% 4a: 3D antenna pattern
fig = figure('Color','w','Position',[100 100 700 540],'Visible','off');
pattern(arr, freq, 'Type','directivity');
view(135, 30);
title('Stage 4: 8\times8 URA + Gaussian element directivity (28 GHz)','FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage4_antenna_pattern.png'),'Resolution',130);
close(fig);

% 4b: TX placement with angle arrows
fig = figure('Color','w','Position',[100 100 720 560],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.92 0.92 0.95],'FaceAlpha',0.5, ...
        'EdgeColor',[0.55 0.55 0.62],'HandleVisibility','off');
geoscatter(gx,filtered(:,1),filtered(:,2),4,[0.7 0.75 0.85],'filled', ...
           'HandleVisibility','off');
cmap = lines(nTx);
arrow_len = 0.0004;
for tt = 1:nTx
    ar = deg2rad(tx_angles(tt));
    end_lat = tx_lats(tt) + arrow_len*cos(ar);
    end_lon = tx_lons(tt) + arrow_len*sin(ar);
    geoplot(gx,[tx_lats(tt) end_lat],[tx_lons(tt) end_lon], ...
            '-','Color',cmap(tt,:),'LineWidth',2.5,'HandleVisibility','off');
    geoscatter(gx,tx_lats(tt),tx_lons(tt),140,cmap(tt,:),'pentagram','filled', ...
               'MarkerEdgeColor','k','LineWidth',0.8, ...
               'DisplayName',sprintf('Tx %d (%.0f\\circ)',tt,tx_angles(tt)));
end
title(gx, sprintf('Stage 4: %d transmitters with random AntennaAngle', nTx),'FontWeight','bold');
legend(gx,'Location','best','FontSize',8);
exportgraphics(fig,fullfile(DEMO_DIR,'stage4_tx_placement.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% ---------- Stage 5: sigstrength for all 5 TX ----------
fprintf('\n[5/6] sigstrength for all 5 TX (slow)...\n'); t = tic;
rx = rxsite('Latitude',filtered(:,1),'Longitude',filtered(:,2), ...
            'ReceiverSensitivity',-100,'AntennaHeight',2);
pm_calc = propagationModel('raytracing','Method','sbr', ...
                           'MaxNumReflections',1,'MaxNumDiffractions',0);

all_sig = zeros(size(filtered,1), nTx);
for tt = 1:nTx
    fprintf('   Tx %d/%d...\n', tt, nTx);
    s = sigstrength(rx, txArr(tt), pm_calc);
    all_sig(:,tt) = s(:);
end

% Single TX heatmap (Tx 1)
sigStre = all_sig(:,1);
valid = sigStre < 0 & sigStre > -300;
fig = figure('Color','w','Position',[100 100 720 580],'Visible','off');
gx = geoaxes(fig);
try, geobasemap(gx,'streets-light'); catch, geobasemap(gx,'topographic'); end
hold(gx,'on');
geoplot(gx,buildings,'FaceColor',[0.85 0.85 0.88],'FaceAlpha',0.4, ...
        'EdgeColor','none','HandleVisibility','off');
geoscatter(gx,filtered(valid,1),filtered(valid,2),20,sigStre(valid),'filled');
geoscatter(gx,tx_lats(1),tx_lons(1),200,'red','pentagram','filled', ...
           'MarkerEdgeColor','w','LineWidth',1.5);
colormap(gx,'jet');
cb = colorbar(gx); cb.Label.String = 'Power (dBm)';
title(gx, sprintf('Stage 5: Signal strength from Tx 1 (angle=%.0f\\circ)',tx_angles(1)), ...
      'FontWeight','bold');
exportgraphics(fig,fullfile(DEMO_DIR,'stage5_signal_heatmap.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

%% ---------- Stage 6: composite of all 5 TX maps ----------
fprintf('\n[6/6] composite figure...\n'); t = tic;
flat = all_sig(:); vals = flat(flat<0 & flat>-300);
prc = prctile(vals,[5,95]);

fig = figure('Color','w','Position',[100 100 1000 700],'Visible','off');
tlay = tiledlayout(fig,2,3,'Padding','compact','TileSpacing','compact');
nexttile;
plot(NaN,NaN); axis off;
text(0.5,0.62,sprintf('%d transmitter\nplacements',nTx), ...
     'HorizontalAlignment','center','FontSize',12,'FontWeight','bold','Units','normalized');
text(0.5,0.32,'each tile: same\nantenna, different\nAntennaAngle', ...
     'HorizontalAlignment','center','FontSize',9,'Units','normalized');

for tt = 1:nTx
    nexttile;
    s = all_sig(:,tt);
    v = s<0 & s>-300;
    scatter(filtered(v,2),filtered(v,1),5,s(v),'filled');
    colormap('jet'); clim(prc);
    title(sprintf('Tx %d (angle=%.0f\\circ)',tt,tx_angles(tt)),'FontSize',9);
    xlabel('Lon','FontSize',7); ylabel('Lat','FontSize',7);
    set(gca,'FontSize',7); axis tight;
end
title(tlay,'Stage 5: per-transmitter signal maps (shared color scale)','FontWeight','bold');
cb = colorbar('eastoutside'); cb.Layout.Tile = 'east';
cb.Label.String = 'Power (dBm)';
exportgraphics(fig,fullfile(DEMO_DIR,'stage5_signal_composite.png'),'Resolution',130);
close(fig); fprintf('   %.1fs\n', toc(t));

fprintf('\nTotal: %.1f s\n', toc(total_t));
end
