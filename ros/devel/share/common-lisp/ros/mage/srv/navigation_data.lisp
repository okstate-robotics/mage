; Auto-generated. Do not edit!


(cl:in-package mage-srv)


;//! \htmlinclude navigation_data-request.msg.html

(cl:defclass <navigation_data-request> (roslisp-msg-protocol:ros-message)
  ((P_x
    :reader P_x
    :initarg :P_x
    :type cl:float
    :initform 0.0)
   (P_y
    :reader P_y
    :initarg :P_y
    :type cl:float
    :initform 0.0)
   (P_z
    :reader P_z
    :initarg :P_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass navigation_data-request (<navigation_data-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <navigation_data-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'navigation_data-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<navigation_data-request> is deprecated: use mage-srv:navigation_data-request instead.")))

(cl:ensure-generic-function 'P_x-val :lambda-list '(m))
(cl:defmethod P_x-val ((m <navigation_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:P_x-val is deprecated.  Use mage-srv:P_x instead.")
  (P_x m))

(cl:ensure-generic-function 'P_y-val :lambda-list '(m))
(cl:defmethod P_y-val ((m <navigation_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:P_y-val is deprecated.  Use mage-srv:P_y instead.")
  (P_y m))

(cl:ensure-generic-function 'P_z-val :lambda-list '(m))
(cl:defmethod P_z-val ((m <navigation_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:P_z-val is deprecated.  Use mage-srv:P_z instead.")
  (P_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <navigation_data-request>) ostream)
  "Serializes a message object of type '<navigation_data-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'P_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'P_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'P_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigation_data-request>) istream)
  "Deserializes a message object of type '<navigation_data-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'P_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'P_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'P_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<navigation_data-request>)))
  "Returns string type for a service object of type '<navigation_data-request>"
  "mage/navigation_dataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigation_data-request)))
  "Returns string type for a service object of type 'navigation_data-request"
  "mage/navigation_dataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<navigation_data-request>)))
  "Returns md5sum for a message object of type '<navigation_data-request>"
  "0c2ecba2b4dea08339c547de7a1ab232")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigation_data-request)))
  "Returns md5sum for a message object of type 'navigation_data-request"
  "0c2ecba2b4dea08339c547de7a1ab232")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigation_data-request>)))
  "Returns full string definition for message of type '<navigation_data-request>"
  (cl:format cl:nil "float64 P_x~%float64 P_y~%float64 P_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigation_data-request)))
  "Returns full string definition for message of type 'navigation_data-request"
  (cl:format cl:nil "float64 P_x~%float64 P_y~%float64 P_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigation_data-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <navigation_data-request>))
  "Converts a ROS message object to a list"
  (cl:list 'navigation_data-request
    (cl:cons ':P_x (P_x msg))
    (cl:cons ':P_y (P_y msg))
    (cl:cons ':P_z (P_z msg))
))
;//! \htmlinclude navigation_data-response.msg.html

(cl:defclass <navigation_data-response> (roslisp-msg-protocol:ros-message)
  ((Ps_x
    :reader Ps_x
    :initarg :Ps_x
    :type cl:float
    :initform 0.0)
   (Ps_y
    :reader Ps_y
    :initarg :Ps_y
    :type cl:float
    :initform 0.0)
   (Ps_z
    :reader Ps_z
    :initarg :Ps_z
    :type cl:float
    :initform 0.0)
   (Ps_course
    :reader Ps_course
    :initarg :Ps_course
    :type cl:float
    :initform 0.0)
   (Pe_x
    :reader Pe_x
    :initarg :Pe_x
    :type cl:float
    :initform 0.0)
   (Pe_y
    :reader Pe_y
    :initarg :Pe_y
    :type cl:float
    :initform 0.0)
   (Pe_z
    :reader Pe_z
    :initarg :Pe_z
    :type cl:float
    :initform 0.0)
   (Pe_course
    :reader Pe_course
    :initarg :Pe_course
    :type cl:float
    :initform 0.0))
)

(cl:defclass navigation_data-response (<navigation_data-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <navigation_data-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'navigation_data-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<navigation_data-response> is deprecated: use mage-srv:navigation_data-response instead.")))

(cl:ensure-generic-function 'Ps_x-val :lambda-list '(m))
(cl:defmethod Ps_x-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Ps_x-val is deprecated.  Use mage-srv:Ps_x instead.")
  (Ps_x m))

(cl:ensure-generic-function 'Ps_y-val :lambda-list '(m))
(cl:defmethod Ps_y-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Ps_y-val is deprecated.  Use mage-srv:Ps_y instead.")
  (Ps_y m))

(cl:ensure-generic-function 'Ps_z-val :lambda-list '(m))
(cl:defmethod Ps_z-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Ps_z-val is deprecated.  Use mage-srv:Ps_z instead.")
  (Ps_z m))

(cl:ensure-generic-function 'Ps_course-val :lambda-list '(m))
(cl:defmethod Ps_course-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Ps_course-val is deprecated.  Use mage-srv:Ps_course instead.")
  (Ps_course m))

(cl:ensure-generic-function 'Pe_x-val :lambda-list '(m))
(cl:defmethod Pe_x-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Pe_x-val is deprecated.  Use mage-srv:Pe_x instead.")
  (Pe_x m))

(cl:ensure-generic-function 'Pe_y-val :lambda-list '(m))
(cl:defmethod Pe_y-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Pe_y-val is deprecated.  Use mage-srv:Pe_y instead.")
  (Pe_y m))

(cl:ensure-generic-function 'Pe_z-val :lambda-list '(m))
(cl:defmethod Pe_z-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Pe_z-val is deprecated.  Use mage-srv:Pe_z instead.")
  (Pe_z m))

(cl:ensure-generic-function 'Pe_course-val :lambda-list '(m))
(cl:defmethod Pe_course-val ((m <navigation_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:Pe_course-val is deprecated.  Use mage-srv:Pe_course instead.")
  (Pe_course m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <navigation_data-response>) ostream)
  "Serializes a message object of type '<navigation_data-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Ps_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Ps_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Ps_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Ps_course))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Pe_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Pe_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Pe_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Pe_course))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigation_data-response>) istream)
  "Deserializes a message object of type '<navigation_data-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_course) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_course) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<navigation_data-response>)))
  "Returns string type for a service object of type '<navigation_data-response>"
  "mage/navigation_dataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigation_data-response)))
  "Returns string type for a service object of type 'navigation_data-response"
  "mage/navigation_dataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<navigation_data-response>)))
  "Returns md5sum for a message object of type '<navigation_data-response>"
  "0c2ecba2b4dea08339c547de7a1ab232")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigation_data-response)))
  "Returns md5sum for a message object of type 'navigation_data-response"
  "0c2ecba2b4dea08339c547de7a1ab232")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigation_data-response>)))
  "Returns full string definition for message of type '<navigation_data-response>"
  (cl:format cl:nil "float64 Ps_x~%float64 Ps_y~%float64 Ps_z~%float64 Ps_course~%float64 Pe_x~%float64 Pe_y~%float64 Pe_z~%float64 Pe_course~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigation_data-response)))
  "Returns full string definition for message of type 'navigation_data-response"
  (cl:format cl:nil "float64 Ps_x~%float64 Ps_y~%float64 Ps_z~%float64 Ps_course~%float64 Pe_x~%float64 Pe_y~%float64 Pe_z~%float64 Pe_course~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigation_data-response>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <navigation_data-response>))
  "Converts a ROS message object to a list"
  (cl:list 'navigation_data-response
    (cl:cons ':Ps_x (Ps_x msg))
    (cl:cons ':Ps_y (Ps_y msg))
    (cl:cons ':Ps_z (Ps_z msg))
    (cl:cons ':Ps_course (Ps_course msg))
    (cl:cons ':Pe_x (Pe_x msg))
    (cl:cons ':Pe_y (Pe_y msg))
    (cl:cons ':Pe_z (Pe_z msg))
    (cl:cons ':Pe_course (Pe_course msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'navigation_data)))
  'navigation_data-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'navigation_data)))
  'navigation_data-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigation_data)))
  "Returns string type for a service object of type '<navigation_data>"
  "mage/navigation_data")