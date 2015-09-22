# Nasal script to create a mage node in flightgear from each aircraft. Note this script is using basic functions from Nasal and it might not be optimized.
 # ======================================================================== #
 #                     MULTIAGENT GAME ENVIRONMENT                          #
 #                             M  A  G  E                                   #
 # ======================================================================== #

#=======================================================================#
#                   Author : Rakshit Dayal                              #
#=======================================================================#

# ============== All Function Calls for initializing MAGE node in FG ======================#

var mage_init = func{
	var mage = props.globals.initNode("mage");

	mage.addChild("team");
	mage.addChild("player");
	mage.getNode("player").addChild("GNC");
	mage.getNode("player").addChild("Communications");
	mage.getNode("player").addChild("Instrumentation");

	mage.getNode("player/GNC").addChild("Navigation");
	mage.getNode("player/GNC").addChild("Guidance");
	mage.getNode("player/GNC").addChild("Control");

	mage.getNode("player/GNC/Navigation").addChild("IMU");
	mage.getNode("player/GNC/Navigation/IMU").addChild("latitude-deg");
	mage.getNode("player/GNC/Navigation/IMU").addChild("longitude-deg");
	mage.getNode("player/GNC/Navigation/IMU").addChild("altitude-m");
	mage.getNode("player/GNC/Navigation/IMU").addChild("Pos_n");
	mage.getNode("player/GNC/Navigation/IMU").addChild("Pos_e");
	mage.getNode("player/GNC/Navigation/IMU").addChild("Pos_d");

	mage.getNode("player/GNC/Navigation/IMU").addChild("V_n-ms");
	mage.getNode("player/GNC/Navigation/IMU").addChild("V_e-ms");
	mage.getNode("player/GNC/Navigation/IMU").addChild("V_d-ms");
	mage.getNode("player/GNC/Navigation/IMU").addChild("V-airspeed");
	mage.getNode("player/GNC/Navigation/IMU").addChild("u");
	mage.getNode("player/GNC/Navigation/IMU").addChild("v");
	mage.getNode("player/GNC/Navigation/IMU").addChild("w");

	mage.getNode("player/GNC/Navigation/IMU").addChild("roll-deg");
	mage.getNode("player/GNC/Navigation/IMU").addChild("pitch-deg");
	mage.getNode("player/GNC/Navigation/IMU").addChild("yaw-deg");
	mage.getNode("player/GNC/Navigation/IMU").addChild("roll-rate-degps");
	mage.getNode("player/GNC/Navigation/IMU").addChild("pitch-rate-degps");
	mage.getNode("player/GNC/Navigation/IMU").addChild("yaw-rate-degps");
	mage.getNode("player/GNC/Navigation/IMU").addChild("p-body");
	mage.getNode("player/GNC/Navigation/IMU").addChild("q-body");
	mage.getNode("player/GNC/Navigation/IMU").addChild("r-body");
	mage.getNode("player/GNC/Navigation/IMU").addChild("course");
	
	mage.getNode("player/GNC/Navigation").addChild("Perception"); # environment perception

	mage.getNode("player/GNC/Guidance").addChild("Decision"); # high level decision making
	mage.getNode("player/GNC/Guidance/Decision").setValue(0);
	# This Decision node is a little underdeveloped and for now only contains the following 7 actions
	# 0: throttle incr, 1: throttle decre, 2: climb, 3:descent, 4: turn left 5:turn right 6: loiter
	
	# Nodes corresponding to waypoints selections
	mage.getNode("player/GNC/Guidance").addChild("Pathplan");
	mage.getNode("player/GNC/Guidance/Pathplan").addChild("waypoints");
	mage.getNode("player/GNC/Guidance/Pathplan").addChild("reached");
	mage.getNode("player/GNC/Guidance/Pathplan/reached").setValue(0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints").addChild("lastwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("latlwp-deg");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("lonlwp-deg");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("altlwp-m");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("Xlwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("Ylwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("Zlwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp").addChild("courselwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/latlwp-deg").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/lonlwp-deg").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/altlwp-m").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/Xlwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/Ylwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/Zlwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/courselwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints").addChild("currentwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("latcwp-deg");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("loncwp-deg");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("altcwp-m");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("Xcwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("Ycwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("Zcwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp").addChild("coursecwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/Xcwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/Ycwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/Zcwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/latcwp-deg").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/loncwp-deg").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/altcwp-m").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/coursecwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints").addChild("futurewp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp").addChild("Xfwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp").addChild("Yfwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp").addChild("Zfwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp").addChild("coursefwp");
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp/Xfwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp/Yfwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp/Zfwp").setValue(0.0);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/futurewp/coursefwp").setValue(0.0);

	
	# Create the branches of the control
	mage.getNode("player/GNC/Control").addChild("aileron");
	mage.getNode("player/GNC/Control/aileron").setValue(0.0);
	mage.getNode("player/GNC/Control").addChild("elevator");
	mage.getNode("player/GNC/Control/elevator").setValue(0.0);
	mage.getNode("player/GNC/Control").addChild("rudder");
	mage.getNode("player/GNC/Control/rudder").setValue(0.0);
	mage.getNode("player/GNC/Control").addChild("throttle");
	mage.getNode("player/GNC/Control/throttle").setValue(0.0);

	# Create the instrumentations branches
	mage.getNode("player/Instrumentation").addChild("radar");
	mage.getNode("player/Instrumentation/radar").addChild("detect");
	mage.getNode("player/Instrumentation/radar").addChild("threat");

	# need to agree on a protocol before hand 
	mage.getNode("player/Communications").addChild("radio");	
	mage.getNode("player/Communications/radio").addChild("send_msg"); # sends in string message packets
	mage.getNode("player/Communications/radio").addChildren("recv_channel",19); # receives in string msg packets	from max of 20 aircrafts	 

	foreach(var S; mage.getNode("player/Communications/radio").getChildren()){
		S.setValue("");
	}

	# Create 20 leafs in "sim/multiplay/generic". 
	props.globals.getNode("sim/multiplay/generic").addChildren("string",20); # only 20 are communicated within FG MP
	foreach(var S; props.globals.getNode("sim/multiplay/generic").getChildren()){
		S.setValue("");
	}


	var mage_list = {}; # list containing the neighbors in vicinity
	index = 0;
	foreach (var mp_aircraft; props.globals.getNode("/ai/models").getChildren("multiplayer"))
	{	
		# get friendly aircrafts
		var callsign = mp_aircraft.getNode("callsign").getValue();
		if (callsign[0] == 77 and callsign[1] == 65 and callsign[2] == 71 and callsign[3] == 69 and callsign[4] == 70)
		{	
			mage_list[index] = mp_aircraft;	
			index = index  +1;	
		}		
		
	}
	
	foreach ( var node_n; keys(mage_list))
	{	#print(mage_list[node_n].getNode("callsign").getValue());
		var props = {callsign: mage_list[node_n].getNode("callsign").getValue(), id: mage_list[node_n].getNode("id").getValue()}; # model: mage_list[node_n].getNode("model-short").getValue(),
		
		var air_node = mage.getNode("Team").addChild("aircraft");
		air_node.setValues(props);

	}

	return mage;

}

