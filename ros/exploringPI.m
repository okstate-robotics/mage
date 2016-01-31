function WP = exploringPI(LLA,reward,states,gw,x,y,X0,Y0,Z0,N_vec,E_vec,gp)
    disp('Called Matlab func')
	discount_factor_explore = 0.1;

    mean = gp.predict(states);
    % Just for plotting Purposes
   [X,Y] = meshgrid(fliplr(x),fliplr(y)); 
    Z = reshape(mean,length(x),length(y));
    surf(X,Y,Z)
    gp.predict([LLA(1);LLA(2)])
%    Z1 = reshape(reward,length(x),length(y));
%    figure
%    surf(X,Y,Z1)
    
	%lon = LLA(2);
	%lat = LLA(1);
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
  
	DIST = repmat([LLA_SS(1);LLA_SS(2)],1,size(states,2))-states;	
	N = sqrt(sum(abs(DIST').^2,2));
	min_idx = find(N == min(N));
	

   start_index = min_idx;%gw.get_index(start_state');
    	%state = states(:,start_index);%[X1(start_index);Y1(start_index)];
    %disp(reward)
	gw.init_reward(reward');
	exploring_pi = PolicyIteration(gw,discount_factor_explore);
      	exploring_pi.process();
      	policy_explore = exploring_pi.get('policy');
      
      	[way_points_explore,~] = gw.set_points(policy_explore,start_index,20);
	wp_index = gw.get_index(way_points_explore);	
	Waypoints = states(:,wp_index);
	 if size(Waypoints,2) > 1
        Waypoints = Waypoints(:,2);
     else
        Waypoints = Waypoints(:,1);
     end	
     disp(LLA)
    disp(Waypoints)
     % Convert the value to NED
     a = 6378137;
     b = 6356752.3142;
    alpha = Waypoints(1)*pi/180;
    omega = Waypoints(2)*pi/180;
    h = 2000*0.3048;

    X = ( (a/sqrt((cos(alpha))^2 + (sin(alpha))^2*(b/a)^2)) + h )*cos(alpha)*cos(omega);
    Y = ( (a/sqrt((cos(alpha))^2 + (sin(alpha))^2*(b/a)^2)) + h )*cos(alpha)*sin(omega);
    Z = ( (a/sqrt((cos(alpha))^2*(a/b)^2 + (sin(alpha))^2)) + h )*sin(alpha);
    Pos_n = dot([X;Y;Z]-[X0;Y0;Z0],N_vec);
    Pos_e = dot([X;Y;Z]-[X0;Y0;Z0],E_vec);
    WP = [Pos_n;Pos_e];
    disp(WP)
end
	
