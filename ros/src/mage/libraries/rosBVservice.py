#!/usr/bin/env python

# TEst code
# Creates a node and transmits a BV matrix

from numpy import array, zeros
import rospy
from mage.srv import *



def main():
	Node_name = 'bvservice'
	rospy.init_node(Node_name, anonymous=True)
	
	Service_name = 'send_model_data' 
	mod_srv=rospy.Service(Service_name, model_data, MYModel_data) 
	print "Started Service ..."
	rospy.spin()

def MYModel_data(req):
	print req.uav_tag
	bv_o = array([[0,3,2,1],[-3,2,9,5]])
	w = array([1,3,2,1]).tolist()
	a_size = bv_o.shape
	
	bv = {}
	for i in xrange(10):
		bv[i] = [0.]

	for i in xrange(a_size[0]):
		bv[i] = bv_o[i,:].tolist()
	#w = [0.0]
	Response = True
	print "Reporting values " + str((Response,a_size[0],a_size[1],bv[0],bv[1],bv[2],bv[3],bv[4],bv[5],bv[6],bv[7],bv[8],w))
	
	return model_dataResponse(Response,int(a_size[0]),int(a_size[1]),bv[0],bv[1],bv[2],bv[3],bv[4],bv[5],bv[6],bv[7],bv[8],w)


if __name__ == "__main__":
	main()