var mage_update = func{
	props.globals.getNode("/controls/flight/aileron").setValue(mage.getNode("player/GNC/Control/aileron").getValue());
	props.globals.getNode("/controls/flight/elevator").setValue(mage.getNode("player/GNC/Control/elevator").getValue());
	props.globals.getNode("/controls/flight/rudder").setValue(mage.getNode("player/GNC/Control/rudder").getValue());
	props.globals.getNode("/controls/engines/engine[0]/throttle").setValue(mage.getNode("player/GNC/Control/throttle").getValue());


	mage.getNode("player/GNC/Navigation/IMU/latitude-deg").setValue(props.globals.getNode("/position/latitude-deg").getValue());
	mage.getNode("player/GNC/Navigation/IMU/longitude-deg").setValue(props.globals.getNode("/position/longitude-deg").getValue());
	mage.getNode("player/GNC/Navigation/IMU/altitude-m").setValue(props.globals.getNode("/position/altitude-ft").getValue()*0.3048);

	mage.getNode("player/GNC/Navigation/IMU/V_n-ms").setValue(props.globals.getNode("/velocities/speed-north-fps").getValue()*0.3048);
	mage.getNode("player/GNC/Navigation/IMU/V_e-ms").setValue(props.globals.getNode("/velocities/speed-east-fps").getValue()*0.3048);
	mage.getNode("player/GNC/Navigation/IMU/V_d-ms").setValue(props.globals.getNode("/velocities/speed-down-fps").getValue()*0.3048);
	mage.getNode("player/GNC/Navigation/IMU/u").setValue(props.globals.getNode("/velocities/uBody-fps").getValue()*0.3048);
	mage.getNode("player/GNC/Navigation/IMU/v").setValue(props.globals.getNode("/velocities/vBody-fps").getValue()*0.3048);
	mage.getNode("player/GNC/Navigation/IMU/w").setValue(props.globals.getNode("/velocities/wBody-fps").getValue()*0.3048);
	var vel_north = props.globals.getNode("/velocities/speed-north-fps").getValue()*0.3048;
	var vel_east = props.globals.getNode("/velocities/speed-east-fps").getValue()*0.3048;
	var X = math.atan2(vel_east,vel_north);
	if(X > 2*math.pi){
		X = X - 2*math.pi;
	}
	if(X<0){
		X = 2*math.pi + X;
	} 
	
	mage.getNode("player/GNC/Navigation/IMU/course").setValue(X);
	mage.getNode("player/GNC/Navigation/IMU/V-airspeed").setValue(props.globals.getNode("/velocities/airspeed-kt").getValue()*0.51444);

	mage.getNode("player/GNC/Navigation/IMU/roll-deg").setValue(props.globals.getNode("/orientation/roll-deg").getValue());
	mage.getNode("player/GNC/Navigation/IMU/pitch-deg").setValue(props.globals.getNode("/orientation/pitch-deg").getValue());
	mage.getNode("player/GNC/Navigation/IMU/yaw-deg").setValue(props.globals.getNode("/orientation/heading-deg").getValue());
	mage.getNode("player/GNC/Navigation/IMU/roll-rate-degps").setValue(props.globals.getNode("/orientation/roll-rate-degps").getValue());
	mage.getNode("player/GNC/Navigation/IMU/pitch-rate-degps").setValue(props.globals.getNode("/orientation/pitch-rate-degps").getValue());
	mage.getNode("player/GNC/Navigation/IMU/yaw-rate-degps").setValue(props.globals.getNode("/orientation/yaw-rate-degps").getValue());
	mage.getNode("player/GNC/Navigation/IMU/p-body").setValue(props.globals.getNode("/orientation/p-body").getValue());
	mage.getNode("player/GNC/Navigation/IMU/q-body").setValue(props.globals.getNode("/orientation/q-body").getValue());
	mage.getNode("player/GNC/Navigation/IMU/r-body").setValue(props.globals.getNode("/orientation/r-body").getValue());
	
settimer(func{mage_update(mage);},0.01);

}


