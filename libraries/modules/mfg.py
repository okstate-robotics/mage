#! /usr/bin/env python

'''
===================== Description =================================
This script contains execution of an infinite loop to launch multiple flightgear processes. 
The input is the total number of instances of flightgear that need to execute
'''

import os,sys
import socket
import time
from multiprocessing import Process

''' input args
	1. server_no :should be a unique id number between 0-9
	2. number of fg instances
	3. flightgear multiplayer host, format (address:port)
	4. initial longitude
	5. initial latitude
	6. initial altitude
	7. initial heading
	8. freq_in
	9. freq_out
	10. initial velocity 

''' 

def main(argv):
	server_no = argv[0]
	instances = int(argv[1])

	mp_host = argv[2].split(':') #argv[2] = IP:Port
	mpout_ip = mp_host[0]
	mpout_port = mp_host[1]
	
	try:
		s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		s.connect(("google.com",80))
		mpin_ip = s.getsockname()[0]
		s.close()
	except:
		print "Network connection unavailable..."
		sys.exit(-1)

	for instance in xrange(1,instances+1):
		craft_info = getid(server_no,instance)
		cs = craft_info['callsign']
		command_port = craft_info['command_port']
		sensor_port = craft_info['sensor_port']
		mpin_port = craft_info['mpin_port']
		decision_port = craft_info['decision_port']
		read_port = craft_info['read_port']
		mavlink_port = craft_info['mavlink_port']
		

		jobs_fg = []
		if len(argv) > 3:
			
			lon = argv[3]
			lat = argv[4]
			alt = argv[5]
			iheading = argv[6]
			freq_in = argv[7]
			freq_out = argv[8]
			vehicle = argv[9]
			fg = Process(target = fgthread, args = (cs,mavlink_port,command_port,sensor_port,decision_port,read_port,mpin_ip,mpout_ip,mpin_port,mpout_port,freq_in,freq_out,vehicle,lon,lat,alt,iheading))
			jobs_fg.append(fg)
			fg.start()
			time.sleep(10)
		else:
			fg = Process(target = fgthread, args = (cs,mavlink_port,command_port,sensor_port,decision_port,read_port,mpin_ip,mpout_ip,mpin_port,mpout_port))
			jobs_fg.append(fg)
			fg.start()
			time.sleep(10)
			

def fgthread(callsign,mavlink_port,port_command,port_sensor,port_decision,port_read,mpin_IP,mpout_IP,mpin_port,mpout_port,freq_in=70,freq_out=70,vehicle='f16',lon=-122.35,lat=37.67,alt=2000,iheading=298,ivel=194.38):
	root = os.getcwd()
	Fgpath = root + '/FlightGear/bin/fgfs --fg-root='+root+'/FlightGear/data' 

	fgcallsign = '--callsign='+ callsign 
	
	sock_out = '--generic=socket,out,'+str(freq_out)+',localhost,'+str(port_sensor)+',udp,ControlOutputMage'+' '+'--generic=socket,out,'+str(freq_out)+',localhost,'+str(port_read)+',udp,DecisionModuleOutput'+' '+'--generic=socket,out,'+str(freq_out)+',localhost,'+str(mavlink_port)+',udp,MAVOutput'
	sock_in = '--generic=socket,in,'+str(freq_in)+',localhost,'+str(port_command)+',udp,ControlInputMage'+' '+'--generic=socket,in,'+str(freq_out)+',localhost,'+str(port_decision)+',udp,DecisionModuleInput'
	SOCK = sock_out+' '+sock_in

	multiplay_out = '--multiplay=out,'+str(freq_out)+','+mpout_IP+','+str(mpout_port)
	multiplay_in = 	'--multiplay=in,'+str(freq_in)+','+mpin_IP+','+str(mpin_port)
	MULTIPLAY = multiplay_out+' '+multiplay_in
	
	iposition = '--lon='+str(lon)+' '+'--lat='+str(lat)+' '+'--altitude='+str(alt)+' '+'--heading='+str(iheading)+' '+'--vc='+str(ivel)
	

	if vehicle_check(vehicle):
		aircraft = '--aircraft='+vehicle
	else:
		aircraft=''
	
	
	externals = '--units-meters --wind=0@0 --turbulence=0.0 --timeofday=noon --disable-random-objects --disable-ai-models --disable-clouds3d --disable-clouds --runway=28L --geometry=700x400 --prop:/sim/rendering/multithreading-mode=AutomaticSelection --disable-sound'
	freeze = '--disable-clock-freeze'
	
	FGcmd = Fgpath+' '+fgcallsign+' '+SOCK+' '+MULTIPLAY+' '+iposition+' '+aircraft+' '+externals+' '+freeze
	#print FGcmd
	os.system(FGcmd)


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

def vehicle_check(vehicle):
	vehicle_list = ["c172p","B-52F","eurofighter","f16","Mig-29"]
	
	if vehicle in vehicle_list:		
		return True
	else:
		print vehicle,' is unavailable in system libraries'
		return False


if __name__ == '__main__':
	
	main(sys.argv[1:])
