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
from multiprocessing import Process
from time import sleep

# Dependencies
import rospy
import RosUavInterface, RosGC, ROSNav_Plan
from FgLibs import *
from mage.msg import command_data, sensor_data

# DEFINTIONS
GLOBAL_HOME_LAT = 37.67
GLOBAL_HOME_LONG = -122.35
GLOBAL_HOME_ALT = 0.0


def main():
	os.system("export ROS_MASTER_URI=http://Daslab-P1:11311")
	instances = 1
	server_id = 0
	IP = "139.78.79.44"
	
	jobs_ros = []
	for instance in xrange(1,instances+1):
		Instance_info = getid(server_id,instance) 

		callsign = Instance_info['callsign']  
		command_port = Instance_info['command_port']
		sensor_port = Instance_info['sensor_port']
		argv = (IP,sensor_port,command_port,callsign,GLOBAL_HOME_LAT,GLOBAL_HOME_LONG,GLOBAL_HOME_ALT)
		
		ros_uavinterface = Process(target = RosUavInterface.ROSUAV_main, args = (argv,))
		jobs_ros.append(ros_uavinterface)
		ros_uavinterface.start()
		sleep(0.1)
		
		ros_gc = Process(target = RosGC.GC_main, args = (argv,))
		jobs_ros.append(ros_gc)
		ros_gc.start()
		sleep(0.1)

		ros_nav = Process(target = ROSNav_Plan.NAV_main, args = (argv,))
		jobs_ros.append(ros_nav)
		ros_nav.start()
		sleep(0.1)
		print "Started ROS Instance %d..." %instance
		sleep(31)
		
		

	print "init complete..."

if __name__ == '__main__':
	main()
