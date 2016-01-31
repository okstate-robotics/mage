; Auto-generated. Do not edit!


(cl:in-package mage-srv)


;//! \htmlinclude environmental_data-request.msg.html

(cl:defclass <environmental_data-request> (roslisp-msg-protocol:ros-message)
  ((p_x
    :reader p_x
    :initarg :p_x
    :type cl:float
    :initform 0.0)
   (p_y
    :reader p_y
    :initarg :p_y
    :type cl:float
    :initform 0.0)
   (p_z
    :reader p_z
    :initarg :p_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass environmental_data-request (<environmental_data-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <environmental_data-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'environmental_data-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<environmental_data-request> is deprecated: use mage-srv:environmental_data-request instead.")))

(cl:ensure-generic-function 'p_x-val :lambda-list '(m))
(cl:defmethod p_x-val ((m <environmental_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:p_x-val is deprecated.  Use mage-srv:p_x instead.")
  (p_x m))

(cl:ensure-generic-function 'p_y-val :lambda-list '(m))
(cl:defmethod p_y-val ((m <environmental_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:p_y-val is deprecated.  Use mage-srv:p_y instead.")
  (p_y m))

(cl:ensure-generic-function 'p_z-val :lambda-list '(m))
(cl:defmethod p_z-val ((m <environmental_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:p_z-val is deprecated.  Use mage-srv:p_z instead.")
  (p_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <environmental_data-request>) ostream)
  "Serializes a message object of type '<environmental_data-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'p_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'p_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'p_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <environmental_data-request>) istream)
  "Deserializes a message object of type '<environmental_data-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<environmental_data-request>)))
  "Returns string type for a service object of type '<environmental_data-request>"
  "mage/environmental_dataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'environmental_data-request)))
  "Returns string type for a service object of type 'environmental_data-request"
  "mage/environmental_dataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<environmental_data-request>)))
  "Returns md5sum for a message object of type '<environmental_data-request>"
  "4ef3a687251f1ef34984fb98164db46b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'environmental_data-request)))
  "Returns md5sum for a message object of type 'environmental_data-request"
  "4ef3a687251f1ef34984fb98164db46b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<environmental_data-request>)))
  "Returns full string definition for message of type '<environmental_data-request>"
  (cl:format cl:nil "float32 p_x~%float32 p_y~%float32 p_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'environmental_data-request)))
  "Returns full string definition for message of type 'environmental_data-request"
  (cl:format cl:nil "float32 p_x~%float32 p_y~%float32 p_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <environmental_data-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <environmental_data-request>))
  "Converts a ROS message object to a list"
  (cl:list 'environmental_data-request
    (cl:cons ':p_x (p_x msg))
    (cl:cons ':p_y (p_y msg))
    (cl:cons ':p_z (p_z msg))
))
;//! \htmlinclude environmental_data-response.msg.html

(cl:defclass <environmental_data-response> (roslisp-msg-protocol:ros-message)
  ((sensor_value
    :reader sensor_value
    :initarg :sensor_value
    :type cl:float
    :initform 0.0))
)

(cl:defclass environmental_data-response (<environmental_data-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <environmental_data-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'environmental_data-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<environmental_data-response> is deprecated: use mage-srv:environmental_data-response instead.")))

(cl:ensure-generic-function 'sensor_value-val :lambda-list '(m))
(cl:defmethod sensor_value-val ((m <environmental_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:sensor_value-val is deprecated.  Use mage-srv:sensor_value instead.")
  (sensor_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <environmental_data-response>) ostream)
  "Serializes a message object of type '<environmental_data-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sensor_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <environmental_data-response>) istream)
  "Deserializes a message object of type '<environmental_data-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sensor_value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<environmental_data-response>)))
  "Returns string type for a service object of type '<environmental_data-response>"
  "mage/environmental_dataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'environmental_data-response)))
  "Returns string type for a service object of type 'environmental_data-response"
  "mage/environmental_dataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<environmental_data-response>)))
  "Returns md5sum for a message object of type '<environmental_data-response>"
  "4ef3a687251f1ef34984fb98164db46b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'environmental_data-response)))
  "Returns md5sum for a message object of type 'environmental_data-response"
  "4ef3a687251f1ef34984fb98164db46b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<environmental_data-response>)))
  "Returns full string definition for message of type '<environmental_data-response>"
  (cl:format cl:nil "float32 sensor_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'environmental_data-response)))
  "Returns full string definition for message of type 'environmental_data-response"
  (cl:format cl:nil "float32 sensor_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <environmental_data-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <environmental_data-response>))
  "Converts a ROS message object to a list"
  (cl:list 'environmental_data-response
    (cl:cons ':sensor_value (sensor_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'environmental_data)))
  'environmental_data-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'environmental_data)))
  'environmental_data-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'environmental_data)))
  "Returns string type for a service object of type '<environmental_data>"
  "mage/environmental_data")