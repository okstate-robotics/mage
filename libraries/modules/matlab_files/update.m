function [geofence,post_mean,post_var] = update(geofence,LLA,threat)
	
	ogp = geofence.ogp;
	X = geofence.X;
	Y = geofence.Y;
	
	for ii = 1:size(LLA,2)
		
		ogp.update(LLA(1:2,ii),threat(ii));
	end
	post_mean = zeros(1,size(geofence.states,2));
	[~,post_var] = ogp.predict(geofence.states); 
	
	Z = reshape(post_var,20,20);
	mesh(geofence.X,geofence.Y,Z)
	%geofence = struct('x',x,'y',y,'states',states,'X',X,'Y',Y,'gw',gw,'ogp',ogp);
	geofence.ogp = ogp;
	%save('data','X','Y','post_var,Z')
end
