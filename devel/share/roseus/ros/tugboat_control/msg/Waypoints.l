;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::Waypoints)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'Waypoints (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::WAYPOINTS")
  (make-package "TUGBOAT_CONTROL::WAYPOINTS"))

(in-package "ROS")
;;//! \htmlinclude Waypoints.msg.html


(defclass tugboat_control::Waypoints
  :super ros::object
  :slots (_data ))

(defmethod tugboat_control::Waypoints
  (:init
   (&key
    ((:data __data) (let (r) (dotimes (i 0) (push (instance tugboat_control::Waypoint :init) r)) r))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; tugboat_control/Waypoint[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/Waypoint[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/Waypoint[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance tugboat_control::Waypoint :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get tugboat_control::Waypoints :md5sum-) "2e23614a1124366d2fd6f1fe04468ba7")
(setf (get tugboat_control::Waypoints :datatype-) "tugboat_control/Waypoints")
(setf (get tugboat_control::Waypoints :definition-)
      "Waypoint[] data
================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation
")



(provide :tugboat_control/Waypoints "2e23614a1124366d2fd6f1fe04468ba7")


