;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::WaypointAvailable)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'WaypointAvailable (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::WAYPOINTAVAILABLE")
  (make-package "TUGBOAT_CONTROL::WAYPOINTAVAILABLE"))
(unless (find-package "TUGBOAT_CONTROL::WAYPOINTAVAILABLEREQUEST")
  (make-package "TUGBOAT_CONTROL::WAYPOINTAVAILABLEREQUEST"))
(unless (find-package "TUGBOAT_CONTROL::WAYPOINTAVAILABLERESPONSE")
  (make-package "TUGBOAT_CONTROL::WAYPOINTAVAILABLERESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass tugboat_control::WaypointAvailableRequest
  :super ros::object
  :slots (_waypoint ))

(defmethod tugboat_control::WaypointAvailableRequest
  (:init
   (&key
    ((:waypoint __waypoint) (instance tugboat_control::Waypoint :init))
    )
   (send-super :init)
   (setq _waypoint __waypoint)
   self)
  (:waypoint
   (&rest __waypoint)
   (if (keywordp (car __waypoint))
       (send* _waypoint __waypoint)
     (progn
       (if __waypoint (setq _waypoint (car __waypoint)))
       _waypoint)))
  (:serialization-length
   ()
   (+
    ;; tugboat_control/Waypoint _waypoint
    (send _waypoint :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/Waypoint _waypoint
       (send _waypoint :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/Waypoint _waypoint
     (send _waypoint :deserialize buf ptr-) (incf ptr- (send _waypoint :serialization-length))
   ;;
   self)
  )

(defclass tugboat_control::WaypointAvailableResponse
  :super ros::object
  :slots (_ans ))

(defmethod tugboat_control::WaypointAvailableResponse
  (:init
   (&key
    ((:ans __ans) (instance std_msgs::Bool :init))
    )
   (send-super :init)
   (setq _ans __ans)
   self)
  (:ans
   (&rest __ans)
   (if (keywordp (car __ans))
       (send* _ans __ans)
     (progn
       (if __ans (setq _ans (car __ans)))
       _ans)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Bool _ans
    (send _ans :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Bool _ans
       (send _ans :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Bool _ans
     (send _ans :deserialize buf ptr-) (incf ptr- (send _ans :serialization-length))
   ;;
   self)
  )

(defclass tugboat_control::WaypointAvailable
  :super ros::object
  :slots ())

(setf (get tugboat_control::WaypointAvailable :md5sum-) "e256e0c870845448cbf5d0a1d2ba0749")
(setf (get tugboat_control::WaypointAvailable :datatype-) "tugboat_control/WaypointAvailable")
(setf (get tugboat_control::WaypointAvailable :request) tugboat_control::WaypointAvailableRequest)
(setf (get tugboat_control::WaypointAvailable :response) tugboat_control::WaypointAvailableResponse)

(defmethod tugboat_control::WaypointAvailableRequest
  (:response () (instance tugboat_control::WaypointAvailableResponse :init)))

(setf (get tugboat_control::WaypointAvailableRequest :md5sum-) "e256e0c870845448cbf5d0a1d2ba0749")
(setf (get tugboat_control::WaypointAvailableRequest :datatype-) "tugboat_control/WaypointAvailableRequest")
(setf (get tugboat_control::WaypointAvailableRequest :definition-)
      "Waypoint waypoint

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
---
std_msgs/Bool ans

================================================================================
MSG: std_msgs/Bool
")

(setf (get tugboat_control::WaypointAvailableResponse :md5sum-) "e256e0c870845448cbf5d0a1d2ba0749")
(setf (get tugboat_control::WaypointAvailableResponse :datatype-) "tugboat_control/WaypointAvailableResponse")
(setf (get tugboat_control::WaypointAvailableResponse :definition-)
      "Waypoint waypoint

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
---
std_msgs/Bool ans

================================================================================
MSG: std_msgs/Bool
")



(provide :tugboat_control/WaypointAvailable "e256e0c870845448cbf5d0a1d2ba0749")


