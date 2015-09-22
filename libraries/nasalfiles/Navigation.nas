# Nasal script to create a mage node in flightgear from each aircraft. Note this script is using basic functions from Nasal and it might not be optimized.

# ======================================================================== #
#                     MULTIAGENT GAME ENVIRONMENT                          #
#                             M  A  G  E                                   #
# ======================================================================== #

# ========================================================================= #
#                         Navigation Calls				    #
# ========================================================================= #

# ======================================================================= #
#                   Author : Rakshit Dayal                                #
# ======================================================================= #

var Nav_init = func{
	a = 6378137; # Semi-major
	b = 6356752.3142; #Semi-minor

	alpha = props.globals.getNode("/position/latitude-deg").getValue();
	omega = props.globals.getNode("/position/longitude-deg").getValue();
	h = props.globals.getNode("/position/altitude-ft").getValue();	

	alpha = alpha*math.pi/180; # convert to radian
	omega = omega*math.pi/180; # convert to radian
	h = h*0.3048; # convert to meter

	D1 = math.sqrt(math.cos(alpha)*math.cos(alpha) + (b/a)*(b/a)*math.sin(alpha)*math.sin(alpha));
	D2 = math.sqrt((a/b)*(a/b)*math.cos(alpha)*math.cos(alpha) + math.sin(alpha)*math.sin(alpha));

	X0 = (a/D1 + h)*math.cos(alpha)*math.cos(omega);
	Y0 = (a/D1 + h)*math.cos(alpha)*math.sin(omega);
	Z0 = (b/D2 + h)*math.sin(alpha);

	N0 = [0,0,1];
	E0 = [0,1,0];
	D0 = [-1,0,0];

	R_N0 = Rot_matrix(omega,N0[0],N0[1],N0[2]);
	N1 = [R_N0[0][0]*N0[0]+R_N0[0][1]*N0[1]+R_N0[0][2]*N0[2],R_N0[1][0]*N0[0]+R_N0[1][1]*N0[1]+R_N0[1][2]*N0[2],R_N0[2][0]*N0[0]+R_N0[2][1]*N0[1]+R_N0[2][2]*N0[2]];
	E1 = [R_N0[0][0]*E0[0]+R_N0[0][1]*E0[1]+R_N0[0][2]*E0[2],R_N0[1][0]*E0[0]+R_N0[1][1]*E0[1]+R_N0[1][2]*E0[2],R_N0[2][0]*E0[0]+R_N0[2][1]*E0[1]+R_N0[2][2]*E0[2]];
	D1 = [R_N0[0][0]*D0[0]+R_N0[0][1]*D0[1]+R_N0[0][2]*D0[2],R_N0[1][0]*D0[0]+R_N0[1][1]*D0[1]+R_N0[1][2]*D0[2],R_N0[2][0]*D0[0]+R_N0[2][1]*D0[1]+R_N0[2][2]*D0[2]];
	
	Neg_E1 = [-1*E1[0],-1*E1[1],-1*E1[2]];

	R_E1 = Rot_matrix(alpha,Neg_E1[0], Neg_E1[1], Neg_E1[2]);
	N = [R_E1[0][0]*N1[0]+R_E1[0][1]*N1[1]+R_E1[0][2]*N1[2],R_E1[1][0]*N1[0]+R_E1[1][1]*N1[1]+R_E1[1][2]*N1[2],R_E1[2][0]*N1[0]+R_E1[2][1]*N1[1]+R_E1[2][2]*N1[2]];
	E = [R_E1[0][0]*E1[0]+R_E1[0][1]*E1[1]+R_E1[0][2]*E1[2],R_E1[1][0]*E1[0]+R_E1[1][1]*E1[1]+R_E1[1][2]*E1[2],R_E1[2][0]*E1[0]+R_E1[2][1]*E1[1]+R_E1[2][2]*E1[2]];
	D = [R_E1[0][0]*D1[0]+R_E1[0][1]*D1[1]+R_E1[0][2]*D1[2],R_E1[1][0]*D1[0]+R_E1[1][1]*D1[1]+R_E1[1][2]*D1[2],R_E1[2][0]*D1[0]+R_E1[2][1]*D1[1]+R_E1[2][2]*D1[2]];

	Nav_data = [N[0],N[1],N[2],E[0],E[1],E[2],D[0],D[1],D[2],X0,Y0,Z0];
	return Nav_data;

};

var Nav = func{

	a = 6378137; # Semi-major
	b = 6356752.3142; #Semi-minor

	alpha = props.globals.getNode("/position/latitude-deg").getValue();
	omega = props.globals.getNode("/position/longitude-deg").getValue();
	h = props.globals.getNode("/position/altitude-ft").getValue();	

	alpha = alpha*math.pi/180; # convert to radian
	omega = omega*math.pi/180; # convert to radian
	h = h*0.3048; # convert to meter
	
	D1 = math.sqrt(math.cos(alpha)*math.cos(alpha) + (b/a)*(b/a)*math.sin(alpha)*math.sin(alpha));
	D2 = math.sqrt((a/b)*(a/b)*math.cos(alpha)*math.cos(alpha) + math.sin(alpha)*math.sin(alpha));

	X = (a/D1 + h)*math.cos(alpha)*math.cos(omega);
	Y = (a/D1 + h)*math.cos(alpha)*math.sin(omega);
	Z = (b/D2 + h)*math.sin(alpha);

	Pos_n = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[0],Nav_data[1],Nav_data[2]]);
	Pos_e = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[3],Nav_data[4],Nav_data[5]]);
	Pos_d = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[6],Nav_data[7],Nav_data[8]]);

	props.globals.getNode("/mage/player/GNC/Navigation/IMU/Pos_n").setValue(Pos_n);
	props.globals.getNode("/mage/player/GNC/Navigation/IMU/Pos_e").setValue(Pos_e);
	props.globals.getNode("/mage/player/GNC/Navigation/IMU/Pos_d").setValue(Pos_d);
	props.globals.getNode("/mage/player/GNC/Navigation/Navdata/ki/ki_x").setValue(Nav_data[6]);
	props.globals.getNode("/mage/player/GNC/Navigation/Navdata/ki/ki_y").setValue(Nav_data[7]);
	props.globals.getNode("/mage/player/GNC/Navigation/Navdata/ki/ki_z").setValue(Nav_data[8]);
	
	
