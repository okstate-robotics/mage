#!/usr/bin/env python

"""
ModuleName: ROSGC.py
Author: Rakshit Allamraju

This module subscribes to the 'Sensor_data' and 'Navigation data' topics, generates the commands to guide the autonomous UAV and publishes 
to the topic 'Command_data'. 
"""

# python standard libraries
import os,sys
import socket
from numpy import loadtxt
from math import pi
from time import sleep
# Dependencies
import rospy
from mage.msg import command_data, sensor_data
from mage.srv import *
from GClibs import *

# Global variables
global c_out
global UAV_callsign
c_out = [0.0,0.0,0.0,0.0]

class UAV:
	def __init__(self):
		pass

	"""
	Subscriber callback which initializes the guidance and control definitions and stores them as global . Call is only performed once to avoid reinitialization
	of the definitions
	"""
	def UAV_init(self,Sensor):
		# Global variables			
		#global Ps, Pe
		global c_out
		global uav_sub_once
		# Read data from text file
		read = ['k_path','k_orbit','kp_phi','ki_phi','kd_phi','kp_t','ki_t','kd_t','kp_psi','ki_psi','kd_psi','kp_v','ki_v','kd_v','kp_alt','ki_alt','kd_alt','kp_x','ki_x','kd_x','dt','R']
		f = open('config.txt','r')

		data = {}
		counter = 0
		# read data from config file and store them in a dict struct called data
		for line in f:
			line = line.strip()
			columns = line.split()
			value = columns[1]
			data[read[counter]] = float(value)
			counter += 1
	
	
		# Assign the Gain matrices	
		K_P = [data['kp_phi'],data['kp_t'],data['kp_psi'],data['kp_v'],data['kp_alt'],data['kp_x']]
		K_I = [data['ki_phi'],data['ki_t'],data['ki_psi'],data['ki_v'],data['ki_alt'],data['ki_x']]
		K_D = [data['kd_phi'],data['kd_t'],data['kd_psi'],data['kd_v'],data['kd_alt'],data['kd_x']]
	
		# Assign the path parameters
		k_path = data['k_path']
		k_orbit = data['k_orbit']

		# Timestep
		dt = data['dt']
		# Radius of path
		self.R = data['R']
		# Home
		k_i = array([ [Sensor.ki_x], [Sensor.ki_y], [Sensor.ki_z] ])

		self.gs = Guidance(k_path,k_orbit,k_i) # Guidance instance
		self.cs = Controller(K_P,K_I,K_D,dt) # Controller instance
		
		# Initial start and end waypoint
		self.Ps = array([[0],[0],[1200],[45*pi/180]])
		self.Pe = array([[1500],[1500],[1250],[45*pi/180]])
	
		# initial controller signal
		c_out = [0.0,0.0,0.0,0.0]
		uav_sub_once.unregister() # unregister from UAV_init definitions
		print UAV_callsign +":Completed Guidance init ..."


	"""
	Main callback function which generates the UAV commands. This function is infinitely called until the node shutdown is invoked.
	"""

	def UAV_Run(self,Sensor):	
		# Global variables	
		global c_out
		
		# get position data from sensor_data topic
		p = array([ [Sensor.Pos_n],[Sensor.Pos_e],[Sensor.Pos_d] ]) # NED position
		p_LLA = array([ [Sensor.lat_deg],[Sensor.long_deg],[Sensor.alt_m] ]) # LLA global position, Sensor.alt_m is +ve opposite of the sign of D in NED coordinates
		# get course data from sensor_data topic
		X = Sensor.course

		# If completed waypoints, get a new one from Navigation_data service		
		if self.gs.wp_complete==True:
			Service_name_nav = 'Nav_data_'+UAV_callsign
			rospy.wait_for_service(Service_name_nav)
	
			p_temp= p_LLA.tolist()			
			
			try:	
				get_data = rospy.ServiceProxy(Service_name_nav,navigation_data)	
				
				WP_resp = get_data(p_temp[0][0],p_temp[1][0],p_temp[2][0]) #passing LLA not NED
				#self.Ps = self.Pe #Last Wp #array([[WP_resp.Ps_x],[WP_resp.Ps_y],[WP_resp.Ps_z],[298*pi/180]]) # not a prob now since Ps takes previous Pe values..but fix later
				self.Ps = array([[Sensor.Pos_n],[Sensor.Pos_e],[Sensor.alt_m],[45*pi/180]]) #take current position as the origin of the path..using ground altitude instead of 'd' from global-local ned
				self.Pe = array([[WP_resp.Pe_x],[WP_resp.Pe_y],[WP_resp.Pe_z],[WP_resp.Pe_course]])	#return is in NED	
				print "Origin: ",self.Ps
				print "Destination: ",self.Pe		
			except rospy.ServiceException, e:
				print "Service call failed: %s" %e

		#check if new wps are generated
		self.gs.set_wp(self.Ps,self.Pe)		
		dub_out = self.gs.WPPDubins(p,self.R) # generate the guidance params
		
		if dub_out == None:
			pass
		else:
			REGIME = 1#int(fg_data[28])
			if REGIME == 1:
				if dub_out[0] == 1: # follow straight line
					g_out = self.gs.stline(dub_out[1],dub_out[2],p,X)			
				elif dub_out[0] == 2: # follow orbit
					g_out = self.gs.orbit(dub_out[3],p,X,dub_out[4],dub_out[5])
			elif REGIME == 0:
				if dub_out[0] == 1: # follow straight line
					g_out = self.gs.stline(dub_out[1],dub_out[2],p,X)	
					print 'St line'		
				elif dub_out[0] == 2: # follow orbit
					g_out = self.gs.orbit(dub_out[3],p,X,dub_out[4],dub_out[5])
					print 'orbit'
			
			h_c = g_out[0] #get the commanded height
			X_c = g_out[1] # get commanded course
			V_c = 60 # commanded velocity # Find how to input later
			
			# Sensor data to pass to controller	
			#sensor_in = [Sensor.Pos_n,Sensor.Pos_e,Sensor.Pos_d,Sensor.V_n_ms,Sensor.V_e_ms,Sensor.V_d_ms,Sensor.roll_deg,Sensor.pitch_deg,Sensor.yaw_deg,Sensor.p_body,Sensor.q_body,Sensor.r_body,Sensor.V_airspeed,Sensor.course]
			# USING LOCAL GROUND ALTITUDE INSTEAD OF GLOBAL LOCAL-NED FRAME FOR ALTITUDE HOLD CALCULATIONS
			sensor_in = [Sensor.Pos_n,Sensor.Pos_e,-1*Sensor.alt_m,Sensor.V_n_ms,Sensor.V_e_ms,Sensor.V_d_ms,Sensor.roll_deg,Sensor.pitch_deg,Sensor.yaw_deg,Sensor.p_body,Sensor.q_body,Sensor.r_body,Sensor.V_airspeed,Sensor.course]
			
			c_out = self.cs.control(sensor_in,h_c[0],X_c,V_c,state=REGIME) # get the controller commands to pass to FG

		
	
	"""
	Get the new initial and final waypoints
	"""
	def GetNav(self,Nav_data):
		#global Ps, Pe
		self.Ps = array([ [Nav_data.Ps_x],[Nav_data.Ps_y],[Nav_data.Ps_z],[Nav_data.Ps_course] ])
		self.Pe = array([ [Nav_data.Pe_x],[Nav_data.Pe_y],[Nav_data.Pe_z],[Nav_data.Pe_course] ])


