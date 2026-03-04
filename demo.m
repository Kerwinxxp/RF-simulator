%% Mobile Robot Kinematics Simulation - Geographic Coordinates Experiment
% This script simulates the movement of different types of mobile robots along actual GPS coordinate paths
% and compares their behavioral characteristics

%% Initialize Parameters
sampleTime = 0.05;  % Sampling time (seconds)
tVec = 0:sampleTime:60;  % Time vector

%% Define Mobile Robot Kinematics Models
% 1. Unicycle Model - The simplest model, controlled by wheel speed and rotation around the central axis
unicycle = unicycleKinematics(VehicleInputs="VehicleSpeedHeadingRate");

% 2. Differential Drive Model - Uses rear drive axle to control both vehicle speed and turning rate
diffDrive = differentialDriveKinematics(VehicleInputs="VehicleSpeedHeadingRate");
diffDrive.WheelSpeedRange = [-10 10]*2*pi;  % Add wheel speed constraints

% 3. Bicycle Model - Similar to a car model, with two axles: rear drive and front steering
bicycle = bicycleKinematics(VehicleInputs="VehicleSpeedHeadingRate", MaxSteeringAngle=pi/8);

%% Get GPS data and convert to UTM coordinates
% Get latitude and longitude data
[lat, lon] = getGPSData();

% Convert latitude and longitude coordinates to UTM coordinates
[utmX, utmY, utmZone] = deg2utm(lat, lon);
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
% Unicycle Model
[tUnicycle, unicyclePose] = ode45(@(t,y) ...
    derivative(unicycle, y, robotController(controller1, y, goalPoints, goalRadius)), ...
    tVec, initPose);
[unicycleLats, unicycleLons] = utm2deg(unicyclePose(1:height(unicyclePose)/height(utmZone):end, 1),unicyclePose(1:height(unicyclePose)/height(utmZone):end, 2),utmZone);

% Bicycle Model
[tBicycle, bicyclePose] = ode45(@(t,y) ...
    derivative(bicycle, y, robotController(controller2, y, goalPoints, goalRadius)), ...
    tVec, initPose);
[bicycleLats, bicycleLons] = utm2deg(bicyclePose(1:height(bicyclePose)/height(utmZone):end, 1),bicyclePose(1:height(bicyclePose)/height(utmZone):end, 2),utmZone);

% Differential Drive Model
[tDiffDrive, diffDrivePose] = ode45(@(t,y) ...
    derivative(diffDrive, y, robotController(controller3, y, goalPoints, goalRadius)), ...
    tVec, initPose);
[diffDriveLats, diffDriveLons] = utm2deg(diffDrivePose(1:height(diffDrivePose)/height(utmZone):end, 1), diffDrivePose(1:height(diffDrivePose)/height(utmZone):end, 2), utmZone);
 
%% Prepare Visualization Data
% Unicycle Model
unicycleTranslations = [unicyclePose(:,1:2) zeros(size(unicyclePose,1),1)];
unicycleRot = axang2quat([repmat([0 0 1], size(unicyclePose,1), 1), unicyclePose(:,3)]);

% Bicycle Model
bicycleTranslations = [bicyclePose(:,1:2) zeros(size(bicyclePose,1),1)];
bicycleRot = axang2quat([repmat([0 0 1], size(bicyclePose,1), 1), bicyclePose(:,3)]);

% Differential Drive Model
diffDriveTranslations = [diffDrivePose(:,1:2) zeros(size(diffDrivePose,1),1)];
diffDriveRot = axang2quat([repmat([0 0 1], size(diffDrivePose,1), 1), diffDrivePose(:,3)]);

%% Plot Results
figure('Position', [100, 100, 1200, 800]);

% Plot waypoints
plot(utm_waypoints(:,1), utm_waypoints(:,2), 'kx-', 'MarkerSize', 10, 'LineWidth', 2);
hold on;

