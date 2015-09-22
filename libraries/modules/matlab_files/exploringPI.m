function [Waypoints,geofence] = exploringPI(LLA,reward,geofence)

	states = geofence.states;
	gw = geofence.gw;	
	discount_factor_explore = 0.97;

	lon = LLA(2);
	lat = LLA(1);
	
	DIST = repmat([lat;lon],1,size(states,2))-states;	
	N = sqrt(sum(abs(DIST').^2,2));
	min_idx = find(N == min(N))
	

    	start_index = min_idx;%gw.get_index(start_state');
    	%state = states(:,start_index);%[X1(start_index);Y1(start_index)];

	gw.init_reward(reward');
	exploring_pi = PolicyIteration(gw,discount_factor_explore);
      	exploring_pi.process();
      	policy_explore = exploring_pi.get('policy');
      
      	[way_points_explore,~] = gw.set_points(policy_explore,start_index,20);
	wp_index = gw.get_index(way_points_explore);	
	Waypoints = states(:,wp_index)
	if size(Waypoints,2) > 1
	Waypoints = Waypoints(:,2)
	else
	Waypoints = Waypoints(:,1);
	end	
wp = Waypoints;
end
	