def GC_main(argv):
	#global K_P, K_I, K_D, k_path, k_orbit, dt, R, k_i, gs, cs
	#global Ps, Pe
	global c_out	
	global UAV_callsign
	global uav_sub_once

	uav = UAV()
	
	if not isinstance(argv[3], str):
		print "Input Argument defining UAV callsign must be a string"
		print "Exiting control ..."
		sys.exit(-1)
	else:
		UAV_callsign = argv[3]
	
	
	# Create and Initialize the GC node
	Node_name = 'ROSGC_'+UAV_callsign
	rospy.init_node(Node_name, anonymous=True)
	rate = rospy.Rate(100) # Publish at 100 hz

	# Wait for signal from UAVinterface process
	FG_event = argv[8]
	FG_event.wait()
	print UAV_callsign +":FG link established...waiting for navigation process"
	sleep(2)
	# wait for signal from Nav process
	Nav_event = argv[9]	
	Nav_event.wait()
	print UAV_callsign +":Navigation process running...started guidance process"
	sleep(2)

	# Create the publisher instance to push data to Command_data topic
	Pub_Topic_name = 'Command_data_'+UAV_callsign 
	uav_pub = rospy.Publisher(Pub_Topic_name,command_data,queue_size=10)
	Commands = command_data() # message type

	# Create the subscriber to get data from Sensor_data topic
	Sub_Topic_name = 'Sensor_data_'+UAV_callsign  
	uav_sub_once=rospy.Subscriber(Sub_Topic_name, sensor_data, uav.UAV_init,queue_size=5) # Get data from Sensor_data topic and initialize the definitions
	sleep(5) 		
	Sub_Topic_name = 'Sensor_data_'+UAV_callsign  ### MAKE SURE TO PASS UAV_callsign AS AN ARG TO THE FNC
	uav_sub=rospy.Subscriber(Sub_Topic_name, sensor_data, uav.UAV_Run,queue_size=5) # Get data from Sensor_data topic and execute the guidance & control loop
	print UAV_callsign +":All systems Running \n"
	
	while not rospy.is_shutdown():
		# Create the ROS message
		Commands.aileron = c_out[1]
		Commands.elevator = c_out[2]
		Commands.rudder = c_out[3]
		Commands.throttle = c_out[0]
		Commands.reached = 0#;int(uav.gs.wp_complete)

		# roslog the commands
		# rospy.loginfo(Commands)
		# publish to Command_data topic
		uav_pub.publish(Commands)
		rate.sleep()

	print "Command publishing terminated..."
	#rospy.spin() # To prevent exiting main loop
	uav_sub.unregister()

	# Shutdown node
	err_str = "Shutting down node "+Node_name
	rospy.signal_shutdown(err_str)
	#print "Process shutdown"
	


	