settimer(Nav,0.01);
};

var WP_set = func{

	a = 6378137; # Semi-major
	b = 6356752.3142; #Semi-minor
	
	alpha1 = props.globals.getNode("/mage/player/GNC/Guidance/Pathplan/waypoints/lastwp/latlwp-deg").getValue();
	omega1 = props.globals.getNode("/mage/player/GNC/Guidance/Pathplan/waypoints/lastwp/lonlwp-deg").getValue();
	h1 = props.globals.getNode("/mage/player/GNC/Guidance/Pathplan/waypoints/lastwp/altlwp-m").getValue();	

	alpha1 = alpha1*math.pi/180; # convert to radian
	omega1 = omega1*math.pi/180; # convert to radian
	#h1 = h*0.3048; # convert to meter
	
	D1 = math.sqrt(math.cos(alpha1)*math.cos(alpha1) + (b/a)*(b/a)*math.sin(alpha1)*math.sin(alpha1));
	D2 = math.sqrt((a/b)*(a/b)*math.cos(alpha1)*math.cos(alpha1) + math.sin(alpha1)*math.sin(alpha1));

	X = (a/D1 + h1)*math.cos(alpha1)*math.cos(omega1);
	Y = (a/D1 + h1)*math.cos(alpha1)*math.sin(omega1);
	Z = (b/D2 + h1)*math.sin(alpha1);

	Pos_n = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[0],Nav_data[1],Nav_data[2]]);
	Pos_e = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[3],Nav_data[4],Nav_data[5]]);
	Pos_d = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[6],Nav_data[7],Nav_data[8]]);

	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/Xlwp").setValue(Pos_n);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/Ylwp").setValue(Pos_e);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/lastwp/Zlwp").setValue(Pos_d);

	alpha2 = props.globals.getNode("/mage/player/GNC/Guidance/Pathplan/waypoints/currentwp/latcwp-deg").getValue();
	omega2 = props.globals.getNode("/mage/player/GNC/Guidance/Pathplan/waypoints/currentwp/loncwp-deg").getValue();
	h2 = props.globals.getNode("/mage/player/GNC/Guidance/Pathplan/waypoints/currentwp/altcwp-m").getValue();	

	alpha2 = alpha2*math.pi/180; # convert to radian
	omega2 = omega2*math.pi/180; # convert to radian

	D1 = math.sqrt(math.cos(alpha2)*math.cos(alpha2) + (b/a)*(b/a)*math.sin(alpha2)*math.sin(alpha2));
	D2 = math.sqrt((a/b)*(a/b)*math.cos(alpha2)*math.cos(alpha2) + math.sin(alpha2)*math.sin(alpha2));

	X = (a/D1 + h2)*math.cos(alpha2)*math.cos(omega2);
	Y = (a/D1 + h2)*math.cos(alpha2)*math.sin(omega2);
	Z = (b/D2 + h2)*math.sin(alpha2);

	Pos_n = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[0],Nav_data[1],Nav_data[2]]);
	Pos_e = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[3],Nav_data[4],Nav_data[5]]);
	Pos_d = dot([X-Nav_data[9], Y-Nav_data[10], Z-Nav_data[11]], [Nav_data[6],Nav_data[7],Nav_data[8]]);
	
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/Xcwp").setValue(Pos_n);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/Ycwp").setValue(Pos_e);
	mage.getNode("player/GNC/Guidance/Pathplan/waypoints/currentwp/Zcwp").setValue(Pos_d);
	
	
settimer(WP_set,0.01);
};


var dot = func(A,B){

	C = A[0]*B[0] + A[1]*B[1] + A[2]*B[2];
	return C;
};

var Rot_matrix = func(theta,n1,n2,n3){

	a11 = (1-math.cos(theta))*n1*n1 + math.cos(theta);
	a12 = (1-math.cos(theta))*n1*n2 - math.sin(theta)*n3;
	a13 = (1-math.cos(theta))*n1*n3 + math.sin(theta)*n2;

	a21 = (1-math.cos(theta))*n2*n1 + math.sin(theta)*n3;
	a22 = (1-math.cos(theta))*n2*n2 + math.cos(theta) ;
	a23 = (1-math.cos(theta))*n2*n3 - math.sin(theta)*n1;

	a31 = (1-math.cos(theta))*n3*n1 - math.sin(theta)*n2 ;
	a32 = (1-math.cos(theta))*n3*n2 + math.sin(theta)*n1 ;
	a33 = (1-math.cos(theta))*n3*n3 + math.cos(theta);

	R = [[a11,a12,a13],[a21,a22,a23],[a31,a32,a33]];

	return R;

};

Nav_data = setlistener("sim/signals/fdm-initialized",Nav_init);
setlistener("sim/signals/fdm-initialized",Nav);
setlistener("sim/signals/fdm-initialized",WP_set);
