#!/usr/bin/env python

"""
ModuleName: RosUavInterface.py
Author : Rakshit Allamraju

This is an interface module which runs the exchange between FG, control, and Human Operator.
This module creates a ROS node called 'ROSUAVINTERFACE_<uav_callsign>' and publishes to Sensor_data_<UAV_callsign> topic. It subscribes to 
Command_data_<UAV_callsign> topics.
"""

# python standard libraries
import os,sys
import socket
from numpy import loadtxt

# Dependencies
import rospy
from mage.msg import command_data, sensor_data

# Global variables
global IP, PORT_WRITE, PORT_READ, SOCK_READ, SOCK_WRITE
global GLOBAL_HOME_LAT, GLOBAL_HOME_LONG, GLOBAL_HOME_ALT

def ROSUAV_main(argv):

	# Global variables
	global IP, PORT_WRITE, PORT_READ, SOCK_READ, SOCK_WRITE	
	global GLOBAL_HOME_LAT,GLOBAL_HOME_LONG,GLOBAL_HOME_ALT

	IP = argv[0]
	PORT_READ = int(argv[1])
	PORT_WRITE = int(argv[2])
	UAV_callsign = argv[3] 
	GLOBAL_HOME_LAT = float(argv[4])
	GLOBAL_HOME_LONG = float(argv[5])
	GLOBAL_HOME_ALT = float(argv[6])
	FG_event = argv[8]

 	
	#Create the sockets to exchange data with flightgear
	SOCK_READ = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # socket: get data from FG
	SOCK_WRITE = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # socket: send data to FG

	# Ping google.com to obtain host computer IP 
	try:
		s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		s.connect(("google.com",80))
		SYS_IP = s.getsockname()[0]
		s.close()
	except:
		print "Network connection unavailable..."
		sys.exit(-1)


	SOCK_READ.bind((SYS_IP,PORT_READ)) # Bind the socket to read data	

	#  Create the ROS node
	Node_name = 'ROSUAVINTERFACE_'+UAV_callsign
	rospy.init_node(Node_name, anonymous=True)
	rate = rospy.Rate(100)
	
	#Create the Publisher for the respective Ros topic   ### check to ensure queue_size is optimal
	Pub_Topic_name = 'Sensor_data_'+UAV_callsign
	uav_pub = rospy.Publisher(Pub_Topic_name,sensor_data,queue_size=10)  
	# ROS Message type
	Sensor = sensor_data()

	Sub_Topic_name = 'Command_data_'+UAV_callsign ### MAKE SURE TO PASS UAV_callsign AS ARG TO FNC
	sub=rospy.Subscriber(Sub_Topic_name, command_data,SendFG,queue_size=10)# subscribe to topic 'Command_data'
	while not rospy.is_shutdown():
		
		data, addr = SOCK_READ.recvfrom(1024) # get data from fg
		if not FG_event.is_set():
			FG_event.set() # flag which signals to other processes that sensor data is being received
		message = data.split('\t')
		fg_data = map(float,message)
		
		# Create the ROS msg
		Sensor.Pos_n = fg_data[0]
		Sensor.Pos_e = fg_data[1]
		Sensor.Pos_d = fg_data[2]
		Sensor.V_n_ms = fg_data[3]
		Sensor.V_e_ms = fg_data[4]
		Sensor.V_d_ms = fg_data[5]
		Sensor.u = fg_data[6]
		Sensor.v = fg_data[7]
		Sensor.w = fg_data[8]
		Sensor.roll_deg = fg_data[9]
		Sensor.pitch_deg = fg_data[10]
		Sensor.yaw_deg = fg_data[11]
		Sensor.p_body = fg_data[12]
		Sensor.q_body = fg_data[13]
		Sensor.r_body = fg_data[14]
		Sensor.V_airspeed = fg_data[15]
		Sensor.course = fg_data[16]
		Sensor.lat_deg = fg_data[17]
		Sensor.long_deg = fg_data[18]
		Sensor.alt_m = fg_data[19]
		Sensor.ki_x = fg_data[20]
		Sensor.ki_y = fg_data[21]
		Sensor.ki_z = fg_data[22]
		
		# roslog the data
		# rospy.loginfo(Sensor)
		# publish to topic Sensor_data	
		uav_pub.publish(Sensor) 	
		rate.sleep()
	
	sub.unregister() # unsubscribe to 'Command_data' topic

	# Shutdown node
	err_str = "Shutting down node "+Node_name
	rospy.signal_shutdown(err_str)


def SendFG(Commands):
	# Parse command data from topic and generate UDP message
	command_list = [str(Commands.aileron), str(Commands.elevator), str(Commands.rudder),str(Commands.throttle),str(GLOBAL_HOME_LAT),str(GLOBAL_HOME_LONG),str(GLOBAL_HOME_ALT)]	
	commands_msg = '\t'.join(command_list)+'\n'	
		
	# Send data to FG via UDP	
	SOCK_WRITE.sendto(commands_msg, (IP,PORT_WRITE))	




	
