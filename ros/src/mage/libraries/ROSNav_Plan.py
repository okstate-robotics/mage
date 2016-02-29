#!/usr/bin/env python

"""
ModuleName: ROSNav_Plan.py
Author: Rakshit Allamraju

Descp : Navigation and communication module
This module subscribes to the 'Sensor_data' topic, generates the navigation waypoints for the UAV and publishes to 'Navigation_data' topic
Module services GP model to other uavs and requests GP model from neighbors
"""

# python standard libraries
import os,sys
import socket
from math import pi
from time import sleep

# Dependencies
import rospy
from mage.msg import *
from mage.srv import *
from numpy import array, zeros
import matlab.engine
from multiprocessing import Event 

# Convert from python numpy array to matlab vector
def array2matlab(py_array):
	py_list = py_array.tolist()
	mat_vec = matlab.double(py_list)
	return mat_vec

#convert from python list to matlab vector
def list2matlab(py_list):
	mat_vec = matlab.double(py_list)
	return mat_vec

# Convert from matlab vector to python list
def matlab2list(matlab_data):
	# convert to a numpy array first
	array_data = array(matlab_data)
	data_list = array_data[0].tolist()
	return data_list


class Uav_Guide:
	def __init__(self):
		pass

	def UAV_GP_init(self,Sensor,nav_start_event):
		global Nav_data_handle, Matlab_handle
		global Variance
		global nav_sub_once
		# Position data
		p = array([ [Sensor.Pos_n],[Sensor.Pos_e],[Sensor.Pos_d] ]) # position data obtained by subscribing to sensor_data topic
		p_LLA = array([ [Sensor.lat_deg],[Sensor.long_deg],[Sensor.alt_m] ])
		# Course data
		X = Sensor.course
	
		# Request sample from Env_Data service ### Ensure that environmental data service is running...
		rospy.wait_for_service('Env_Data')
		
		try:
			get_data = rospy.ServiceProxy('Env_Data',environmental_data)
			resp = get_data(p_LLA.tolist()[0][0],p_LLA.tolist()[1][0],p_LLA.tolist()[2][0])
			env_sample= resp.sensor_value # get the environment sample value at given position 
		
		except rospy.ServiceException, e:
			print "Service call failed: %s" %e
		
		self.Matlab_handle = matlab.engine.start_matlab()

		Mat_out = self.Matlab_handle.Init(array2matlab(p_LLA),array2matlab(array([env_sample])),nargout=1) ### GET SENSOR VALUE FROM ENVIRONMENTAL NODE
		
		self.Nav_data_handle = Mat_out	
		Nav_data_handle = self.Nav_data_handle
		Matlab_handle = self.Matlab_handle
		nav_start_event.set()		
		nav_sub_once.unregister()

		print UAV_callsign +":Completed navigation init ..."
		
		


	# Subscriber callback function which updates the GP model with new samples
	def UAV_GP_Update(self,Sensor):
		global Variance, Nav_data_handle
		# Position data
		p = array([ [Sensor.Pos_n],[Sensor.Pos_e],[Sensor.Pos_d] ]) # position data obtained by subscribing to sensor_data topic
		p_LLA = array([ [Sensor.lat_deg],[Sensor.long_deg],[Sensor.alt_m] ])
		# Course data
		X = Sensor.course
		
		# Request sample from Env_Data service ### Ensure that environmental data service is running...
		rospy.wait_for_service('Env_Data')
		
		try:
			get_data = rospy.ServiceProxy('Env_Data',environmental_data)
			resp = get_data(p_LLA.tolist()[0][0],p_LLA.tolist()[1][0],p_LLA.tolist()[2][0])
			env_sample= resp.sensor_value # get the environment sample value at given position 
			print UAV_callsign + ":Got Envsample ...Updating"
		except rospy.ServiceException, e:
			print "Service call failed: %s" %e

		gp = self.Nav_data_handle['ogp']
		
		states = self.Nav_data_handle['states']
		
		# Dont pass the matlab struct/python dict data types into the fucking funcs. Any class structure loses it memory location and the whole fucking thing breaks down

		# Update the GP model		
		#print self.Matlab_handle.update(matlab.double(array2matlab(p_LLA)),matlab.double([env_sample]), gp,states,nargout=0) 
		m_out= self.Matlab_handle.testros(gp,states,matlab.double(array2matlab(p_LLA)),matlab.double([env_sample]),nargout=2)
		self.Nav_data_handle['ogp'] = m_out[0]
		self.Variance = m_out[1]
		Variance = self.Variance
		Nav_data_handle = self.Nav_data_handle
		sleep(60)	
		

