#! /usr/bin/env python

import os,sys
import socket
import string
import pickle, base64
import time
import matlab.engine
from numpy import array,concatenate


def main(argv):
	ipaddress = argv[0]
	port_read = int(argv[1])
	port_write = int(argv[2])

	sock_read = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	sock_write = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

	sock_read.bind((ipaddress,port_read))

	BUFFER_LIM = 1000

	data, addr = sock_read.recvfrom(1024)
	data_parse = data.split('\t') # returns a list os string values of the data
		
	LLA = array([[float(data_parse[0])],[float(data_parse[1])],[float(data_parse[2])]])
	threat = array([float(data_parse[4])])
	X = float(data_parse[3])
	
	LLA_array = LLA
	threat_array = threat
	
	mat_handle = matlab.engine.start_matlab()
	mat_handle.addpath(r'matlab_files', nargout=0)
	data_handle = mat_handle.Init(array2matlab(LLA),nargout=1)
	
	# First Iteration	
	update_output = GPUpdate(mat_handle,data_handle,LLA,threat)
	data_handle = update_output[0]
	reward_model = update_output[2] 
	DP_out = DecisionProcess(mat_handle,LLA,reward_model,data_handle)
	
	WPs = DP_out[0]
	data_handle = DP_out[1]
	
	WP1_lat = LLA[0][0]
	WP1_lon = LLA[1][0]
	WP1_alt = 1066.0
	WP1_X = X
	WP2_lat = WPs[0][0]
	WP2_lon = WPs[1][0]
	WP2_alt = 1066.0
	WP2_X = X
	print WP1_lat,WP1_lon,WP1_X
	print WP2_lat,WP2_lon,WP2_X
	
	while True:
		data, addr = sock_read.recvfrom(1024)
		data_parse = data.split('\t') # returns a list os string values of the data
		
		LLA = array([[float(data_parse[0])],[float(data_parse[1])],[float(data_parse[2])]])
		X = float(data_parse[3])
		threat = array([float(data_parse[4])])
		reached = bool(float(data_parse[24]))
	
		LLA_array = concatenate((LLA_array,LLA),axis=1)
		threat_array = concatenate((threat_array,threat),axis=1)
		
		if LLA_array.shape[1] == BUFFER_LIM:
			print 'Updating the Model...'+'\n'
			update_output = GPUpdate(mat_handle,data_handle,LLA_array,threat_array)
			data_handle = update_output[0]
		
			#variance based proactive exploration
			reward_model = update_output[2] 
			# reset the buffers
			LLA_array = array([[float(data_parse[0])],[float(data_parse[1])],[float(data_parse[2])]])
			threat_array = array([float(data_parse[3])])
			
	
		if reached:
			print 'Making Decision...'+'\n'
			DP_out = DecisionProcess(mat_handle,LLA,reward_model,data_handle)
			#reached = False
			WPs = DP_out[0]
			data_handle = DP_out[1]
			
			WP1_lat = LLA[0][0]
			WP1_lon = LLA[1][0]
			WP1_alt = 1066.0
			WP1_X = X
			WP2_lat = WPs[0][0]
			WP2_lon = WPs[1][0]
			WP2_alt = 1066.0
			WP2_X = X
			print WP1_lat,WP1_lon,WP1_X
			print WP2_lat,WP2_lon,WP2_X
		
		
		#for channel in SIM_SYSTEM_MSG:
			#get msg
		#	pass
		
		#GPNEIGH_UPDATE(mat_handle,MSG)

		# create the message packet which contains the required decision functionalities
		
		
		SEND_MSG = ''
		#print 'Writ Data..'
		MSG = map(str,[WP1_lat,WP1_lon,WP1_alt,WP1_X,WP2_lat,WP2_lon,WP2_alt,WP2_X,SEND_MSG])
		adm_msg = '\t'.join(MSG)+'\n'
		#print adm_msg
		sock_write.sendto(adm_msg,(ipaddress,port_write))	
		





def GPNEIGH_UPDATE(mat_handle,MSG):
	return None



def GPUpdate(eng_handle,data_handle,LLA,threat):
	engout = eng_handle.update(data_handle,matlab.double(array2matlab(LLA)),matlab.double(array2matlab(threat)),nargout=3)
	data_handle = engout[0]
	mean_vector = engout[1]
	var_vector = engout[2]
	return data_handle,mean_vector,var_vector


def DecisionProcess(eng_handle,LLA,reward_model,data_handle):
	eng_out = eng_handle.exploringPI(matlab.double(array2matlab(LLA)),reward_model,data_handle,nargout=2)
	WayPoints = eng_out[0]
	data_handle = eng_out[1]
	print 'New WP Generated...'+'\n'	
	return WayPoints, data_handle
		


'''

		engout = eng_handle.local_update(model,matlab.double(array2matlab(LLA)),matlab.double(array2matlab(threat)),self.gp_msg,nargout=2) # do this in a thread maybe	
				gp_msg = engout[1]	
				#gp_msg['BV'] = matlab2list(gp_msg['BV'])
				#gp_msg['alpha'] = matlab2list(gp_msg['alpha'])
				#gp_msg['C'] = matlab2list(gp_msg['C'])
			
				self.model = engout[0]
				#self.gp_msg = gp_msg
				self.gp_msg = engout[1]
				

						
			#Old school recv message block
			# Receive data from other aircrafts
			for channel, msg in comm_values.iteritems():	# iterate over all dictionary items	
							
					if msg: # if channel has a message						
						#if self.callsign == "MAGEF01":
								#print 'recvdmsg', msg	last_time_recv 
						try:
							packet_info = msg.rsplit('::',1)[1].split(';')	# list containing current packet messages
						
							time_stamp = packet_info[2]	# timestamp indicating when the packet was tranmsitted
							message_pos = int(packet_info[0]) # position of the packet in the message				
							total_packets = int(packet_info[1]) # total number of packets for this message

							if time_stamp > lastmsg_timestamp: # check if the packet comes from a completely new message
								Data_buff[channel] = {} # reset the buffer if true
								lastmsg_timestamp = time_stamp # set the check message time flag to current timestamp

							message_data = msg.rsplit('::',1)[0] # get the message in packet
						
							Data_buff[channel][message_pos] = message_data # insert it in right positon in buffer
						
							if len(Data_buff[channel])-1 == total_packets:
								#if self.callsign == "MAGEF01":
									#print 'recvdmsg', Data_buff[channel] 
								recv_msg = ''.join(Data_buff[channel].values())
								recv_msg = string.replace(recv_msg,"|N","\n")
								try:
									unpickled_msg = pickle.loads(recv_msg)
									recvdata_list.append(unpickled_msg)
								
								
								except:
									#pass
									print "Data Corruption: Message unreadable..."
								Data_buff[channel] = {} # reset buffer for that channel to zeros
						except:
							#pass 
							print 'Some junk received'	

'''

def matlab2list(matlab_data):
	# convert to a numpy array first
	array_data = array(matlab_data)
	data_list = array_data[0].tolist()
	return data_list


def array2matlab(array_in):
	list_in = array_in.tolist()
	matlab_out = matlab.double(list_in)
	return matlab_out


if __name__ == '__main__':
	main(sys.argv[1:])
	
	
