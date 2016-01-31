;; Auto-generated. Do not edit!


(when (boundp 'mage::navigation_data)
  (if (not (find-package "MAGE"))
    (make-package "MAGE"))
  (shadow 'navigation_data (find-package "MAGE")))
(unless (find-package "MAGE::NAVIGATION_DATA")
  (make-package "MAGE::NAVIGATION_DATA"))
(unless (find-package "MAGE::NAVIGATION_DATAREQUEST")
  (make-package "MAGE::NAVIGATION_DATAREQUEST"))
(unless (find-package "MAGE::NAVIGATION_DATARESPONSE")
  (make-package "MAGE::NAVIGATION_DATARESPONSE"))

(in-package "ROS")





(defclass mage::navigation_dataRequest
  :super ros::object
  :slots (_P ))

(defmethod mage::navigation_dataRequest
  (:init
   (&key
    ((:P __P) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _P __P)
   self)
  (:P
   (&optional __P)
   (if __P (setq _P __P)) _P)
  (:serialization-length
   ()
   (+
    ;; float32[] _P
    (* 4    (length _P)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _P
     (write-long (length _P) s)
     (dotimes (i (length _P))
       (sys::poke (elt _P i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _P
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _P (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _P i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass mage::navigation_dataResponse
  :super ros::object
  :slots (_Ps_x _Ps_y _Ps_z _Ps_course _Pe_x _Pe_y _Pe_z _Pe_course ))

(defmethod mage::navigation_dataResponse
  (:init
   (&key
    ((:Ps_x __Ps_x) 0.0)
    ((:Ps_y __Ps_y) 0.0)
    ((:Ps_z __Ps_z) 0.0)
    ((:Ps_course __Ps_course) 0.0)
    ((:Pe_x __Pe_x) 0.0)
    ((:Pe_y __Pe_y) 0.0)
    ((:Pe_z __Pe_z) 0.0)
    ((:Pe_course __Pe_course) 0.0)
    )
   (send-super :init)
   (setq _Ps_x (float __Ps_x))
   (setq _Ps_y (float __Ps_y))
   (setq _Ps_z (float __Ps_z))
   (setq _Ps_course (float __Ps_course))
   (setq _Pe_x (float __Pe_x))
   (setq _Pe_y (float __Pe_y))
   (setq _Pe_z (float __Pe_z))
   (setq _Pe_course (float __Pe_course))
   self)
  (:Ps_x
   (&optional __Ps_x)
   (if __Ps_x (setq _Ps_x __Ps_x)) _Ps_x)
  (:Ps_y
   (&optional __Ps_y)
   (if __Ps_y (setq _Ps_y __Ps_y)) _Ps_y)
  (:Ps_z
   (&optional __Ps_z)
   (if __Ps_z (setq _Ps_z __Ps_z)) _Ps_z)
  (:Ps_course
   (&optional __Ps_course)
   (if __Ps_course (setq _Ps_course __Ps_course)) _Ps_course)
  (:Pe_x
   (&optional __Pe_x)
   (if __Pe_x (setq _Pe_x __Pe_x)) _Pe_x)
  (:Pe_y
   (&optional __Pe_y)
   (if __Pe_y (setq _Pe_y __Pe_y)) _Pe_y)
  (:Pe_z
   (&optional __Pe_z)
   (if __Pe_z (setq _Pe_z __Pe_z)) _Pe_z)
  (:Pe_course
   (&optional __Pe_course)
   (if __Pe_course (setq _Pe_course __Pe_course)) _Pe_course)
  (:serialization-length
   ()
   (+
    ;; float32 _Ps_x
    4
    ;; float32 _Ps_y
    4
    ;; float32 _Ps_z
    4
    ;; float32 _Ps_course
    4
    ;; float32 _Pe_x
    4
    ;; float32 _Pe_y
    4
    ;; float32 _Pe_z
    4
    ;; float32 _Pe_course
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Ps_x
       (sys::poke _Ps_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Ps_y
       (sys::poke _Ps_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Ps_z
       (sys::poke _Ps_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Ps_course
       (sys::poke _Ps_course (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pe_x
       (sys::poke _Pe_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pe_y
       (sys::poke _Pe_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pe_z
       (sys::poke _Pe_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pe_course
       (sys::poke _Pe_course (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Ps_x
     (setq _Ps_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Ps_y
     (setq _Ps_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Ps_z
     (setq _Ps_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Ps_course
     (setq _Ps_course (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pe_x
     (setq _Pe_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pe_y
     (setq _Pe_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pe_z
     (setq _Pe_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pe_course
     (setq _Pe_course (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mage::navigation_data
  :super ros::object
  :slots ())

(setf (get mage::navigation_data :md5sum-) "ed4b37e8ae38706e3abd169327717ac6")
(setf (get mage::navigation_data :datatype-) "mage/navigation_data")
(setf (get mage::navigation_data :request) mage::navigation_dataRequest)
(setf (get mage::navigation_data :response) mage::navigation_dataResponse)

(defmethod mage::navigation_dataRequest
  (:response () (instance mage::navigation_dataResponse :init)))

(setf (get mage::navigation_dataRequest :md5sum-) "ed4b37e8ae38706e3abd169327717ac6")
(setf (get mage::navigation_dataRequest :datatype-) "mage/navigation_dataRequest")
(setf (get mage::navigation_dataRequest :definition-)
      "float32[] P
---
float32 Ps_x
float32 Ps_y
float32 Ps_z
float32 Ps_course
float32 Pe_x
float32 Pe_y
float32 Pe_z
float32 Pe_course

")

(setf (get mage::navigation_dataResponse :md5sum-) "ed4b37e8ae38706e3abd169327717ac6")
(setf (get mage::navigation_dataResponse :datatype-) "mage/navigation_dataResponse")
(setf (get mage::navigation_dataResponse :definition-)
      "float32[] P
---
float32 Ps_x
float32 Ps_y
float32 Ps_z
float32 Ps_course
float32 Pe_x
float32 Pe_y
float32 Pe_z
float32 Pe_course

")



(provide :mage/navigation_data "ed4b37e8ae38706e3abd169327717ac6")


