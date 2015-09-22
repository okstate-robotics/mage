#! /usr/bin/env python

import os,sys
from numpy import array, matrix
from numpy import argmin,dot,cross
from numpy.linalg import norm
from math import cos,sin,atan2,asin,acos,atan
from math import pi,sqrt

#============================ Guidance  =====================================#
class Guidance:
	def __init__(self,k_path,k_orbit,k_i):
		self.k_path = k_path
		self.k_orbit = k_orbit
		self.k_i = k_i
		self.X_inf = 60*pi/180

		self.flag = 2 # orbit or st line
		self.state = 1 # the section of the dubins path
		self.wp_complete = True
		self.Ps_existing = array([[0],[0],[0],[0]])
		self.Pe_existing = array([[10000],[10000],[10000],[0]])

	def check_wp(self,Ps,Pe):
		
		if any(Ps != self.Ps_existing) or any(Pe != self.Pe_existing):
			print 'New Waypoint set...'
			self.state = 1
			self.Ps_existing = Ps
			self.Pe_existing = Pe
		

	def WPPDubins(self,p,R):
		Ps = self.Ps_existing
		Pe = self.Pe_existing

		dp = self.dubinsparams(Ps[0:3],Ps[3],Pe[0:3],Pe[3],R)
		if dp == None:
			return None
		else:
		
			L = dp[0]
			c_s = dp[1]
			lam_s = dp[2]
			c_e = dp[3]
			lam_e = dp[4]
			z1 = dp[5]
			q1 = dp[6]
			z2 = dp[7]
			z3 = dp[8]
			q3 = dp[9]
			if self.state == 1:
				self.wp_complete = False
				self.flag = 2
				c = c_s
				rho = R
				lamda = lam_s
				r = 0.0
				q = 0.0
				if Hp(p,z1,-q1):
					self.state = 2
			elif self.state == 2:
				self.wp_complete = False
				self.flag = 2
				c = c_s
				rho = R
				lamda = lam_s
				r = c_s
				q = q1
				if Hp(p,z1,q1):
					self.state = 3
			elif self.state == 3:
				self.wp_complete = False
				self.flag = 1
				r = z1
				q = q1
				c = z1
				rho = R
				lamda = lam_s
				if Hp(p,z2,q1):
					self.state = 4
			elif self.state == 4:
				self.wp_complete = False
				self.flag = 2
				c = c_e
				rho = R
				lamda = lam_e
				r = z3
				q = q3
				if Hp(p,z3,-q3):
					self.state = 5
			elif self.state == 5:
				self.wp_complete = False
				self.flag = 2
				c = c_e
				rho = R
				lamda = lam_e
				r = z3
				q = q3			
				if Hp(p,z3,q3):			
					self.wp_complete = True # going into loiter mode
					print 'loitering Mode...'
	
			return self.flag,r,q,c,rho,lamda

	def dubinsparams(self,ps,xs,pe,xe,R):
		if norm(ps-pe) < 3*R:
			print "WP incompatability..."
			#sys.exit(0)
			return None
		else:
		
			c_rs = ps + R*dot(rot(pi/2),array([[cos(xs)],[sin(xs)],[0]]))
			c_ls = ps + R*dot(rot(-pi/2),array([[cos(xs)],[sin(xs)],[0]]))
			c_re = pe + R*dot(rot(pi/2),array([[cos(xe)],[sin(xe)],[0]]))
			c_le = pe + R*dot(rot(-pi/2),array([[cos(xe)],[sin(xe)],[0]]))	
	
			# Correct till here
			nu = atan2(c_re[1]-c_rs[1],c_re[0]-c_rs[0])
			L1 = norm(c_rs-c_re) + R*wrapTo2pi(2*pi+wrapTo2pi(nu-pi/2)-wrapTo2pi(xs-pi/2)) + R*wrapTo2pi(2*pi+wrapTo2pi(xe-pi/2)-wrapTo2pi(nu-pi/2))
		
			nu = atan2(c_le[1]-c_rs[1],c_le[0]-c_rs[0])
			l = norm(c_le-c_rs)
			nu2 = nu-pi/2+asin(2*R/l)
			L2 = sqrt(l**2-4*R**2) + R*wrapTo2pi(2*pi+wrapTo2pi(nu2)-wrapTo2pi(xs-pi/2))+R*wrapTo2pi(2*pi+wrapTo2pi(nu2+pi)-wrapTo2pi(xe+pi/2))
		
			nu = atan2(c_re[1]-c_ls[1],c_re[0]-c_ls[0])
			l = norm(c_re-c_ls)
			nu2 = acos(2*R/l)
			L3 = sqrt(l**2-4*R**2) + R*wrapTo2pi(2*pi+wrapTo2pi(xs+pi/2)-wrapTo2pi(nu+nu2))+R*wrapTo2pi(2*pi+wrapTo2pi(xe-pi/2)-wrapTo2pi(nu+nu2-pi))
	
			nu = atan2(c_le[1]-c_ls[1],c_le[0]-c_ls[0])
			L4 = norm(c_ls-c_le) + R*wrapTo2pi(2*pi+wrapTo2pi(xs+pi/2)-wrapTo2pi(nu+pi/2))+R*wrapTo2pi(2*pi+wrapTo2pi(nu+pi/2)-wrapTo2pi(xe+pi/2))
		
			L = min([L1,L2,L3,L4])
		
			if argmin([L1,L2,L3,L4]) == 0:
				c_s = c_rs
				c_e = c_re
				lam_s = 1
				lam_e = 1
		
				q1 = (c_e-c_s)/norm(c_s-c_e)
				z1 = c_s + R*dot(rot(-pi/2),q1)
				z2 = c_e + R*dot(rot(-pi/2),q1)
			elif argmin([L1,L2,L3,L4]) == 1:
				c_s = c_rs
				c_e = c_le
				lam_s = 1
				lam_e = -1
		
				l = norm(c_e-c_s)
				nu =  atan2(c_e[1]-c_s[1],c_e[0]-c_s[0])
				nu2 = nu - pi/2 + asin(2*R/l)

				q1 = dot(rot(nu2+pi/2),array([[1],[0],[0]]))
				z1 = c_s + R*dot(rot(nu2),array([[1],[0],[0]]))
				z2 = c_e + R*dot(rot(nu2+pi),array([[1],[0],[0]]))

			elif argmin([L1,L2,L3,L4]) == 2:
				c_s = c_ls
				c_e = c_re
				lam_s = -1
				lam_e = 1
		
				l = norm(c_e-c_s)
				nu = atan2(c_e[1]-c_s[1],c_e[0]-c_s[0])
				nu2 = acos(2*R/l)
		
				q1 = dot(rot(nu+nu2-pi/2),array([[1],[0],[0]]))
				z1 = c_s + R*dot(rot(nu+nu2),array([[1],[0],[0]]))
				z2 = c_e + R*dot(rot(nu+nu2-pi),array([[1],[0],[0]]))

			elif argmin([L1,L2,L3,L4]) == 3:
				c_s = c_ls
				c_e = c_re
				lam_s = -1
				lam_e = -1
		
				q1 = (c_e-c_s)/norm(c_e-c_s)
				z1 = c_s + dot(rot(pi/2),q1)
				z2 = c_e + dot(rot(pi/2),q1)

			z3 = pe
			q3 = dot(rot(xe),array([[1],[0],[0]]))
			return L,c_s,lam_s,c_e,lam_e,z1,q1,z2,z3,q3

	def stline(self,r,q,p,X):
	
		X_q = atan2(q[1],q[0])
		while X_q -X < -pi:
			X_q = X_q + 2*pi
		while X_q -X > pi:
			X_q = X_q - 2*pi
	
		e_ip = p-r
		e_p = dot(rot(-X_q),e_ip)
		n = cross(q.T,self.k_i.T).T
		n = n/norm(n)
	
		s = e_ip - dot(e_ip.T,n)*n

		h_c = r[2] + sqrt(s[0]**2+s[1]**2)*(q[2]/sqrt(q[0]**2+q[1]**2)) 
		
		e_py = -sin(X_q)*(p[0]-r[0])+cos(X_q)*(p[1]-r[1])

		X_c = X_q - self.X_inf*(2/pi)*atan(self.k_path*e_p[1])
		return h_c,X_c

	def orbit(self,c,p,X,rho,lamda):
		h_c = c[2]
		
		d = sqrt((p[0]-c[0])**2+(p[1]-c[1])**2)

		alpha = atan2(p[1]-c[1],p[0]-c[0])
		while alpha -X < -pi:
			alpha = alpha + 2*pi
		while alpha -X > pi:
			alpha = alpha - 2*pi


		X_c = alpha + lamda*(pi/2 + atan(self.k_orbit*(d-rho)/rho))
		return h_c,X_c


