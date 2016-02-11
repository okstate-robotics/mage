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


def main():
	start_ros = True # pass as input later
	launch_delay = 30 # Input in future version

	if start_ros:
		t = Process(target=startcore, args=())
		t.start()
		sleep(10)
	
	print "Starting flightgear visual head ..."

	controller_hosts = {} ##dictionary with key as IP and values as (server_id,no of instances)
	controller_hosts["139.78.78.169"] = (1,2)	
	#controller_hostIP = "139.78.78.169" # IP address of server running the controller ### input in future version

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
	qgc_str = './fgqgclink localhost 15555 '+str(C)+' ' +str(mav_port)
	os.system(qgc_str)
	print callsign + ' opened in QGC'

	
	

if __name__ == '__main__':	
	main()
