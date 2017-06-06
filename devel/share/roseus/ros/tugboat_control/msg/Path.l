;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::Path)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'Path (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::PATH")
  (make-package "TUGBOAT_CONTROL::PATH"))

(in-package "ROS")
;;//! \htmlinclude Path.msg.html


(defclass tugboat_control::Path
  :super ros::object
  :slots (_tugID _orderID _data ))

(defmethod tugboat_control::Path
  (:init
   (&key
    ((:tugID __tugID) 0)
    ((:orderID __orderID) 0)
    ((:data __data) (let (r) (dotimes (i 0) (push (instance tugboat_control::Waypoint :init) r)) r))
    )
   (send-super :init)
   (setq _tugID (round __tugID))
   (setq _orderID (round __orderID))
   (setq _data __data)
   self)
  (:tugID
   (&optional __tugID)
   (if __tugID (setq _tugID __tugID)) _tugID)
  (:orderID
   (&optional __orderID)
   (if __orderID (setq _orderID __orderID)) _orderID)
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
    ;; uint8 _tugID
    1
    ;; uint8 _orderID
    1
    ;; tugboat_control/Waypoint[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _tugID
       (write-byte _tugID s)
     ;; uint8 _orderID
       (write-byte _orderID s)
     ;; tugboat_control/Waypoint[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _tugID
     (setq _tugID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _orderID
     (setq _orderID (sys::peek buf ptr- :char)) (incf ptr- 1)
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

(setf (get tugboat_control::Path :md5sum-) "f0271dfc1e84d185aae5c12a5ce14e50")
(setf (get tugboat_control::Path :datatype-) "tugboat_control/Path")
(setf (get tugboat_control::Path :definition-)
      "uint8 tugID
uint8 orderID
Waypoint[] data
================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation
")



(provide :tugboat_control/Path "f0271dfc1e84d185aae5c12a5ce14e50")


