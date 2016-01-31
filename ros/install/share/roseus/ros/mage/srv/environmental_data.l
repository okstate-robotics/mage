;; Auto-generated. Do not edit!


(when (boundp 'mage::environmental_data)
  (if (not (find-package "MAGE"))
    (make-package "MAGE"))
  (shadow 'environmental_data (find-package "MAGE")))
(unless (find-package "MAGE::ENVIRONMENTAL_DATA")
  (make-package "MAGE::ENVIRONMENTAL_DATA"))
(unless (find-package "MAGE::ENVIRONMENTAL_DATAREQUEST")
  (make-package "MAGE::ENVIRONMENTAL_DATAREQUEST"))
(unless (find-package "MAGE::ENVIRONMENTAL_DATARESPONSE")
  (make-package "MAGE::ENVIRONMENTAL_DATARESPONSE"))

(in-package "ROS")





(defclass mage::environmental_dataRequest
  :super ros::object
  :slots (_p_x _p_y _p_z ))

(defmethod mage::environmental_dataRequest
  (:init
   (&key
    ((:p_x __p_x) 0.0)
    ((:p_y __p_y) 0.0)
    ((:p_z __p_z) 0.0)
    )
   (send-super :init)
   (setq _p_x (float __p_x))
   (setq _p_y (float __p_y))
   (setq _p_z (float __p_z))
   self)
  (:p_x
   (&optional __p_x)
   (if __p_x (setq _p_x __p_x)) _p_x)
  (:p_y
   (&optional __p_y)
   (if __p_y (setq _p_y __p_y)) _p_y)
  (:p_z
   (&optional __p_z)
   (if __p_z (setq _p_z __p_z)) _p_z)
  (:serialization-length
   ()
   (+
    ;; float32 _p_x
    4
    ;; float32 _p_y
    4
    ;; float32 _p_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _p_x
       (sys::poke _p_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _p_y
       (sys::poke _p_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _p_z
       (sys::poke _p_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _p_x
     (setq _p_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _p_y
     (setq _p_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _p_z
     (setq _p_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mage::environmental_dataResponse
  :super ros::object
  :slots (_sensor_value ))

(defmethod mage::environmental_dataResponse
  (:init
   (&key
    ((:sensor_value __sensor_value) 0.0)
    )
   (send-super :init)
   (setq _sensor_value (float __sensor_value))
   self)
  (:sensor_value
   (&optional __sensor_value)
   (if __sensor_value (setq _sensor_value __sensor_value)) _sensor_value)
  (:serialization-length
   ()
   (+
    ;; float32 _sensor_value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _sensor_value
       (sys::poke _sensor_value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _sensor_value
     (setq _sensor_value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mage::environmental_data
  :super ros::object
  :slots ())

(setf (get mage::environmental_data :md5sum-) "4ef3a687251f1ef34984fb98164db46b")
(setf (get mage::environmental_data :datatype-) "mage/environmental_data")
(setf (get mage::environmental_data :request) mage::environmental_dataRequest)
(setf (get mage::environmental_data :response) mage::environmental_dataResponse)

(defmethod mage::environmental_dataRequest
  (:response () (instance mage::environmental_dataResponse :init)))

(setf (get mage::environmental_dataRequest :md5sum-) "4ef3a687251f1ef34984fb98164db46b")
(setf (get mage::environmental_dataRequest :datatype-) "mage/environmental_dataRequest")
(setf (get mage::environmental_dataRequest :definition-)
      "float32 p_x
float32 p_y
float32 p_z
---
float32 sensor_value

")

(setf (get mage::environmental_dataResponse :md5sum-) "4ef3a687251f1ef34984fb98164db46b")
(setf (get mage::environmental_dataResponse :datatype-) "mage/environmental_dataResponse")
(setf (get mage::environmental_dataResponse :definition-)
      "float32 p_x
float32 p_y
float32 p_z
---
float32 sensor_value

")



(provide :mage/environmental_data "4ef3a687251f1ef34984fb98164db46b")