# Service returns GP model requested by client
def UAV_Model_Req(Request_GP_model):

	global UAV_NEIGHS, Matlab_handle

	if Request_GP_model.uav_tag in UAV_NEIGHS:
		# Send model if neighbor
		#BV,obs,K,Q,C,current_size,sigma,noise,jitter,reg_type,alph
		gp = Nav_data_handle['ogp']
		out = Matlab_handle.compressGP(gp,nargout=2)#Matlab_handle.compressGP(gp,nargout=11)

		Response = True	

		BV = array(out[0]) # BV is now a numpy array
		obs = matlab2list(out[1]) # is a list
		a_size = BV.shape
		
		bv = {}
		for i in xrange(10):
			bv[i] = [0.]

		for i in xrange(a_size[0]):
			bv[i] = BV[i,:].tolist()

		
		#K = matlab2list(out[2])
		#Q = matlab2list(out[3])
		#C = matlab2list(out[4])
		#curr_size = out[5]
		#sigma = matlab2list(out[6])
		#noise = out[7]
		#jitter = out[8]
		#reg_type = out[9]
		#alpha = matlab2list(out[10])

		#return model_dataResponse(Response,BV,obs,K,Q,C,curr_size,sigma,noise,jitter,reg_type,alpha)

		return model_dataResponse(Response,int(a_size[0]),int(a_size[1]),bv[0],bv[1],bv[2],bv[3],bv[4],bv[5],bv[6],bv[7],bv[8],obs)
		
	else:
		#Reject request
		Response = False
		return model_dataResponse(Response,0,0,0,0,0,0,0,0,0,0,0)
	
	

# Service returns new points requested by client
def UAV_Nav_Gen(Request_new_wp):
	global Nav_data_handle, Matlab_handle, Variance

	states = Nav_data_handle['states']
	gw = Nav_data_handle['gw']
	x = Nav_data_handle['x']
	y = Nav_data_handle['y']
	X0 = Nav_data_handle['X0']
	Y0 = Nav_data_handle['Y0']
	Z0 = Nav_data_handle['Z0']
	N = Nav_data_handle['N']
	E = Nav_data_handle['E']
	gp = Nav_data_handle['ogp']
	
	# Run the matlab Policy Iteration
	Pos = array([ [Request_new_wp.P_x],[Request_new_wp.P_y],[Request_new_wp.P_z] ]) # The data passed here needs to be LLA not NED pos
	New_wp = Matlab_handle.exploringPI(matlab.double(array2matlab(Pos)),Variance,states,gw,x,y,X0,Y0,Z0,N,E,gp,nargout=1) #exploringPI(LLA,reward,states,gw,x,y,X0,Y0,Z0)
	print UAV_callsign+":"+str(New_wp)
		

	return navigation_dataResponse(Request_new_wp.P_x,Request_new_wp.P_y,Request_new_wp.P_z,45*pi/180,New_wp[0][0],New_wp[1][0],1250,45*pi/180) # This output is in NED # in future set Request_new_wp.P_z in place of 950


