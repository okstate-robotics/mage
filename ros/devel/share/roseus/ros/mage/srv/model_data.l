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
  :slots (_uav_tag ))

(defmethod mage::model_dataRequest
  (:init
   (&key
    ((:uav_tag __uav_tag) "")
    )
   (send-super :init)
   (setq _uav_tag (string __uav_tag))
   self)
  (:uav_tag
   (&optional __uav_tag)
   (if __uav_tag (setq _uav_tag __uav_tag)) _uav_tag)
  (:serialization-length
   ()
   (+
    ;; string _uav_tag
    4 (length _uav_tag)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _uav_tag
       (write-long (length _uav_tag) s) (princ _uav_tag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _uav_tag
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _uav_tag (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mage::model_dataResponse
  :super ros::object
  :slots (_Response _rows _columns _BV1 _BV2 _BV3 _BV4 _BV5 _BV6 _BV7 _BV8 _BV9 _W ))

(defmethod mage::model_dataResponse
  (:init
   (&key
    ((:Response __Response) nil)
    ((:rows __rows) 0)
    ((:columns __columns) 0)
    ((:BV1 __BV1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV2 __BV2) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV3 __BV3) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV4 __BV4) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV5 __BV5) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV6 __BV6) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV7 __BV7) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV8 __BV8) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:BV9 __BV9) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:W __W) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _Response __Response)
   (setq _rows (round __rows))
   (setq _columns (round __columns))
   (setq _BV1 __BV1)
   (setq _BV2 __BV2)
   (setq _BV3 __BV3)
   (setq _BV4 __BV4)
   (setq _BV5 __BV5)
   (setq _BV6 __BV6)
   (setq _BV7 __BV7)
   (setq _BV8 __BV8)
   (setq _BV9 __BV9)
   (setq _W __W)
   self)
  (:Response
   (&optional __Response)
   (if __Response (setq _Response __Response)) _Response)
  (:rows
   (&optional __rows)
   (if __rows (setq _rows __rows)) _rows)
  (:columns
   (&optional __columns)
   (if __columns (setq _columns __columns)) _columns)
  (:BV1
   (&optional __BV1)
   (if __BV1 (setq _BV1 __BV1)) _BV1)
  (:BV2
   (&optional __BV2)
   (if __BV2 (setq _BV2 __BV2)) _BV2)
  (:BV3
   (&optional __BV3)
   (if __BV3 (setq _BV3 __BV3)) _BV3)
  (:BV4
   (&optional __BV4)
   (if __BV4 (setq _BV4 __BV4)) _BV4)
  (:BV5
   (&optional __BV5)
   (if __BV5 (setq _BV5 __BV5)) _BV5)
  (:BV6
   (&optional __BV6)
   (if __BV6 (setq _BV6 __BV6)) _BV6)
  (:BV7
   (&optional __BV7)
   (if __BV7 (setq _BV7 __BV7)) _BV7)
  (:BV8
   (&optional __BV8)
   (if __BV8 (setq _BV8 __BV8)) _BV8)
  (:BV9
   (&optional __BV9)
   (if __BV9 (setq _BV9 __BV9)) _BV9)
  (:W
   (&optional __W)
   (if __W (setq _W __W)) _W)
  (:serialization-length
   ()
   (+
    ;; bool _Response
    1
    ;; int64 _rows
    8
    ;; int64 _columns
    8
    ;; float64[] _BV1
    (* 8    (length _BV1)) 4
    ;; float64[] _BV2
    (* 8    (length _BV2)) 4
    ;; float64[] _BV3
    (* 8    (length _BV3)) 4
    ;; float64[] _BV4
    (* 8    (length _BV4)) 4
    ;; float64[] _BV5
    (* 8    (length _BV5)) 4
    ;; float64[] _BV6
    (* 8    (length _BV6)) 4
    ;; float64[] _BV7
    (* 8    (length _BV7)) 4
    ;; float64[] _BV8
    (* 8    (length _BV8)) 4
    ;; float64[] _BV9
    (* 8    (length _BV9)) 4
    ;; float64[] _W
    (* 8    (length _W)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _Response
       (if _Response (write-byte -1 s) (write-byte 0 s))
     ;; int64 _rows
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _rows (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _rows) (= (length (_rows . bv)) 2)) ;; bignum
              (write-long (ash (elt (_rows . bv) 0) 0) s)
              (write-long (ash (elt (_rows . bv) 1) -1) s))
             ((and (class _rows) (= (length (_rows . bv)) 1)) ;; big1
              (write-long (elt (_rows . bv) 0) s)
              (write-long (if (>= _rows 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _rows s)(write-long (if (>= _rows 0) 0 #xffffffff) s)))
     ;; int64 _columns
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _columns (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _columns) (= (length (_columns . bv)) 2)) ;; bignum
              (write-long (ash (elt (_columns . bv) 0) 0) s)
              (write-long (ash (elt (_columns . bv) 1) -1) s))
             ((and (class _columns) (= (length (_columns . bv)) 1)) ;; big1
              (write-long (elt (_columns . bv) 0) s)
              (write-long (if (>= _columns 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _columns s)(write-long (if (>= _columns 0) 0 #xffffffff) s)))
     ;; float64[] _BV1
     (write-long (length _BV1) s)
     (dotimes (i (length _BV1))
       (sys::poke (elt _BV1 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV2
     (write-long (length _BV2) s)
     (dotimes (i (length _BV2))
       (sys::poke (elt _BV2 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV3
     (write-long (length _BV3) s)
     (dotimes (i (length _BV3))
       (sys::poke (elt _BV3 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV4
     (write-long (length _BV4) s)
     (dotimes (i (length _BV4))
       (sys::poke (elt _BV4 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV5
     (write-long (length _BV5) s)
     (dotimes (i (length _BV5))
       (sys::poke (elt _BV5 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV6
     (write-long (length _BV6) s)
     (dotimes (i (length _BV6))
       (sys::poke (elt _BV6 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV7
     (write-long (length _BV7) s)
     (dotimes (i (length _BV7))
       (sys::poke (elt _BV7 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV8
     (write-long (length _BV8) s)
     (dotimes (i (length _BV8))
       (sys::poke (elt _BV8 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _BV9
     (write-long (length _BV9) s)
     (dotimes (i (length _BV9))
       (sys::poke (elt _BV9 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _W
     (write-long (length _W) s)
     (dotimes (i (length _W))
       (sys::poke (elt _W i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _Response
     (setq _Response (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _rows
#+(or :alpha :irix6 :x86_64)
      (setf _rows (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _rows (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _columns
#+(or :alpha :irix6 :x86_64)
      (setf _columns (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _columns (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64[] _BV1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV1 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV2 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV3
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV3 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV3 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV4
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV4 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV4 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV5
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV5 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV5 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV6
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV6 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV6 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV7
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV7 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV7 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV8
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV8 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV8 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _BV9
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _BV9 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _BV9 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _W
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _W (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _W i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass mage::model_data
  :super ros::object
  :slots ())

(setf (get mage::model_data :md5sum-) "068069642642797e324175cfa8a60121")
(setf (get mage::model_data :datatype-) "mage/model_data")
(setf (get mage::model_data :request) mage::model_dataRequest)
(setf (get mage::model_data :response) mage::model_dataResponse)

(defmethod mage::model_dataRequest
  (:response () (instance mage::model_dataResponse :init)))

(setf (get mage::model_dataRequest :md5sum-) "068069642642797e324175cfa8a60121")
(setf (get mage::model_dataRequest :datatype-) "mage/model_dataRequest")
(setf (get mage::model_dataRequest :definition-)
      "string uav_tag
---
bool Response
int64 rows
int64 columns
float64[] BV1
float64[] BV2
float64[] BV3
float64[] BV4
float64[] BV5
float64[] BV6
float64[] BV7
float64[] BV8
float64[] BV9
float64[] W


")

(setf (get mage::model_dataResponse :md5sum-) "068069642642797e324175cfa8a60121")
(setf (get mage::model_dataResponse :datatype-) "mage/model_dataResponse")
(setf (get mage::model_dataResponse :definition-)
      "string uav_tag
---
bool Response
int64 rows
int64 columns
float64[] BV1
float64[] BV2
float64[] BV3
float64[] BV4
float64[] BV5
float64[] BV6
float64[] BV7
float64[] BV8
float64[] BV9
float64[] W


")



(provide :mage/model_data "068069642642797e324175cfa8a60121")


