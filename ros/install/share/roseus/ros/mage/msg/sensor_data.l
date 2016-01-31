;; Auto-generated. Do not edit!


(when (boundp 'mage::sensor_data)
  (if (not (find-package "MAGE"))
    (make-package "MAGE"))
  (shadow 'sensor_data (find-package "MAGE")))
(unless (find-package "MAGE::SENSOR_DATA")
  (make-package "MAGE::SENSOR_DATA"))

(in-package "ROS")
;;//! \htmlinclude sensor_data.msg.html


(defclass mage::sensor_data
  :super ros::object
  :slots (_Pos_n _Pos_e _Pos_d _V_n_ms _V_e_ms _V_d_ms _u _v _w _roll_deg _pitch_deg _yaw_deg _p_body _q_body _r_body _V_airspeed _course _ki_x _ki_y _ki_z ))

(defmethod mage::sensor_data
  (:init
   (&key
    ((:Pos_n __Pos_n) 0.0)
    ((:Pos_e __Pos_e) 0.0)
    ((:Pos_d __Pos_d) 0.0)
    ((:V_n_ms __V_n_ms) 0.0)
    ((:V_e_ms __V_e_ms) 0.0)
    ((:V_d_ms __V_d_ms) 0.0)
    ((:u __u) 0.0)
    ((:v __v) 0.0)
    ((:w __w) 0.0)
    ((:roll_deg __roll_deg) 0.0)
    ((:pitch_deg __pitch_deg) 0.0)
    ((:yaw_deg __yaw_deg) 0.0)
    ((:p_body __p_body) 0.0)
    ((:q_body __q_body) 0.0)
    ((:r_body __r_body) 0.0)
    ((:V_airspeed __V_airspeed) 0.0)
    ((:course __course) 0.0)
    ((:ki_x __ki_x) 0.0)
    ((:ki_y __ki_y) 0.0)
    ((:ki_z __ki_z) 0.0)
    )
   (send-super :init)
   (setq _Pos_n (float __Pos_n))
   (setq _Pos_e (float __Pos_e))
   (setq _Pos_d (float __Pos_d))
   (setq _V_n_ms (float __V_n_ms))
   (setq _V_e_ms (float __V_e_ms))
   (setq _V_d_ms (float __V_d_ms))
   (setq _u (float __u))
   (setq _v (float __v))
   (setq _w (float __w))
   (setq _roll_deg (float __roll_deg))
   (setq _pitch_deg (float __pitch_deg))
   (setq _yaw_deg (float __yaw_deg))
   (setq _p_body (float __p_body))
   (setq _q_body (float __q_body))
   (setq _r_body (float __r_body))
   (setq _V_airspeed (float __V_airspeed))
   (setq _course (float __course))
   (setq _ki_x (float __ki_x))
   (setq _ki_y (float __ki_y))
   (setq _ki_z (float __ki_z))
   self)
  (:Pos_n
   (&optional __Pos_n)
   (if __Pos_n (setq _Pos_n __Pos_n)) _Pos_n)
  (:Pos_e
   (&optional __Pos_e)
   (if __Pos_e (setq _Pos_e __Pos_e)) _Pos_e)
  (:Pos_d
   (&optional __Pos_d)
   (if __Pos_d (setq _Pos_d __Pos_d)) _Pos_d)
  (:V_n_ms
   (&optional __V_n_ms)
   (if __V_n_ms (setq _V_n_ms __V_n_ms)) _V_n_ms)
  (:V_e_ms
   (&optional __V_e_ms)
   (if __V_e_ms (setq _V_e_ms __V_e_ms)) _V_e_ms)
  (:V_d_ms
   (&optional __V_d_ms)
   (if __V_d_ms (setq _V_d_ms __V_d_ms)) _V_d_ms)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:roll_deg
   (&optional __roll_deg)
   (if __roll_deg (setq _roll_deg __roll_deg)) _roll_deg)
  (:pitch_deg
   (&optional __pitch_deg)
   (if __pitch_deg (setq _pitch_deg __pitch_deg)) _pitch_deg)
  (:yaw_deg
   (&optional __yaw_deg)
   (if __yaw_deg (setq _yaw_deg __yaw_deg)) _yaw_deg)
  (:p_body
   (&optional __p_body)
   (if __p_body (setq _p_body __p_body)) _p_body)
  (:q_body
   (&optional __q_body)
   (if __q_body (setq _q_body __q_body)) _q_body)
  (:r_body
   (&optional __r_body)
   (if __r_body (setq _r_body __r_body)) _r_body)
  (:V_airspeed
   (&optional __V_airspeed)
   (if __V_airspeed (setq _V_airspeed __V_airspeed)) _V_airspeed)
  (:course
   (&optional __course)
   (if __course (setq _course __course)) _course)
  (:ki_x
   (&optional __ki_x)
   (if __ki_x (setq _ki_x __ki_x)) _ki_x)
  (:ki_y
   (&optional __ki_y)
   (if __ki_y (setq _ki_y __ki_y)) _ki_y)
  (:ki_z
   (&optional __ki_z)
   (if __ki_z (setq _ki_z __ki_z)) _ki_z)
  (:serialization-length
   ()
   (+
    ;; float32 _Pos_n
    4
    ;; float32 _Pos_e
    4
    ;; float32 _Pos_d
    4
    ;; float32 _V_n_ms
    4
    ;; float32 _V_e_ms
    4
    ;; float32 _V_d_ms
    4
    ;; float32 _u
    4
    ;; float32 _v
    4
    ;; float32 _w
    4
    ;; float32 _roll_deg
    4
    ;; float32 _pitch_deg
    4
    ;; float32 _yaw_deg
    4
    ;; float32 _p_body
    4
    ;; float32 _q_body
    4
    ;; float32 _r_body
    4
    ;; float32 _V_airspeed
    4
    ;; float32 _course
    4
    ;; float32 _ki_x
    4
    ;; float32 _ki_y
    4
    ;; float32 _ki_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Pos_n
       (sys::poke _Pos_n (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pos_e
       (sys::poke _Pos_e (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pos_d
       (sys::poke _Pos_d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _V_n_ms
       (sys::poke _V_n_ms (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _V_e_ms
       (sys::poke _V_e_ms (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _V_d_ms
       (sys::poke _V_d_ms (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u
       (sys::poke _u (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v
       (sys::poke _v (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll_deg
       (sys::poke _roll_deg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch_deg
       (sys::poke _pitch_deg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_deg
       (sys::poke _yaw_deg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _p_body
       (sys::poke _p_body (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q_body
       (sys::poke _q_body (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _r_body
       (sys::poke _r_body (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _V_airspeed
       (sys::poke _V_airspeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _course
       (sys::poke _course (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ki_x
       (sys::poke _ki_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ki_y
       (sys::poke _ki_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ki_z
       (sys::poke _ki_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Pos_n
     (setq _Pos_n (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pos_e
     (setq _Pos_e (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pos_d
     (setq _Pos_d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _V_n_ms
     (setq _V_n_ms (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _V_e_ms
     (setq _V_e_ms (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _V_d_ms
     (setq _V_d_ms (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u
     (setq _u (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v
     (setq _v (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll_deg
     (setq _roll_deg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch_deg
     (setq _pitch_deg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_deg
     (setq _yaw_deg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _p_body
     (setq _p_body (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q_body
     (setq _q_body (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _r_body
     (setq _r_body (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _V_airspeed
     (setq _V_airspeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _course
     (setq _course (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ki_x
     (setq _ki_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ki_y
     (setq _ki_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ki_z
     (setq _ki_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mage::sensor_data :md5sum-) "332eb78f3f1acad4b5dd698366d5ed2d")
(setf (get mage::sensor_data :datatype-) "mage/sensor_data")
(setf (get mage::sensor_data :definition-)
      "float32 Pos_n
float32 Pos_e
float32 Pos_d
float32 V_n_ms
float32 V_e_ms
float32 V_d_ms
float32 u
float32 v
float32 w
float32 roll_deg
float32 pitch_deg
float32 yaw_deg
float32 p_body
float32 q_body
float32 r_body
float32 V_airspeed
float32 course
float32 ki_x
float32 ki_y
float32 ki_z


")



(provide :mage/sensor_data "332eb78f3f1acad4b5dd698366d5ed2d")


