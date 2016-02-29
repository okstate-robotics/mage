#!/usr/bin/env python

# TEst code
# Creates a node and requests a BV matrix

from numpy import array, zeros
import rospy
from mage.srv import *



def main():
	Node_name = 'bvreq'
	rospy.init_node(Node_name, anonymous=True)
	
	Service_req = 'send_model_data' 
		
	try:
		rospy.wait_for_service(Service_req,timeout=3)
		get_data = rospy.ServiceProxy(Service_req,model_data)
		resp = get_data('Give me data Plzz')
		print resp.Response
		rows = resp.rows
		columns = resp.columns
		BV = zeros((rows,columns))
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

		for i in xrange(int(rows)):
			BV[i,:] = Data[i]
		W = array(resp.W)
		BV = array(BV)
		print BV
		print W


	except:
		print "Service call failed"
	
	

if __name__ =="__main__":
	main()



