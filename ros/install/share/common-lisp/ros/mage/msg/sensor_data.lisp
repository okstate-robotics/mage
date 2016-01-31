; Auto-generated. Do not edit!


(cl:in-package mage-msg)


;//! \htmlinclude sensor_data.msg.html

(cl:defclass <sensor_data> (roslisp-msg-protocol:ros-message)
  ((Pos_n
    :reader Pos_n
    :initarg :Pos_n
    :type cl:float
    :initform 0.0)
   (Pos_e
    :reader Pos_e
    :initarg :Pos_e
    :type cl:float
    :initform 0.0)
   (Pos_d
    :reader Pos_d
    :initarg :Pos_d
    :type cl:float
    :initform 0.0)
   (V_n_ms
    :reader V_n_ms
    :initarg :V_n_ms
    :type cl:float
    :initform 0.0)
   (V_e_ms
    :reader V_e_ms
    :initarg :V_e_ms
    :type cl:float
    :initform 0.0)
   (V_d_ms
    :reader V_d_ms
    :initarg :V_d_ms
    :type cl:float
    :initform 0.0)
   (u
    :reader u
    :initarg :u
    :type cl:float
    :initform 0.0)
   (v
    :reader v
    :initarg :v
    :type cl:float
    :initform 0.0)
   (w
    :reader w
    :initarg :w
    :type cl:float
    :initform 0.0)
   (roll_deg
    :reader roll_deg
    :initarg :roll_deg
    :type cl:float
    :initform 0.0)
   (pitch_deg
    :reader pitch_deg
    :initarg :pitch_deg
    :type cl:float
    :initform 0.0)
   (yaw_deg
    :reader yaw_deg
    :initarg :yaw_deg
    :type cl:float
    :initform 0.0)
   (p_body
    :reader p_body
    :initarg :p_body
    :type cl:float
    :initform 0.0)
   (q_body
    :reader q_body
    :initarg :q_body
    :type cl:float
    :initform 0.0)
   (r_body
    :reader r_body
    :initarg :r_body
    :type cl:float
    :initform 0.0)
   (V_airspeed
    :reader V_airspeed
    :initarg :V_airspeed
    :type cl:float
    :initform 0.0)
   (course
    :reader course
    :initarg :course
    :type cl:float
    :initform 0.0)
   (ki_x
    :reader ki_x
    :initarg :ki_x
    :type cl:float
    :initform 0.0)
   (ki_y
    :reader ki_y
    :initarg :ki_y
    :type cl:float
    :initform 0.0)
   (ki_z
    :reader ki_z
    :initarg :ki_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass sensor_data (<sensor_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sensor_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sensor_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mage-msg:<sensor_data> is deprecated: use mage-msg:sensor_data instead.")))

(cl:ensure-generic-function 'Pos_n-val :lambda-list '(m))
(cl:defmethod Pos_n-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:Pos_n-val is deprecated.  Use mage-msg:Pos_n instead.")
  (Pos_n m))

(cl:ensure-generic-function 'Pos_e-val :lambda-list '(m))
(cl:defmethod Pos_e-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:Pos_e-val is deprecated.  Use mage-msg:Pos_e instead.")
  (Pos_e m))

(cl:ensure-generic-function 'Pos_d-val :lambda-list '(m))
(cl:defmethod Pos_d-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:Pos_d-val is deprecated.  Use mage-msg:Pos_d instead.")
  (Pos_d m))

(cl:ensure-generic-function 'V_n_ms-val :lambda-list '(m))
(cl:defmethod V_n_ms-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:V_n_ms-val is deprecated.  Use mage-msg:V_n_ms instead.")
  (V_n_ms m))

(cl:ensure-generic-function 'V_e_ms-val :lambda-list '(m))
(cl:defmethod V_e_ms-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:V_e_ms-val is deprecated.  Use mage-msg:V_e_ms instead.")
  (V_e_ms m))

(cl:ensure-generic-function 'V_d_ms-val :lambda-list '(m))
(cl:defmethod V_d_ms-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:V_d_ms-val is deprecated.  Use mage-msg:V_d_ms instead.")
  (V_d_ms m))

(cl:ensure-generic-function 'u-val :lambda-list '(m))
(cl:defmethod u-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:u-val is deprecated.  Use mage-msg:u instead.")
  (u m))

(cl:ensure-generic-function 'v-val :lambda-list '(m))
(cl:defmethod v-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:v-val is deprecated.  Use mage-msg:v instead.")
  (v m))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:w-val is deprecated.  Use mage-msg:w instead.")
  (w m))

(cl:ensure-generic-function 'roll_deg-val :lambda-list '(m))
(cl:defmethod roll_deg-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:roll_deg-val is deprecated.  Use mage-msg:roll_deg instead.")
  (roll_deg m))

(cl:ensure-generic-function 'pitch_deg-val :lambda-list '(m))
(cl:defmethod pitch_deg-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:pitch_deg-val is deprecated.  Use mage-msg:pitch_deg instead.")
  (pitch_deg m))

(cl:ensure-generic-function 'yaw_deg-val :lambda-list '(m))
(cl:defmethod yaw_deg-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:yaw_deg-val is deprecated.  Use mage-msg:yaw_deg instead.")
  (yaw_deg m))

(cl:ensure-generic-function 'p_body-val :lambda-list '(m))
(cl:defmethod p_body-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:p_body-val is deprecated.  Use mage-msg:p_body instead.")
  (p_body m))

(cl:ensure-generic-function 'q_body-val :lambda-list '(m))
(cl:defmethod q_body-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:q_body-val is deprecated.  Use mage-msg:q_body instead.")
  (q_body m))

(cl:ensure-generic-function 'r_body-val :lambda-list '(m))
(cl:defmethod r_body-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:r_body-val is deprecated.  Use mage-msg:r_body instead.")
  (r_body m))

(cl:ensure-generic-function 'V_airspeed-val :lambda-list '(m))
(cl:defmethod V_airspeed-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:V_airspeed-val is deprecated.  Use mage-msg:V_airspeed instead.")
  (V_airspeed m))

(cl:ensure-generic-function 'course-val :lambda-list '(m))
(cl:defmethod course-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:course-val is deprecated.  Use mage-msg:course instead.")
  (course m))

(cl:ensure-generic-function 'ki_x-val :lambda-list '(m))
(cl:defmethod ki_x-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:ki_x-val is deprecated.  Use mage-msg:ki_x instead.")
  (ki_x m))

(cl:ensure-generic-function 'ki_y-val :lambda-list '(m))
(cl:defmethod ki_y-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:ki_y-val is deprecated.  Use mage-msg:ki_y instead.")
  (ki_y m))

(cl:ensure-generic-function 'ki_z-val :lambda-list '(m))
(cl:defmethod ki_z-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mage-msg:ki_z-val is deprecated.  Use mage-msg:ki_z instead.")
  (ki_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sensor_data>) ostream)
  "Serializes a message object of type '<sensor_data>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pos_n))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pos_e))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pos_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'V_n_ms))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'V_e_ms))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'V_d_ms))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'p_body))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'q_body))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r_body))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'V_airspeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'course))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ki_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ki_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ki_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sensor_data>) istream)
  "Deserializes a message object of type '<sensor_data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pos_n) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pos_e) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pos_d) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'V_n_ms) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'V_e_ms) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'V_d_ms) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'w) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_deg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_deg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_deg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p_body) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q_body) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_body) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'V_airspeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'course) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ki_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ki_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ki_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sensor_data>)))
  "Returns string type for a message object of type '<sensor_data>"
  "mage/sensor_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sensor_data)))
  "Returns string type for a message object of type 'sensor_data"
  "mage/sensor_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sensor_data>)))
  "Returns md5sum for a message object of type '<sensor_data>"
  "332eb78f3f1acad4b5dd698366d5ed2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sensor_data)))
  "Returns md5sum for a message object of type 'sensor_data"
  "332eb78f3f1acad4b5dd698366d5ed2d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sensor_data>)))
  "Returns full string definition for message of type '<sensor_data>"
  (cl:format cl:nil "float32 Pos_n~%float32 Pos_e~%float32 Pos_d~%float32 V_n_ms~%float32 V_e_ms~%float32 V_d_ms~%float32 u~%float32 v~%float32 w~%float32 roll_deg~%float32 pitch_deg~%float32 yaw_deg~%float32 p_body~%float32 q_body~%float32 r_body~%float32 V_airspeed~%float32 course~%float32 ki_x~%float32 ki_y~%float32 ki_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sensor_data)))
  "Returns full string definition for message of type 'sensor_data"
  (cl:format cl:nil "float32 Pos_n~%float32 Pos_e~%float32 Pos_d~%float32 V_n_ms~%float32 V_e_ms~%float32 V_d_ms~%float32 u~%float32 v~%float32 w~%float32 roll_deg~%float32 pitch_deg~%float32 yaw_deg~%float32 p_body~%float32 q_body~%float32 r_body~%float32 V_airspeed~%float32 course~%float32 ki_x~%float32 ki_y~%float32 ki_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sensor_data>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sensor_data>))
  "Converts a ROS message object to a list"
  (cl:list 'sensor_data
    (cl:cons ':Pos_n (Pos_n msg))
    (cl:cons ':Pos_e (Pos_e msg))
    (cl:cons ':Pos_d (Pos_d msg))
    (cl:cons ':V_n_ms (V_n_ms msg))
    (cl:cons ':V_e_ms (V_e_ms msg))
    (cl:cons ':V_d_ms (V_d_ms msg))
    (cl:cons ':u (u msg))
    (cl:cons ':v (v msg))
    (cl:cons ':w (w msg))
    (cl:cons ':roll_deg (roll_deg msg))
    (cl:cons ':pitch_deg (pitch_deg msg))
    (cl:cons ':yaw_deg (yaw_deg msg))
    (cl:cons ':p_body (p_body msg))
    (cl:cons ':q_body (q_body msg))
    (cl:cons ':r_body (r_body msg))
    (cl:cons ':V_airspeed (V_airspeed msg))
    (cl:cons ':course (course msg))
    (cl:cons ':ki_x (ki_x msg))
    (cl:cons ':ki_y (ki_y msg))
    (cl:cons ':ki_z (ki_z msg))
))
