#! /usr/bin/env python

import os,sys
import getopt
import multiprocessing
import time

def main():
	try:
		opts, args = getopt.getopt(sys.argv[1:],'t:n:m:v:a:k:',["station=","gcsIP=","mageIP=","vehicle=","autounits=","server_no="])
	except getopt.GetoptError as err:
		print str(err)
		print "Mage.py --station=<station_type> --gcsIP=<IP:Port> --mageIP=<IP:Port> --vehicle=<vehicle_type> --autounits=<no_of_auto_units>"
		sys.exit(-1)
	
	
	# Initiate the default values of the parameters
	station = 0
	gcs_ip = "localhost"
	gcs_port = 15555
	mp_ip = "mpserver03.flightgear.org"
	mp_port = 5000
	vehicle = ['a',]
	

	for opt,arg in opts:
		
		if opt in ("-t","--station"):			
				
			if arg in ('auto','autonomous'):
				station = 0
			elif arg in ('human','playing'):
				station = 1
			elif arg in ('monitoring','controlstation'):
				station = 2
			''' Autonomous station = 0
				    Playing station = 1
				    Monitoring Station = 2'''
			
		if opt in ("-n","--gcsIP"):
			gcs_info = arg
			gcip = gcs_info.split(':')[0]
			gcport = gcs_info.split(':')[1]
				
		if opt in ("-m","--mageIP"):
			mp_info = arg		
			mpip = mp_info.split(':')[0]
			mpport = mp_info.split(':')[1]
		
		if opt in ("-v","--vehicle"):
			vehicle_list = arg.split(':')
		if opt in ("-a","--autounits"): 
			no_vehicle = int(arg)
			
		if opt in ("-k","--server_no"): 
			server = arg
	
	if station == 1:
		vehicle_list = vehicle_list[0]
	
	if station == 0:
		
		if len(vehicle_list) != no_vehicle:
			print "Make sure that the input vehicles config and total vehicles are consistent"
		
		# launch the multiplay flightgear code
		fg_launch_cmd = './mfg.py'+' '+str(server)+' '+str(no_vehicle)+' '+str(mp_info)
		
		fg_process = multiprocessing.Process(target=system_call, args=(fg_launch_cmd,))
		fg_process.start()
		print "Launched all Flightgear instances..."
		
		for instance in xrange(1,no_vehicle+1):
			
			craft_info = getid(server,instance)
			callsign = craft_info['callsign']
			mav_port = craft_info['mavlink_port']
			cmd = './mavbridge/fgqgclink'+' '+'localhost'+' '+str(gcport)+' '+str(callsign[-2:])+' '+str(mav_port)				
			qgc_proceses = multiprocessing.Process(target=system_call, args=(cmd,))
			qgc_proceses.start()


		time.sleep(10)
		# Launch the DP
		for instance in xrange(1,no_vehicle+1):
			
			craft_info = getid(server,instance)
			decision_port = craft_info['decision_port']
			read_port = craft_info['read_port']			
			cmd = './decisionmaking.py'+' '+'localhost'+' '+str(read_port)+' '+str(decision_port)				
			dp_proceses = multiprocessing.Process(target=system_call, args=(cmd,))
			dp_proceses.start()

		print 'Decision Systems Active...'
		time.sleep(10)
		# Launch Controllers
		for instance in xrange(1,no_vehicle+1):
			
			craft_info = getid(server,instance)
			command_port = craft_info['command_port']
			sensor_port = craft_info['sensor_port']
			cmd = './GC.py'+' '+'localhost'+' '+str(sensor_port)+' '+str(command_port)				
			control_proceses = multiprocessing.Process(target=system_call, args=(cmd,))
			control_proceses.start()
		print 'Controllers Operational...'
		


def system_call(cmd):
	os.system(cmd)

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
	main()
