; Auto-generated. Do not edit!


(cl:in-package mage-srv)


;//! \htmlinclude model_data-request.msg.html

(cl:defclass <model_data-request> (roslisp-msg-protocol:ros-message)
  ((p
    :reader p
    :initarg :p
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass model_data-request (<model_data-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <model_data-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'model_data-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<model_data-request> is deprecated: use mage-srv:model_data-request instead.")))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <model_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:p-val is deprecated.  Use mage-srv:p instead.")
  (p m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <model_data-request>) ostream)
  "Serializes a message object of type '<model_data-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'p))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <model_data-request>) istream)
  "Deserializes a message object of type '<model_data-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'p) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'p)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<model_data-request>)))
  "Returns string type for a service object of type '<model_data-request>"
  "mage/model_dataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'model_data-request)))
  "Returns string type for a service object of type 'model_data-request"
  "mage/model_dataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<model_data-request>)))
  "Returns md5sum for a message object of type '<model_data-request>"
  "d6d9b942834d28e624aa435306692dcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'model_data-request)))
  "Returns md5sum for a message object of type 'model_data-request"
  "d6d9b942834d28e624aa435306692dcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<model_data-request>)))
  "Returns full string definition for message of type '<model_data-request>"
  (cl:format cl:nil "float64[] p~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'model_data-request)))
  "Returns full string definition for message of type 'model_data-request"
  (cl:format cl:nil "float64[] p~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <model_data-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <model_data-request>))
  "Converts a ROS message object to a list"
  (cl:list 'model_data-request
    (cl:cons ':p (p msg))
))
;//! \htmlinclude model_data-response.msg.html

(cl:defclass <model_data-response> (roslisp-msg-protocol:ros-message)
  ((sensor_value
    :reader sensor_value
    :initarg :sensor_value
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass model_data-response (<model_data-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <model_data-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'model_data-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<model_data-response> is deprecated: use mage-srv:model_data-response instead.")))

(cl:ensure-generic-function 'sensor_value-val :lambda-list '(m))
(cl:defmethod sensor_value-val ((m <model_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:sensor_value-val is deprecated.  Use mage-srv:sensor_value instead.")
  (sensor_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <model_data-response>) ostream)
  "Serializes a message object of type '<model_data-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sensor_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'sensor_value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <model_data-response>) istream)
  "Deserializes a message object of type '<model_data-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sensor_value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sensor_value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<model_data-response>)))
  "Returns string type for a service object of type '<model_data-response>"
  "mage/model_dataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'model_data-response)))
  "Returns string type for a service object of type 'model_data-response"
  "mage/model_dataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<model_data-response>)))
  "Returns md5sum for a message object of type '<model_data-response>"
  "d6d9b942834d28e624aa435306692dcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'model_data-response)))
  "Returns md5sum for a message object of type 'model_data-response"
  "d6d9b942834d28e624aa435306692dcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<model_data-response>)))
  "Returns full string definition for message of type '<model_data-response>"
  (cl:format cl:nil "float64[] sensor_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'model_data-response)))
  "Returns full string definition for message of type 'model_data-response"
  (cl:format cl:nil "float64[] sensor_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <model_data-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sensor_value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <model_data-response>))
  "Converts a ROS message object to a list"
  (cl:list 'model_data-response
    (cl:cons ':sensor_value (sensor_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'model_data)))
  'model_data-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'model_data)))
  'model_data-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'model_data)))
  "Returns string type for a service object of type '<model_data>"
  "mage/model_data")