# ==================================== Control =============================================#
class Controller:
	def __init__(self,K_P,K_I,K_D,dt):
		self.flag = 0
		# init the inner loop
		self.PHI = PID(K_P[0],K_I[0],K_D[0],dt) # roll pid init
		self.THETA = PID(K_P[1],K_I[1],K_D[1],dt) # pitch pid init
		self.PSI = PID(K_P[2],K_I[2],K_D[2],dt) # yaw pid init
		
		#init the outer loop
		self.V = PID(K_P[3],K_I[3],K_D[3],dt) # vel init
		self.H = PID(K_P[4],K_I[4],K_D[4],dt) # alt init
		self.X = PID(K_P[5],K_I[5],K_D[5],dt) # course init

		

	def control(self,sensor_in,h_c,X_c,V_c,Heading_c=298*pi/180,state=1):
		x_pos = sensor_in[0]
		y_pos = sensor_in[1]
		z_pos = sensor_in[2]		
		x_vel = sensor_in[3]
		y_vel = sensor_in[4]
		z_vel = sensor_in[5]
		
		roll = sensor_in[6]*pi/180
		
		pitch = sensor_in[7]*pi/180
		yaw = sensor_in[8]*pi/180
		roll_rate = sensor_in[9]
		pitch_rate = sensor_in[10]
		yaw_rate = sensor_in[11]
		
		speed = sensor_in[12]
		course = sensor_in[13]
		
		H_lim = 60*pi/180
		X_lim = 60*pi/180
		speed_lim = 200			
		pitch_lim = 1		
		roll_lim = 1
		yaw_lim = 1

		if self.flag == 1:
			# alt hold
			theta_des = -1*self.H.pid_out(h_c,z_pos,H_lim)
			#print 'error in alt',self.H.e_p
			# course hold 
			phi_des = self.X.pid_out(X_c,course,X_lim)
			#print 'error in course',self.X.e_p
			# velocity hold
			#print V_c,speed
			throttle = self.V.pid_out(V_c,speed,speed_lim)
			
			# pitch hold
			elevator_out = -1*self.THETA.pid_out(theta_des,pitch,pitch_lim)
			#print 'error in pitch',self.THETA.e_p
			#roll hold
			aileron_out = self.PHI.pid_out(phi_des,roll,roll_lim)
			#print 'error in roll',self.PHI.e_p			
			# yaw hold
			yaw_out = 0.0#self.PSI.pid_out(0.0,yaw,yaw_lim)
		elif self.flag == 0:
			throttle = 1.0
			# airspeed hold with pitch
			theta_des = self.V.pid_out(V_c,speed,speed_lim)
			# roll
			phi_des = 0.0

			# pitch hold
			elevator_out = -1*self.THETA.pid_out(theta_des,pitch,pitch_lim)
			#roll hold
			aileron_out = self.PHI.pid_out(phi_des,roll,roll_lim)
			# yaw hold
			yaw_out = self.PSI.pid_out(Heading_c,yaw,yaw_lim)
			
		elif self.flag == 2:
			throttle = 0.0
			# airspeed hold with pitch
			theta_des = self.V.pid_out(V_c,speed,speed_lim)
			# roll
			phi_des = 0.0

			# pitch hold
			elevator_out = -1*self.THETA.pid_out(theta_des,pitch,pitch_lim)
			#roll hold
			aileron_out = self.PHI.pid_out(phi_des,roll,roll_lim)
			# yaw hold
			yaw_out = self.PSI.pid_out(Heading_c,yaw,yaw_lim)
		self.flag = state
		return [throttle,aileron_out,elevator_out,yaw_out]
		

