#!/usr/bin/env python

"""
ModuleName: RosLaunch.py
Author : Rakshit Allamraju

Module launches all rosnodes of a single UAV for all instances of UAVs
"""

# python standard libraries
import os,sys
import socket
from numpy import loadtxt
from multiprocessing import Process, Event
from time import sleep

# Dependencies
import rospy
import RosUavInterface, RosGC, ROSNav_Plan
from FgLibs import *
from mage.msg import command_data, sensor_data

# DEFINTIONS
# GLOBAL LATITUDE, LONGITUDE AND ALTITUDE
GLOBAL_HOME_LAT = 37.67
GLOBAL_HOME_LONG = -122.35
GLOBAL_HOME_ALT = 0.0

# Network model
import NETWORK
Network_model = NETWORK.Network_model
#Network_model = {}
#Network_model['MAGEF11'] = ['MAGEF12','MAGEF13']
#Network_model['MAGEF12'] = ['MAGEF11','MAGEF13']
#Network_model['MAGEF13'] = ['MAGEF11','MAGEF12']



def main():
	os.system("export ROS_MASTER_URI=http://Daslab-P1:11311") # Set the ros master ##future input
	instances = 3 # set the number of instances needed to launch ## future input
	server_id = 1 # set the server ID ##future input
	IP = "139.78.79.44" # IP address of computer launching the FG visual head ## future input
	#launch_delay = 300 # 300 seconds delay
	
	jobs_ros = []
	for instance in xrange(1,instances+1):
		
		# Create an event to signal that sensor data is being received from FG
		FG_event = Event()				
		# create an event to signal that navigation data is being serviced
		Nav_event = Event()

		# callback getting the information needed for label and connecting to the right UAV address on visual hed
		Instance_info = getid(server_id,instance) 

		callsign = Instance_info['callsign']  
		command_port = Instance_info['command_port']
		sensor_port = Instance_info['sensor_port']
		argv = (IP,sensor_port,command_port,callsign,GLOBAL_HOME_LAT,GLOBAL_HOME_LONG,GLOBAL_HOME_ALT,Network_model[callsign],FG_event,Nav_event) # input arguments for uav instance
		
		# Run the uav interface to start publishing sensor data
		ros_uavinterface = Process(target = RosUavInterface.ROSUAV_main, args = (argv,)) # launch a parallel process calling the FG-Control interface
		jobs_ros.append(ros_uavinterface)
		ros_uavinterface.start()
		sleep(1)
		
		#starts the navigation and model data service
		ros_nav = Process(target = ROSNav_Plan.NAV_main, args = (argv,)) # parallel process calling the planning and navigation process
		jobs_ros.append(ros_nav)
		ros_nav.start()
		sleep(1)
		
		# start publishing command data
		ros_gc = Process(target = RosGC.GC_main, args = (argv,)) # parallel process launching the guidance and control process
		jobs_ros.append(ros_gc)
		ros_gc.start()
		sleep(1)
		
		print "Started ROS Instance %d..." %instance
		#fg_delay = 33 +launch_delay
		#sleep(fg_delay) # This time should be equal to the delay time set in fg visual head
		sleep(20)
		
		

	print "Init complete..."

if __name__ == '__main__':
	main()
