;; Auto-generated. Do not edit!


(when (boundp 'mage::command_data)
  (if (not (find-package "MAGE"))
    (make-package "MAGE"))
  (shadow 'command_data (find-package "MAGE")))
(unless (find-package "MAGE::COMMAND_DATA")
  (make-package "MAGE::COMMAND_DATA"))

(in-package "ROS")
;;//! \htmlinclude command_data.msg.html


(defclass mage::command_data
  :super ros::object
  :slots (_aileron _elevator _rudder _throttle _reached ))

(defmethod mage::command_data
  (:init
   (&key
    ((:aileron __aileron) 0.0)
    ((:elevator __elevator) 0.0)
    ((:rudder __rudder) 0.0)
    ((:throttle __throttle) 0.0)
    ((:reached __reached) 0.0)
    )
   (send-super :init)
   (setq _aileron (float __aileron))
   (setq _elevator (float __elevator))
   (setq _rudder (float __rudder))
   (setq _throttle (float __throttle))
   (setq _reached (float __reached))
   self)
  (:aileron
   (&optional __aileron)
   (if __aileron (setq _aileron __aileron)) _aileron)
  (:elevator
   (&optional __elevator)
   (if __elevator (setq _elevator __elevator)) _elevator)
  (:rudder
   (&optional __rudder)
   (if __rudder (setq _rudder __rudder)) _rudder)
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:reached
   (&optional __reached)
   (if __reached (setq _reached __reached)) _reached)
  (:serialization-length
   ()
   (+
    ;; float32 _aileron
    4
    ;; float32 _elevator
    4
    ;; float32 _rudder
    4
    ;; float32 _throttle
    4
    ;; float32 _reached
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _aileron
       (sys::poke _aileron (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _elevator
       (sys::poke _elevator (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rudder
       (sys::poke _rudder (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _throttle
       (sys::poke _throttle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _reached
       (sys::poke _reached (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _aileron
     (setq _aileron (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _elevator
     (setq _elevator (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rudder
     (setq _rudder (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _throttle
     (setq _throttle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _reached
     (setq _reached (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mage::command_data :md5sum-) "978bbee7b543b076983d5ef9268c14b8")
(setf (get mage::command_data :datatype-) "mage/command_data")
(setf (get mage::command_data :definition-)
      "float32 aileron
float32 elevator
float32 rudder
float32 throttle
float32 reached

")



(provide :mage/command_data "978bbee7b543b076983d5ef9268c14b8")


