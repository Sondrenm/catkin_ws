;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::BoatStatus)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'BoatStatus (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::BOATSTATUS")
  (make-package "TUGBOAT_CONTROL::BOATSTATUS"))

(in-package "ROS")
;;//! \htmlinclude BoatStatus.msg.html


(defclass tugboat_control::BoatStatus
  :super ros::object
  :slots (_ID _x _y _theta _PushingForce ))

(defmethod tugboat_control::BoatStatus
  (:init
   (&key
    ((:ID __ID) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:PushingForce __PushingForce) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
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
    ;; uint8 _ID
    1
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
     ;; uint8 _ID
       (write-byte _ID s)
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
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
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

(setf (get tugboat_control::BoatStatus :md5sum-) "c456c1039b34e445f3d3bf38126f7305")
(setf (get tugboat_control::BoatStatus :datatype-) "tugboat_control/BoatStatus")
(setf (get tugboat_control::BoatStatus :definition-)
      "uint8 ID # ID > 99 indicates ship
float64 x #x position in meters
float64 y #y position in meters
float64 theta #orientation in radians or degrees?
float32 PushingForce # Newton
")



(provide :tugboat_control/BoatStatus "c456c1039b34e445f3d3bf38126f7305")


