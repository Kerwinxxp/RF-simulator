%% 发射器与接收器对称性可视化 (增加 R 点标记)
clear; clc;

% --- 1. 参数设置 ---
freq = 5.9e9;
P_tx = 23; 
c = physconst('LightSpeed');
lambda = c/freq;

% 天线配置 (8x8 URA)
array = phased.URA('Size',[8 8], 'ElementSpacing',[0.5 0.5]*lambda/2, ...
                   'Lattice','Rectangular', 'ArrayNormal','x');
array.Element = phased.GaussianAntennaElement('FrequencyRange',[0 freq], 'Beamwidth',[10 10]);
array.Taper = ones(8,8);

% 坐标定义
T_A_pos = [-50, 0, 5];
T_B_pos = [0, 80, 5];
T_B_prime_pos = [0, -80, 5];
R_pos = [20, 15, 1.5]; % 接收点 R

% --- 2. 生成网格并计算 ---
grid_x = linspace(-120, 120, 100);
grid_y = linspace(-150, 150, 100);
[X, Y] = meshgrid(grid_x, grid_y);
Total_P1 = zeros(size(X));
Total_P2 = zeros(size(X));

for i = 1:numel(X)
    cur_R = [X(i), Y(i), 1.5];
    Pa = calc_p(T_A_pos, 0, cur_R, P_tx, freq, array);
    Pb = calc_p(T_B_pos, -90, cur_R, P_tx, freq, array);
    Pbp = calc_p(T_B_prime_pos, 90, cur_R, P_tx, freq, array);
    
    Total_P1(i) = 10*log10(10^((Pa-30)/10) + 10^((Pb-30)/10)) + 30;
    Total_P2(i) = 10*log10(10^((Pa-30)/10) + 10^((Pbp-30)/10)) + 30;
end

% --- 3. 绘图 ---
figure('Position', [100, 100, 1300, 400]);

% Case 1 可视化
subplot(1,3,1);
imagesc(grid_x, grid_y, Total_P1); axis xy; colormap jet; colorbar; hold on;
plot(T_A_pos(1), T_A_pos(2), 'w^', 'MarkerSize', 10, 'LineWidth', 2); % TA
plot(T_B_pos(1), T_B_pos(2), 'w^', 'MarkerSize', 10, 'LineWidth', 2); % TB
plot(R_pos(1), R_pos(2), 'kp', 'MarkerSize', 12, 'MarkerFaceColor', 'y'); % 接收器 R (黄色星星)
title('Case 1: TA + TB');

% Case 2 可视化
subplot(1,3,2);
imagesc(grid_x, grid_y, Total_P2); axis xy; colormap jet; colorbar; hold on;
plot(T_A_pos(1), T_A_pos(2), 'w^', 'MarkerSize', 10, 'LineWidth', 2); % TA
plot(T_B_prime_pos(1), T_B_prime_pos(2), 'w^', 'MarkerSize', 10, 'LineWidth', 2); % TB'
plot(R_pos(1), R_pos(2), 'kp', 'MarkerSize', 12, 'MarkerFaceColor', 'y'); % 接收器 R
title('Case 2: TA + TB''');

% 差值图
subplot(1,3,3);
diff = Total_P1 - Total_P2;
imagesc(grid_x, grid_y, diff); axis xy; colormap(gca, 'sky'); colorbar; hold on;
plot(R_pos(1), R_pos(2), 'kp', 'MarkerSize', 12, 'MarkerFaceColor', 'y'); % 接收器 R
title('Difference (Case 1 - Case 2)');
caxis([-10 10]);

% 辅助计算函数 (与之前一致)
function Prx = calc_p(txPos, txAngle, rxPos, Ptx, freq, arrayObj)
    vec = rxPos - txPos;
    dist = max(norm(vec), 1);
    L_path = fspl(dist, 3e8/freq);
    [az, el] = cart2sph(vec(1), vec(2), vec(3));
    G = pattern(arrayObj, freq, rad2deg(az)-txAngle, rad2deg(el));
    Prx = Ptx + G - L_path;
end