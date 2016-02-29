function data = Sensor_info(p,states,E)
tic

A = repmat(p(1:2)',1,size(states,2))-states;
dist2 = diag(A'*A);
dist = sqrt(dist2);
min_dist_ind = dist == min(dist);

data = E(min_dist_ind) + 30*rand(1); 

%n_row = 50;
%n_col = 50;

%x = linspace(36,38,n_col); % discretize the latitudes
%y = linspace(-123,-120,n_row); % discretize the longitudes

%x = 36:0.05:38;
%y = -123.:0.05:-120;
% find the LAT and LONG closest to inputs in the statespace
%Lat_temp = abs(x-p(1));
%[idx idx] = min(Lat_temp); %index of closest value
%LAT_close = x(idx); %closest value
%LLA_SS(1) =  LAT_close

%Long_temp = abs(y-p(2));
%[idy,idy] = min(Long_temp);
%LONG_close = y(idy);
%LLA_SS(2) = LONG_close
%states
%ai = find(LLA_SS(1) == states(1,:))
%aj = find(LLA_SS(2) == states(2,:))
%a = intersect(ai,aj);
%if ~isempty(a)
%    %ai = find(lat == states(1,ii) & lon == states(2,ii) );
%    data = E(a);
%else
%    data = 0.0;
%end
toc
end
