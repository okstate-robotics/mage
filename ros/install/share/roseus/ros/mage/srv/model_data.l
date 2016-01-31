;; Auto-generated. Do not edit!


(when (boundp 'mage::model_data)
  (if (not (find-package "MAGE"))
    (make-package "MAGE"))
  (shadow 'model_data (find-package "MAGE")))
(unless (find-package "MAGE::MODEL_DATA")
  (make-package "MAGE::MODEL_DATA"))
(unless (find-package "MAGE::MODEL_DATAREQUEST")
  (make-package "MAGE::MODEL_DATAREQUEST"))
(unless (find-package "MAGE::MODEL_DATARESPONSE")
  (make-package "MAGE::MODEL_DATARESPONSE"))

(in-package "ROS")





(defclass mage::model_dataRequest
  :super ros::object
  :slots (_p ))

(defmethod mage::model_dataRequest
  (:init
   (&key
    ((:p __p) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _p __p)
   self)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:serialization-length
   ()
   (+
    ;; float32[] _p
    (* 4    (length _p)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _p
     (write-long (length _p) s)
     (dotimes (i (length _p))
       (sys::poke (elt _p i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _p
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _p (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _p i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass mage::model_dataResponse
  :super ros::object
  :slots (_sensor_value ))

(defmethod mage::model_dataResponse
  (:init
   (&key
    ((:sensor_value __sensor_value) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _sensor_value __sensor_value)
   self)
  (:sensor_value
   (&optional __sensor_value)
   (if __sensor_value (setq _sensor_value __sensor_value)) _sensor_value)
  (:serialization-length
   ()
   (+
    ;; float32[] _sensor_value
    (* 4    (length _sensor_value)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _sensor_value
     (write-long (length _sensor_value) s)
     (dotimes (i (length _sensor_value))
       (sys::poke (elt _sensor_value i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _sensor_value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sensor_value (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sensor_value i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass mage::model_data
  :super ros::object
  :slots ())

(setf (get mage::model_data :md5sum-) "598fc48d285a0fd47fdebcdb5b23813e")
(setf (get mage::model_data :datatype-) "mage/model_data")
(setf (get mage::model_data :request) mage::model_dataRequest)
(setf (get mage::model_data :response) mage::model_dataResponse)

(defmethod mage::model_dataRequest
  (:response () (instance mage::model_dataResponse :init)))

(setf (get mage::model_dataRequest :md5sum-) "598fc48d285a0fd47fdebcdb5b23813e")
(setf (get mage::model_dataRequest :datatype-) "mage/model_dataRequest")
(setf (get mage::model_dataRequest :definition-)
      "float32[] p
---
float32[] sensor_value

")

(setf (get mage::model_dataResponse :md5sum-) "598fc48d285a0fd47fdebcdb5b23813e")
(setf (get mage::model_dataResponse :datatype-) "mage/model_dataResponse")
(setf (get mage::model_dataResponse :definition-)
      "float32[] p
---
float32[] sensor_value

")



(provide :mage/model_data "598fc48d285a0fd47fdebcdb5b23813e")


