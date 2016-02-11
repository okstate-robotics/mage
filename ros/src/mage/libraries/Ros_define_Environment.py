#!/usr/bin/env python

from mage.srv import *
import rospy
import matlab.engine
from numpy import array

# service request callback
def GetData(req):
	# Matlab function which return environment sensor data	
	global Matlab_handle,states,E
	p=matlab.double([req.p_x,req.p_y,req.p_z])
	env_info = Matlab_handle.Sensor_info(p,states,E,nargout=1) # Matlab function Sensor_info(position)
	print "Reporting Values:"+str(env_info)
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