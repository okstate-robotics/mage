% Script that initializes the online GP model and executes the planning module over a socket
% This creates the ogp which describes a generative model of the threat at various positions

function geofence = Init(LLA)%,[lat_b1,lat_b2],[lon_b1,lon_b2]
%clear all;close all;clc;

% GP_params
sigma = [0.1;0.1];
noise = 0.01;
ncent = 70; 
tol = 1e-4;

ogp = onlineGP(sigma,noise,ncent,tol);
ogp.process([0;0],0)
row = 20;
col = 20;

x = linspace(35,45,col);
y = linspace(-125,-115,row);
[X,Y] = meshgrid(x,y);
states = [reshape(X,1,length(x)*length(y));reshape(Y,1,length(x)*length(y))];

%,'gw',gw,'ogp',ogp
gw = GPGridWorld(row,col);
geofence = struct('x',x,'y',y,'states',states,'X',X,'Y',Y,'gw',gw,'ogp',ogp);
end
