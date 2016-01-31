#! /usr/bin/env python

import os,sys
import socket
from time import sleep
from multiprocessing import Process
import FgLibs
import subprocess
from threading import Thread

# Command with shell expansion



def main():
	instances = 1
	server_id = 0
	controller_hostIP = "139.78.78.169"
	jobs_fg = []
	for instance in xrange(1,instances+1):
		
		
		fg = Process(target = FgLibs.FGthread, args = (server_id, instance,controller_hostIP))
		print "Started FG Instance %d..." %instance
		jobs_fg.append(fg)
		fg.start()
		sleep(1)
		q = Thread(target=launch_qgc, args=(server_id,instance))
		q.start()
		sleep(30)
	
	print "Started the Visual head..."	
		

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
	t = Thread(target=startcore, args=())
	t.start()
	sleep(5)
	print "Started ROS Master..."
	print "Initializing System..."
	main()
