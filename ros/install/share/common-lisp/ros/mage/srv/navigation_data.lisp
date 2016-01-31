; Auto-generated. Do not edit!


(cl:in-package mage-srv)


;//! \htmlinclude navigation_data-request.msg.html

(cl:defclass <navigation_data-request> (roslisp-msg-protocol:ros-message)
  ((P
    :reader P
    :initarg :P
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass navigation_data-request (<navigation_data-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <navigation_data-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'navigation_data-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-srv:<navigation_data-request> is deprecated: use mage-srv:navigation_data-request instead.")))

(cl:ensure-generic-function 'P-val :lambda-list '(m))
(cl:defmethod P-val ((m <navigation_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-srv:P-val is deprecated.  Use mage-srv:P instead.")
  (P m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <navigation_data-request>) ostream)
  "Serializes a message object of type '<navigation_data-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'P))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigation_data-request>) istream)
  "Deserializes a message object of type '<navigation_data-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'P) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'P)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
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
  "ed4b37e8ae38706e3abd169327717ac6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigation_data-request)))
  "Returns md5sum for a message object of type 'navigation_data-request"
  "ed4b37e8ae38706e3abd169327717ac6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigation_data-request>)))
  "Returns full string definition for message of type '<navigation_data-request>"
  (cl:format cl:nil "float32[] P~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigation_data-request)))
  "Returns full string definition for message of type 'navigation_data-request"
  (cl:format cl:nil "float32[] P~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigation_data-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'P) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <navigation_data-request>))
  "Converts a ROS message object to a list"
  (cl:list 'navigation_data-request
    (cl:cons ':P (P msg))
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ps_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ps_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ps_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ps_course))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pe_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pe_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pe_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pe_course))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigation_data-response>) istream)
  "Deserializes a message object of type '<navigation_data-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ps_course) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pe_course) (roslisp-utils:decode-single-float-bits bits)))
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
  "ed4b37e8ae38706e3abd169327717ac6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigation_data-response)))
  "Returns md5sum for a message object of type 'navigation_data-response"
  "ed4b37e8ae38706e3abd169327717ac6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigation_data-response>)))
  "Returns full string definition for message of type '<navigation_data-response>"
  (cl:format cl:nil "float32 Ps_x~%float32 Ps_y~%float32 Ps_z~%float32 Ps_course~%float32 Pe_x~%float32 Pe_y~%float32 Pe_z~%float32 Pe_course~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigation_data-response)))
  "Returns full string definition for message of type 'navigation_data-response"
  (cl:format cl:nil "float32 Ps_x~%float32 Ps_y~%float32 Ps_z~%float32 Ps_course~%float32 Pe_x~%float32 Pe_y~%float32 Pe_z~%float32 Pe_course~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigation_data-response>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
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