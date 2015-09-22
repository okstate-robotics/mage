#! /usr/bin/env python

''' System to receive data from the FG's protocol, maintain guidance and control'''

import os,sys
import socket
from numpy import loadtxt
from GClibs import *
from math import pi


def main():
	ipaddress = sys.argv[1]
	port_read = int(sys.argv[2])
	port_write = int(sys.argv[3])
	
	# read data from text file
	read = ['k_path','k_orbit','kp_phi','ki_phi','kd_phi','kp_t','ki_t','kd_t','kp_psi','ki_psi','kd_psi','kp_v','ki_v','kd_v','kp_alt','ki_alt','kd_alt','kp_x','ki_x','kd_x','dt','R']
	f = open('config.txt','r')

	data = {}
	counter = 0
	for line in f:
		line = line.strip()
		columns = line.split()
		value = columns[1]
		data[read[counter]] = float(value)
		counter += 1
		
	K_P = [data['kp_phi'],data['kp_t'],data['kp_psi'],data['kp_v'],data['kp_alt'],data['kp_x']]
	K_I = [data['ki_phi'],data['ki_t'],data['ki_psi'],data['ki_v'],data['ki_alt'],data['ki_x']]
	K_D = [data['kd_phi'],data['kd_t'],data['kd_psi'],data['kd_v'],data['kd_alt'],data['kd_x']]
	
	k_path = data['k_path']
	k_orbit = data['k_orbit']
	dt = data['dt']
	R = data['R']

	sock_read = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	sock_write = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

	sock_read.bind((ipaddress,port_read))

	data, addr = sock_read.recvfrom(1024)
	message = data.split('\t')
	fg_data = map(float,message)

	k_i = array([ [fg_data[17]], [fg_data[18]], [fg_data[19]] ])
	gs = Guidance(k_path,k_orbit,k_i) # get k_i from fg
	cs = Controller(K_P,K_I,K_D,dt)

	while True:
		
		data, addr = sock_read.recvfrom(1024)
		message = data.split('\t')
		
		fg_data = map(float,message)
		
		# parse the data 
		p = array([[fg_data[0]],[fg_data[1]],[fg_data[2]]])
		X = fg_data[16]
		
		Ps = array([[fg_data[20]],[fg_data[21]],[fg_data[22]],[fg_data[23]]])
		Pe = array([[fg_data[24]],[fg_data[25]],[fg_data[26]],[fg_data[27]]])
		
		#Ps = array([[0],[0],[0],[298*pi/180]])
		#Pe = array([[float(sys.argv[4])],[float(sys.argv[5])],[0],[180*pi/180]])
		
		#check if new wps are generated
		gs.check_wp(Ps,Pe)		

		dub_out = gs.WPPDubins(p,R)
		if dub_out == None:
			pass
		else:
			REGIME = 1#int(fg_data[28])
		
			if REGIME == 1:
				if dub_out[0] == 1: # follow straight line
					g_out = gs.stline(dub_out[1],dub_out[2],p,X)			
				elif dub_out[0] == 2: # follow orbit
					g_out = gs.orbit(dub_out[3],p,X,dub_out[4],dub_out[5])
			elif REGIME == 0:
				if dub_out[0] == 1: # follow straight line
					g_out = gs.stline(dub_out[1],dub_out[2],p,X)	
					print 'St line'		
				elif dub_out[0] == 2: # follow orbit
					g_out = gs.orbit(dub_out[3],p,X,dub_out[4],dub_out[5])
					print 'orbit'
			h_c = g_out[0]
			X_c = g_out[1]
			V_c = 100
					
			sensor_in = [fg_data[0],fg_data[1],fg_data[2],fg_data[3],fg_data[4],fg_data[5],fg_data[9],fg_data[10],fg_data[11],fg_data[12],fg_data[13],fg_data[14],fg_data[15],fg_data[16]]
			c_out = cs.control(sensor_in,h_c[0],X_c,V_c,state=REGIME)

			THROTTLE = c_out[0]
			AILERON = c_out[1]
			ELEVATOR = c_out[2]
			YAW = c_out[3]

			# write the controller output here
			command_list = [str(AILERON), str(ELEVATOR), str(YAW),str(THROTTLE),str(int(gs.wp_complete)),str(0)]	
			control_msg = '\t'.join(command_list)+'\n'		
		
			sock_write.sendto(control_msg, (ipaddress,port_write))
		


if __name__ == '__main__':
	main()