#! /usr/bin/env python

'''
===================== Description =================================
This script contains execution of an infinite loop to launch multiple Controller processes. 
The input is the total number of instances of flightgear that need to execute
'''

import os,sys
import socket
import time
from multiprocessing import Process

''' input args
	1. server_no :should be a unique id number between 0-9
	2. number of control instances
	
''' 

def main(argv):
	server_no = argv[0]
	instances = int(argv[1])

	
	for instance in xrange(1,instances+1):
		craft_info = getid(server_no,instance)
		cs = craft_info['callsign']
		command_port = craft_info['command_port']
		sensor_port = craft_info['sensor_port']

		jobs_control = []

		cont = Process(target = controlthread, args = (sensor_port, command_port))
		jobs_control.append(cont)
		cont.start()
		time.sleep(10)
		

def controlthread(port_read,port_write):
	root = os.getcwd()
	control_command = root +'/GC.py'+' '+'localhost'+' '+str(port_read)+' '+str(port_write)
	os.system(control_command)


def getid(server_no,instance):
	id_dict = dict() # Dictionary containg the IDS
	callsign = 'MAGEF'+str(server_no)+str(instance).zfill(1) # There is a limit of the string length
	id_dict['callsign'] = callsign

	mavlink_port = '9'+str(server_no)+str(instance).zfill(2)
	id_dict['mavlink_port'] = int(mavlink_port)

	command_port = '5'+str(server_no)+'0'+str(instance).zfill(2)
	id_dict['command_port'] = int(command_port)

	sensor_port = '5'+str(server_no)+'1'+str(instance).zfill(2)
	id_dict['sensor_port'] = int(sensor_port)

	decision_port = '4'+str(server_no)+'0'+str(instance).zfill(2)
	id_dict['decision_port'] = int(decision_port)

	read_port = '4'+str(server_no)+'1'+str(instance).zfill(2)
	id_dict['read_port'] = int(read_port)

	multiplay_portin = '8'+str(server_no)+str(instance).zfill(2) 
	id_dict['mpin_port'] = multiplay_portin

	return id_dict	

if __name__ == '__main__':
	
	main(sys.argv[1:])		