def NAV_main(argv):
	global UAV_NEIGHS, Matlab_handle, UAV_callsign #, Nav_data_handle 
	global nav_sub_once
	if not isinstance(argv[3], str):
		print "Input Argument must be a string"
		sys.exit(-1)
	else:
		UAV_callsign = argv[3]
	
	UAV_NEIGHS = argv[7] # list containing neighbors list
	
	#wait for signal from UAVinterface process
	FG_event = argv[8]
	FG_event.wait()
	sleep(2)
	print UAV_callsign +":FG link established...started Navigation process"
	
	Nav_event = argv[9]
	# Initialize the Navigation and Planning node
	Node_name = 'ROSNAV_PLAN_'+UAV_callsign
	rospy.init_node(Node_name, anonymous=True)
	rate = rospy.Rate(100) # Publish at 100 hz

	uav_smart = Uav_Guide()	# instance for navigation functions
	nav_start_event = Event()	
	# Get sensor data and update the GP
	Sub_Topic_Name = 'Sensor_data_'+UAV_callsign
	nav_sub_once = rospy.Subscriber(Sub_Topic_Name, sensor_data, uav_smart.UAV_GP_init,nav_start_event,queue_size=5) # subscribe to Sensor_data topic to get IMU information and create the initial definitions
	#nav_sub.unregister()	# unregister from the initialize function
	nav_start_event.wait()
	sleep(2)
	nav_sub = rospy.Subscriber(Sub_Topic_Name, sensor_data, uav_smart.UAV_GP_Update,queue_size=5) # subscribe to Sensor_data topic to get IMU information and update the model
	print UAV_callsign+":Subscribed to topic ",Sub_Topic_Name
	sleep(1)


	# Create a Service for servicing requests for generating navigation waypoints
	Service_Nav = 'Nav_data_'+UAV_callsign
	nav_srv = rospy.Service(Service_Nav,navigation_data,UAV_Nav_Gen) # creates a policy iteration planning service
	print UAV_callsign+":Started Navigation data service ..."

	# Create a service for servicing requests for GP model
	Service_Model = 'Model_data_'+UAV_callsign  
	mod_srv=rospy.Service(Service_Model, model_data, UAV_Model_Req) # creates a GP model data service
	print UAV_callsign+":Started Model Service Data ..."
	
	# All services started..send signal to guidance process
	Nav_event.set()
	
	# Get messages from neighbors
	#while not rospy.is_shutdown:
	while True:	
		
		#print UAV_NEIGHS
		for UAV_neigh in UAV_NEIGHS:
			
			Service_req = 'Model_data_'+UAV_neigh  # Service name for the neighbor uav
			#print UAV_callsign + ":Waiting for service " + Service_req
			
		
			try:
				rospy.wait_for_service(Service_req,timeout=2) # check for service
				#print UAV_callsign + ":got a response from " + Service_req
				get_data = rospy.ServiceProxy(Service_req,model_data)
				resp = get_data(UAV_callsign) # callback which services request

				if resp.Response == True:     # if in neighbor ## just to double check

					#print UAV_callsign+":Obtained model from " + UAV_neigh
					gp = uav_smart.Nav_data_handle['ogp'] # current GP model
					states = uav_smart.Nav_data_handle['states']

					# get the basis vector info
					BV = zeros((resp.rows,resp.columns))
					Data = {}
					Data[0] = resp.BV1
					Data[1] = resp.BV2
					Data[2] = resp.BV3
					Data[3] = resp.BV4
					Data[4] = resp.BV5
					Data[5] = resp.BV6
					Data[6] = resp.BV7
					Data[7] = resp.BV8
					Data[8] = resp.BV9
				
					for i in xrange(int(resp.rows)):
						BV[i,:] = Data[i]
			
				
					obs = array2matlab( array(resp.W) ) # get the obs vector
					BV = array2matlab( array(BV) )
					#print BV
					#print obs
					#BV = list2matlab(resp.BV)
					#obs = list2matlab(resp.obs)
					#K = list2matlab(resp.K)
					#Q = list2matlab(resp.Q)
					#C = list2matlab(resp.C)
					#sigma = list2matlab(resp.sigma)
					#alpha = list2matlab(resp.alpha)
					#gpf_out = ExpandNFuse(gp,states,BV,obs,K,Q,C,resp.current_size,sigma,resp.noise,resp.jitter,resp.reg_type,alpha,nargout=1)

					gpf_out = Matlab_handle.ExpandNFuse(gp,states,BV,obs,nargout=1)
					uav_smart.Nav_data_handle['ogp'] = gpf_out
				else:
					print UAV_callsign+":No response from neighbor ..."	
			except:
				#print UAV_callsign+":Service "+ Service_req + " unavailable ..."
				pass
		# for every 60 seconds query all services
		sleep(10)							
	
	# spin to prevent main loop from exiting
	rospy.spin()


