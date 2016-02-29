
load('global_ch4_data')
ai = find(lat>=36 & lat<=38);
aj = find(lon>=-123 & lon<=-120);E

id = intersect(ai,aj);
states = [lat(id),lon(id)]';
E = emission(id);

save('CH4','states','E')
sigma = 0.01;
noise = 0.001;
ncent = 300;
tol = 1e-4;

ogp = onlineGP(sigma,noise,ncent,tol);
ogp.process(states(:,1),E(1));

for i =2:size(states,2)    
   ogp.update(states(:,i),E(i)); 
end

x = 38:-0.1:36;
y = -123:0.1:-120;
[X,Y]=meshgrid(x,y);
STATES = [reshape(X,1,length(x)*length(y));reshape(Y,1,length(x)*length(y))];
m = ogp.predict(STATES);

Z = reshape(m,length(y),length(x));
surf(X,Y,Z)