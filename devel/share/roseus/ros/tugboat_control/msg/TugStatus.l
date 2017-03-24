;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::TugStatus)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'TugStatus (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::TUGSTATUS")
  (make-package "TUGBOAT_CONTROL::TUGSTATUS"))

(in-package "ROS")
;;//! \htmlinclude TugStatus.msg.html


(defclass tugboat_control::TugStatus
  :super ros::object
  :slots (_ID _x _y _theta _PushingForce ))

(defmethod tugboat_control::TugStatus
  (:init
   (&key
    ((:ID __ID) (make-array 0 :initial-element 0 :element-type :char))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:PushingForce __PushingForce) 0.0)
    )
   (send-super :init)
   (setq _ID __ID)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _PushingForce (float __PushingForce))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:PushingForce
   (&optional __PushingForce)
   (if __PushingForce (setq _PushingForce __PushingForce)) _PushingForce)
  (:serialization-length
   ()
   (+
    ;; uint8[] _ID
    (* 1    (length _ID)) 4
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
    8
    ;; float32 _PushingForce
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _ID
     (write-long (length _ID) s)
     (princ _ID s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _PushingForce
       (sys::poke _PushingForce (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _ID
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _ID (make-array n :element-type :char))
     (replace _ID buf :start2 ptr-) (incf ptr- n))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _PushingForce
     (setq _PushingForce (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get tugboat_control::TugStatus :md5sum-) "5cbdaa7ad30be6bec977e5b38206d8e9")
(setf (get tugboat_control::TugStatus :datatype-) "tugboat_control/TugStatus")
(setf (get tugboat_control::TugStatus :definition-)
      "uint8[] ID # ID > 99 indicates ship
float64 x #x position in meters
float64 y #y position in meters
float64 theta #orientation in radians or degrees?
float32 PushingForce # Newton
")



(provide :tugboat_control/TugStatus "5cbdaa7ad30be6bec977e5b38206d8e9")


