%% visualize_5_tx_rx.m
% 基于 coverage_app_exported.m 里的 sites 放置逻辑
% 可视化 5 个 transmitters + 5 个 receivers

clear; clc;

%% 1) 输入：你的 NW 起点（和 App 里 NorthWestLatitude / NorthWestLongitude 一样）
nw_lat = 41.8820;   % <-- 改成你的 NorthWestLatitudeEditField.Value
nw_lon = -87.6270;  % <-- 改成你的 NorthWestLongitudeEditField.Value

% 你代码里固定用的距离（米）：distance = 256.5
distance_m = 256.5;

% 网格大小（你代码里固定 n=m=256）
n = 256;
m = 256;

%% 2) 复刻你代码：由 NW 点推 SE 点（地球半径法）
radius = 6371000;
angular_distance = distance_m / radius;

se_lat = nw_lat - rad2deg(angular_distance);
se_lon = nw_lon + rad2deg(angular_distance / cosd(nw_lat));

%% 3) 复刻你代码：生成 256×256 的 centroidLat/centroidLon 以及 randLatitudes/randLongitudes
latInterval = (nw_lat - se_lat) / n;
lonInterval = (nw_lon - se_lon) / m;

centroidLatitude  = zeros(n, m);
centroidLongitude = zeros(n, m);

latitudes  = [];
longitudes = [];

for row = 1:n
    for col = 1:m
        cell_nwLat = nw_lat - (row - 1) * latInterval;
        cell_nwLon = se_lon + (col - 1) * lonInterval;
        cell_seLat = nw_lat - row * latInterval;
        cell_seLon = se_lon + col * lonInterval;

        centroidLatitude(row, col)  = (cell_nwLat + cell_seLat) / 2;
        centroidLongitude(row, col) = (cell_nwLon + cell_seLon) / 2;

        latitudes  = [latitudes,  centroidLatitude(row, col)];
        longitudes = [longitudes, centroidLongitude(row, col)];
    end
end

% 你代码里对 longitudes 做了 flip
longitudes = flip(longitudes);

randLatitudes  = latitudes;
randLongitudes = longitudes;

% 你代码里 sites 的命名：sites = [sites, strcat(string(row),string(col))]
% 这里给出同样的命名生成（可选：你如果只需要索引可不生成）
sites = strings(1, n*m);
k = 1;
for row = 1:n
    for col = 1:m
        sites(k) = strcat(string(row), string(col));
        k = k + 1;
    end
end

%% 4) 选择 5 个 TX + 5 个 RX（默认随机，想固定就自己写索引）
num_points = n*m;
rng(7); % 固定随机种子，方便复现实验
all_idx = randperm(num_points, 10);

tx_idx = all_idx(1:5);
rx_idx = all_idx(6:10);

tx_lat = randLatitudes(tx_idx);
tx_lon = randLongitudes(tx_idx);

rx_lat = randLatitudes(rx_idx);
rx_lon = randLongitudes(rx_idx);

tx_name = "TX_" + string(1:5);
rx_name = "RX_" + string(1:5);

%% 5) 可视化方式 A：geoaxes + geoscatter（推荐先用这个）
figure('Name','5 TX + 5 RX (geoaxes)');
gx = geoaxes;
geobasemap(gx, "streets");
hold(gx, "on");

geoscatter(gx, tx_lat, tx_lon, 60, "filled"); % TX
geoscatter(gx, rx_lat, rx_lon, 60, "o");      % RX

% 标注名字
for i = 1:5
    text(gx, tx_lat(i), tx_lon(i), " " + tx_name(i), 'FontWeight','bold');
    text(gx, rx_lat(i), rx_lon(i), " " + rx_name(i));
end

title(gx, "5 Transmitters + 5 Receivers (sites 网格放置逻辑)");
geolimits(gx, [se_lat nw_lat], [nw_lon se_lon]); % 控制视野范围（按你的 bbox）

%% 6) 可视化方式 B：siteviewer + txsite/rxsite（需要相关 Toolbox）
% 如果你没有 siteviewer/txsite/rxsite，会报错；那就注释掉这一段即可。
try
    viewer = siteviewer("Basemap","streets"); % 不依赖 map.osm
    tx = txsite( ...
        "Name", tx_name, ...
        "Latitude", tx_lat, ...
        "Longitude", tx_lon, ...
        "TransmitterFrequency", 2.4e9, ... % 示例，可改
        "TransmitterPower", 10, ...        % 示例 dBm，可改
        "AntennaHeight", 1 ...             % 示例，可改
    );

    rx = rxsite( ...
        "Name", rx_name, ...
        "Latitude", rx_lat, ...
        "Longitude", rx_lon, ...
        "AntennaHeight", 1 ...             % 示例，可改
    );

    show(tx);
    show(rx);

catch ME
    warning("siteviewer/txsite/rxsite 不可用或缺少工具箱：%s\n已仅展示 geoaxes 图。", ME.message);
end

%% 7) 输出一下你挑选的 sites 名称（rowcol 字符串），方便你和 App 里的 DropDown 对照
disp("=== TX Sites (rowcol) ===");
disp(sites(tx_idx));
disp("=== RX Sites (rowcol) ===");
disp(sites(rx_idx));
