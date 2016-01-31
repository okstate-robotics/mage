%function [states,E] = Env_Init()%,[lat_b1,lat_b2],[lon_b1,lon_b2]
% Create the state space
load 'ch4'
 % x = 36:0.1:38;
%y = -123.:0.1:-120;
%[X,Y] = meshgrid(x,y); 
%states = [reshape(X,1,length(x)*length(y));reshape(Y,1,length(x)*length(y))];

% % find the LAT and LONG closest to inputs in the statespace
% Lat_temp = abs(x-LLA(1));
% [idx idx] = min(Lat_temp); %index of closest value
% LAT_close = x(idx); %closest value
% LLA_SS(1) =  LAT_close;
% 
% Long_temp = abs(y-LLA(2));
% [idy,idy] = min(Long_temp);
% LONG_close = y(idy);
% LLA_SS(2) = LONG_close;
% 
% LLA_SS(3) = LLA(3);

%ENV = struct('x',x,'y',y,'states',states,'X',X,'Y',Y);
%end