% Plot trajectories for each model (sample every 20 poses for clarity)
plotTransforms(unicycleTranslations(1:20:end,:), unicycleRot(1:20:end,:), ...
    MeshFilePath="groundvehicle.stl", MeshColor="r");
plotTransforms(bicycleTranslations(1:20:end,:), bicycleRot(1:20:end,:), ...
    MeshFilePath="groundvehicle.stl", MeshColor="b");
plotTransforms(diffDriveTranslations(1:20:end,:), diffDriveRot(1:20:end,:), ...
    MeshFilePath="groundvehicle.stl", MeshColor="g");

% Set plot properties
axis equal;
axis tight;
view(0, 90);
title('Mobile Robot Trajectory Simulation Based on UTM Coordinates');
legend('GPS Trajectory Points', 'Unicycle Model', 'Bicycle Model', 'Differential Drive Model');
hold off;

%% Helper Function: Robot Controller
function v = robotController(controller, pose, goalPoints, goalRadius)
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

%% Helper Function: Convert Latitude/Longitude to UTM coordinates
function  [x,y,utmzone] = deg2utm(Lat,Lon)
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
error(nargchk(2, 2, nargin));  %2 arguments required
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

%% Helper Function: Get GPS Data
function [latitude, longitude] = getGPSData()
    % Predefined latitude and longitude data points
    latitude = [29.8338295701175;
       29.8337996131717;
       29.8337985688543;
       29.8337984598616;
       29.8337941395082;
       29.8337821506328;
       29.8337622951290;
       29.8337621942635;
       29.8337629752410;
       29.8337568108286;
       29.8337231269438;
       29.8336988640277;
       29.8336641248567;
       29.8336286709844;
       29.8335976322306;
       29.8335645977312;
       29.8335469136513;
       29.8335378075569;
       29.8335135556254;
       29.8335367521699;
       29.8335534758887;
       29.8335565789056;
       29.8335480051358;
       29.8335346552836;
       29.8335229538189;
       29.8335018812511;
       29.8335285385586;
       29.8335374533174;
       29.8335334371785;
       29.8335427352875;
       29.8335462805096;
       29.8335312518809;
       29.8335205566915;
       29.8335322329816;
       29.8335085569605;
       29.8335189216904;
       29.8335121025284;
       29.8335105558772;
       29.8335254655545;
       29.8335274350775;
       29.8335218534356;
       29.8335113231058;
       29.8334952068460;
       29.8334776659061;
       29.8334457356653;
       29.8334186300884;
       29.8334062225731];

    longitude = [-95.4265740017539;
       -95.426593117095;
       -95.4266344919086;
       -95.4266759220283;
       -95.426716101074;
       -95.4267484982183;
       -95.4267796362177;
       -95.4268210734314;
       -95.4268624974089;
       -95.4269009982431;
       -95.4269138705788;
       -95.4269231298015;
       -95.4269254488004;
       -95.4269285229112;
       -95.4269345520545;
       -95.4269308233167;
       -95.4269538594543;
       -95.4269911042837;
       -95.4270143595338;
       -95.4270453509952;
       -95.4270819203780;
       -95.4271227237273;
       -95.4271572275998;
       -95.4271946429499;
       -95.4272325166548;
       -95.4272655460052;
       -95.4272920755728;
       -95.4273318275246;
       -95.4273722698982;
       -95.4274069796627;
       -95.4274477163980;
       -95.4274820435263;
       -95.4275110862597;
       -95.4275495552440;
       -95.4275749588743;
       -95.4276105047370;
       -95.4276464601260;
       -95.4276824980395;
       -95.4277193327010;
       -95.4277582378078;
       -95.4277909572753;
       -95.4278277700065;
       -95.4278633884873;
       -95.4278985005264;
       -95.4279142441028;
       -95.4279405950123;
       -95.4279709511886];
end

function  [Lat,Lon] = utm2deg(xx,yy,utmzone)
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
error(nargchk(3, 3, nargin)); %3 arguments required
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