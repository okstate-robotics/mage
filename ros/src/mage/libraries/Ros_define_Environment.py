#!/usr/bin/env python

"""
Name:Ros_define_Environment.py
Author: Rakshit
Launches a process which services requests from uav sensor nodes and return data from 
an environmental function defined in matlab
""" 


from mage.srv import *
import rospy
import matlab.engine
from numpy import array


def GetData(req):
	# Matlab function which return environment sensor data	
	global Matlab_handle,states,E
	# get the position from the uavs and convert to matlab data type
	p=matlab.double([req.p_x,req.p_y,req.p_z])
	# get the sample value from the env function
	env_info = Matlab_handle.Sensor_info(p,states,E,nargout=1) # Matlab function Sensor_info(position)
	print "Reporting Values:"+str(env_info)
	# return the value back to the uav
	return environmental_dataResponse(env_info) 

# Main Environment data server
def Data_server_main():
	global Matlab_handle,states,E
	Matlab_handle = matlab.engine.start_matlab()
	Matlab_handle.Env_Init(nargout=0)
	states = Matlab_handle.workspace['states']
	E = Matlab_handle.workspace['E']
	rospy.init_node('Environment_data_server') # define node name
	
	s = rospy.Service('Env_Data',environmental_data, GetData) # create the service 'Env_Data' using environmental_data service
	print "Server Ready to return environment data ..."
	rospy.spin() #prevent main from exit

if __name__ == "__main__":
	Data_server_main()
