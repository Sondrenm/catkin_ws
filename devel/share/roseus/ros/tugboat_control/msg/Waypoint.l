;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::Waypoint)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'Waypoint (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::WAYPOINT")
  (make-package "TUGBOAT_CONTROL::WAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude Waypoint.msg.html


(defclass tugboat_control::Waypoint
  :super ros::object
  :slots (_ID _x _y _v _o ))

(defmethod tugboat_control::Waypoint
  (:init
   (&key
    ((:ID __ID) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:v __v) 0.0)
    ((:o __o) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _v (float __v))
   (setq _o (float __o))
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
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:o
   (&optional __o)
   (if __o (setq _o __o)) _o)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _v
    8
    ;; float64 _o
    8
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
     ;; float64 _v
       (sys::poke _v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _o
       (sys::poke _o (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _v
     (setq _v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _o
     (setq _o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tugboat_control::Waypoint :md5sum-) "c592f2f44627833d28a713dd2e088458")
(setf (get tugboat_control::Waypoint :datatype-) "tugboat_control/Waypoint")
(setf (get tugboat_control::Waypoint :definition-)
      "uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation
")



(provide :tugboat_control/Waypoint "c592f2f44627833d28a713dd2e088458")


