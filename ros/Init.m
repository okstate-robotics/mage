% Script that initializes the online GP model and executes the planning module over a socket
% This creates the ogp which describes a generative model of the threat at various positions

function Navplan = Init(LLA,Sensor_val)%,[lat_b1,lat_b2],[lon_b1,lon_b2]
a = 6378137;
b = 6356752.3142;

LLA_home = [37.64,-122.48,2000];
alpha = LLA_home(1)*pi/180;
omega = LLA_home(2)*pi/180;
h = LLA_home(3)*0.3048;

X0 = ( (a/sqrt((cos(alpha))^2 + (sin(alpha))^2*(b/a)^2)) + h )*cos(alpha)*cos(omega);
Y0 = ( (a/sqrt((cos(alpha))^2 + (sin(alpha))^2*(b/a)^2)) + h )*cos(alpha)*sin(omega);
Z0 = ( (a/sqrt((cos(alpha))^2*(a/b)^2 + (sin(alpha))^2)) + h )*sin(alpha);

N0 = [0;0;1];E0=[0;1;0];D0=[-1;0;0];
N1 = Rot(omega,N0)*N0;E1=Rot(omega,N0)*E0;D1=Rot(omega,N0)*D0;
N = Rot(alpha,-E1)*N1;E = Rot(alpha,-E1)*E1;D=Rot(alpha,-E1)*D1;


% Create the state space

n_row = 40;
n_col = 40;

x = linspace(36,38,n_col); % discretize the latitudes
y = linspace(-123,-120,n_row); % discretize the longitudes
[X,Y] = meshgrid(x,y); 
states = [reshape(X,1,length(x)*length(y));reshape(Y,1,length(x)*length(y))];

% find the LAT and LONG closest to inputs in the statespace
Lat_temp = abs(x-LLA(1));
[idx idx] = min(Lat_temp); %index of closest value
LAT_close = x(idx); %closest value
LLA_SS(1) =  LAT_close;

Long_temp = abs(y-LLA(2));
[idy,idy] = min(Long_temp);
LONG_close = y(idy);
LLA_SS(2) = LONG_close;

LLA_SS(3) = LLA(3);

% GP_params
sigma = [0.01;0.01];
noise = 0.001;
ncent = 200; 
tol = 1e-4;

ogp = onlineGP(sigma,noise,ncent,tol);
ogp.process([LLA_SS(1);LLA(2)],Sensor_val)
%[~,post_var] = ogp.predict(states); 
%,'gw',gw,'ogp',ogp
gw = GPGridWorld(n_row,n_col);
Navplan = struct('x',x,'y',y,'states',states,'X',X,'Y',Y,'gw',gw,'ogp',ogp,'X0',X0,'Y0',Y0,'Z0',Z0,'N',N,'E',E,'D',D);
end
