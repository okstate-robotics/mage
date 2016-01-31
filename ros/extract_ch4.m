x = 36:0.1:38;
y = -123.:0.1:-120;
[X,Y] = meshgrid(x,y); 
states = [reshape(X,1,length(x)*length(y));reshape(Y,1,length(x)*length(y))];
   counter = 1;
for ii = 1:size(states,2)
    
    ai = find(lat == states(1,ii));
    aj = find(lon == states(2,ii));

    a = intersect(ai,aj);
    if ~isempty(a)    
    %ai = find(lat == states(1,ii) & lon == states(2,ii) );
    E(ii) = emission(a);
        States(:,counter) = states(:,ii);
        counter = counter + 1;
    else
        
    end
    
end


%     latlon = horzcat(lat,lon);
%     Lat = lat(a);
%     Lon = lon(a);
%     emissions = emission(a);
%     
%     [LAT,LONG] = meshgrid(Lat,Lon)
%     