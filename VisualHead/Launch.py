#! /usr/bin/env python

""" 
Name: Launch.py
Author: Rakshit Allamraju

This file launches the ros master, FG head and connects the autonomous uav launched to Qgroundcontrol
""" 

import os,sys
import socket
from time import sleep
from multiprocessing import Process
import FgLibs
import subprocess
from threading import Thread

# Command with shell expansion


def main(argv):
	start_ros = False # pass as input later
	launch_delay = 600 #launch time delay b/n 2 uavs # Input in future version

	if start_ros:
		t = Process(target=startcore, args=())
		t.start()
		sleep(10)


	# Parse the arguments for positioning the uavs at desired locations
	latitude_args = argv[0].split('=')[1].split(',')
	longitude_args = argv[1].split('=')[1].split(',')
	latitude_list = map(float,latitude_args)
	longitude_list = map(float,longitude_args)
	
	if len(latitude_list) != len(longitude_list):
		print "Mismatch number of input arguments"
		sys.exit(-1)

	print "Starting flightgear visual head ..."

	controller_hosts = {} ##dictionary with key as IP and values as (server_id,no of instances)
	controller_hosts["139.78.78.169"] = (1,3)	#(server_id,no of instances)
	
	# Compute the total instances of uav thats have been defined
	total_instances = 0
	for i in xrange(len(controller_hosts.values())):
		total_instances = total_instances + controller_hosts.values()[i][1]
	
	# Check if input arguments are equal to number of instances defined
	if len(latitude_list) != total_instances:
		print "Mismatch number of latitude values and total instances"
		sys.exit(-1)
	
	if len(longitude_list) != total_instances:
		print "Mismatch number of longitude values and total instances"
		sys.exit(-1)


	jobs_fg = []
	for controller_hostIP in controller_hosts.keys():	
		response = os.system("ping -c 1 " + controller_hostIP)
		if response == 0:
			print "Address "+ controller_hostIP + " is active...adding connection"
			print "System OK"
			for instance in xrange(1, controller_hosts[controller_hostIP][1] + 1): #selecting xrange (1,total no of instances)
		
				server_id = controller_hosts[controller_hostIP][0]
				fg = Process(target = FgLibs.FGthread, args = (server_id, instance,controller_hostIP)) 
				fg.start()
				print "Started FG Instance %d...Connecting from server %i" % (instance,server_id)
				sleep(1)

				q = Thread(target=launch_qgc, args=(server_id,instance))
				q.start()
				sleep(1)

				# Sleep to prevent fg launch error				
				fg_delay = 30 + launch_delay
				sleep(fg_delay)
		else:
			print controller_hostIP + " is down...check connection..."
			print "System will not run FG connection from server"

	
	print "COMPLETED VISUAL HEAD STARTUP!!!"	
		

def startcore():
	os.system('roscore')


def launch_qgc(server_id, instance):	
	Instance_info = FgLibs.getid(server_id,instance) 
	callsign = Instance_info['callsign']
	mav_port = Instance_info['mavlink_port']
	C = callsign[-2:]
	print callsign + ' opened in QGC'
	qgc_str = './fgqgclink localhost 15555 '+str(C)+' ' +str(mav_port)
	os.system(qgc_str)
	

	
	

if __name__ == '__main__':	
	main(sys.argv[1:])