class PID:
	def __init__(self,k_p,k_i,k_d,dt):
		self.k_p = k_p
		self.k_i = k_i
		self.k_d = k_d

		self.dt = dt

		self.e_p = 0
		self.e_i = 0
		self.e_d = 0

		self.e_last = 0

	def pid_out(self,y_c,y,lim):
		self.e_p = y_c-y
		self.e_i = self.e_i + (self.dt/2)*(self.e_p + self.e_last)
		self.e_d = (self.e_p-self.e_last)*(2/self.dt) - self.e_d # derivative error...check this again
		
		self.e_last = self.e_p
		
		# calculate unsaturated output
		
		u_unsat = self.k_p*self.e_p + self.k_i*self.e_i + self.k_d*self.e_d
		
		# saturate
		u_sat = saturate(u_unsat,lim)
		
		
		# antiwindup
		if self.k_i != 0:
			
			self.e_i = self.e_i + (self.dt/self.k_i)*(u_sat-u_unsat)
		return u_sat

# ==================================== misc functions ======================================#	
def Hp(p,r,n):
	n = n/norm(n)	
	return dot((p-r).T,n) >= 0
	


def rot(ang):
	# input angle must be in radians
	R = array([[cos(ang),-sin(ang),0],[sin(ang),cos(ang),0],[0,0,1]])
	return R	

def wrapTo2pi(ang):
	# input is in radians
	#convert to degrees
	ang = ang*180/pi
	return (ang % 360)*(pi/180)


def saturate(u_in,limit):
	if u_in < -limit:
		u = -limit
	elif u_in > limit:
		u = limit
	else:
		u = u_in
	return u



