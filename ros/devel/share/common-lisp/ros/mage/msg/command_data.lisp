; Auto-generated. Do not edit!


(cl:in-package mage-msg)


;//! \htmlinclude command_data.msg.html

(cl:defclass <command_data> (roslisp-msg-protocol:ros-message)
  ((aileron
    :reader aileron
    :initarg :aileron
    :type cl:float
    :initform 0.0)
   (elevator
    :reader elevator
    :initarg :elevator
    :type cl:float
    :initform 0.0)
   (rudder
    :reader rudder
    :initarg :rudder
    :type cl:float
    :initform 0.0)
   (throttle
    :reader throttle
    :initarg :throttle
    :type cl:float
    :initform 0.0)
   (reached
    :reader reached
    :initarg :reached
    :type cl:float
    :initform 0.0))
)

(cl:defclass command_data (<command_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <command_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'command_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-msg:<command_data> is deprecated: use mage-msg:command_data instead.")))

(cl:ensure-generic-function 'aileron-val :lambda-list '(m))
(cl:defmethod aileron-val ((m <command_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:aileron-val is deprecated.  Use mage-msg:aileron instead.")
  (aileron m))

(cl:ensure-generic-function 'elevator-val :lambda-list '(m))
(cl:defmethod elevator-val ((m <command_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:elevator-val is deprecated.  Use mage-msg:elevator instead.")
  (elevator m))

(cl:ensure-generic-function 'rudder-val :lambda-list '(m))
(cl:defmethod rudder-val ((m <command_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:rudder-val is deprecated.  Use mage-msg:rudder instead.")
  (rudder m))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <command_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:throttle-val is deprecated.  Use mage-msg:throttle instead.")
  (throttle m))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <command_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:reached-val is deprecated.  Use mage-msg:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <command_data>) ostream)
  "Serializes a message object of type '<command_data>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'aileron))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'elevator))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rudder))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'reached))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <command_data>) istream)
  "Deserializes a message object of type '<command_data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aileron) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevator) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rudder) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'throttle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reached) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<command_data>)))
  "Returns string type for a message object of type '<command_data>"
  "mage/command_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'command_data)))
  "Returns string type for a message object of type 'command_data"
  "mage/command_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<command_data>)))
  "Returns md5sum for a message object of type '<command_data>"
  "978bbee7b543b076983d5ef9268c14b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'command_data)))
  "Returns md5sum for a message object of type 'command_data"
  "978bbee7b543b076983d5ef9268c14b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<command_data>)))
  "Returns full string definition for message of type '<command_data>"
  (cl:format cl:nil "float32 aileron~%float32 elevator~%float32 rudder~%float32 throttle~%float32 reached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'command_data)))
  "Returns full string definition for message of type 'command_data"
  (cl:format cl:nil "float32 aileron~%float32 elevator~%float32 rudder~%float32 throttle~%float32 reached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <command_data>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <command_data>))
  "Converts a ROS message object to a list"
  (cl:list 'command_data
    (cl:cons ':aileron (aileron msg))
    (cl:cons ':elevator (elevator msg))
    (cl:cons ':rudder (rudder msg))
    (cl:cons ':throttle (throttle msg))
    (cl:cons ':reached (reached msg))
))