var fradar = func {

	# get the lat-long of the sensing aircraft and assign it as center
	var center_lat = props.globals.getNode("/position/latitude-deg").getValue();
	var center_long = props.globals.getNode("/position/longitude-deg").getValue();
	
	var threat = 0;
	var detect = 0;
	setprop("mage/player/Instrumentation/radar/detect",detect);
	props.globals.getNode("mage/player/Instrumentation/radar/detect").setBoolValue(0);

	# Iterate over all ai aircrafts 	
	foreach (var ai_aircraft; props.globals.getNode("/ai/models").getChildren("aircraft"))
 	{	# the callsign must contain "MAGE" as first four characters and H as the 6th char

	    	var callsign = ai_aircraft.getNode("callsign").getValue();
	
		# Check if this aircrafts is a MAGE hostile
		if (callsign[0] == 77 and callsign[1] == 65 and callsign[2] == 71 and callsign[3] == 69 and callsign[5] == 72) #MAGEH
		{
		
		# get the aircraft position
	
			var ai_threat_lat = ai_aircraft.getNode("position/latitude-deg").getValue();
			var ai_threat_long = ai_aircraft.getNode("position/longitude-deg").getValue();	
	
		# Very crude calculation 
			var diff_lat = math.abs(ai_threat_lat - center_lat);
			var diff_long = math.abs(ai_threat_long - center_long);
	
	
			if (diff_lat < 0.03 and diff_long < 0.03){
				props.globals.getNode("mage/radar/detect").setBoolValue(1);
				# create values for mage subsystem	
				threat = threat + 1;
				}
		}
	}
	
	setprop("mage/player/Instrumentation/radar/threat",threat);
settimer(fradar,0.01);
}


var transponder = func {	
	# get the lat-long of the sensing aircraft and assign it as center
	var center_lat = props.globals.getNode("/position/latitude-deg").getValue();
	var center_long = props.globals.getNode("/position/longitude-deg").getValue();
	
	var neigh_list = {}; # list containing the neighbors in vicinity
	var nindex = 0; # index of neighbors
	

	foreach (var mp_aircraft; props.globals.getNode("/ai/models").getChildren("multiplayer"))
	{	
		# get friendly aircrafts
		var callsign = mp_aircraft.getNode("callsign").getValue();
		if (callsign[0] == 77 and callsign[1] == 65 and callsign[2] == 71 and callsign[3] == 69 and callsign[4] == 70) #MAGEF
		{

			# get the aircraft position
			
			var ai_lat = mp_aircraft.getNode("position/latitude-deg").getValue();
			var ai_long = mp_aircraft.getNode("position/longitude-deg").getValue();	
	
			# Very crude calculation 
			var diff_lat = math.abs(ai_lat - center_lat);
			var diff_long = math.abs(ai_long - center_long);

			if (diff_lat < 1.5 and diff_long < 3){
				
				neigh_list[nindex] = mp_aircraft;
				nindex = nindex + 1;
				}
			
		}
		
		}

	
	# Broadcast message	
	# print(mage.getNode("Communications/radio/send_msg").getValue());
	props.globals.getNode("sim/multiplay/transmission-freq-hz").setValue(mage.getNode("player/Communications/radio/send_msg").getValue());	

	# get the list of friendly neighbors and communicate with them
	loop_index = 0;	
	foreach (var node_neigh; keys(neigh_list))
	{	# get the msg from neighbor aircraft and store in sensor/radio location
		if(loop_index < 20){	
		mage.getNode("player/Communications/radio").getChild("recv_channel",index=loop_index).setValue(neigh_list[node_neigh].getNode("sim/multiplay/transmission-freq-hz").getValue());		
			
			loop_index = loop_index + 1;
		}
	}
	
settimer(transponder,0.01);
}



# ============================ Initialization Calls ========================== #
mage = mage_init();

setlistener("sim/signals/fdm-initialized",mage_update);

setlistener("/sim/signals/fdm-initialized",fradar);
setlistener("/sim/signals/fdm-initialized",transponder);
print ("MultiAgent Game System initialized");
