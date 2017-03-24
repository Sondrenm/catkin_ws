;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::ShipControlInput)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'ShipControlInput (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::SHIPCONTROLINPUT")
  (make-package "TUGBOAT_CONTROL::SHIPCONTROLINPUT"))

(in-package "ROS")
;;//! \htmlinclude ShipControlInput.msg.html


(defclass tugboat_control::ShipControlInput
  :super ros::object
  :slots (_ShipPose _TugStatus ))

(defmethod tugboat_control::ShipControlInput
  (:init
   (&key
    ((:ShipPose __ShipPose) (instance tugboat_control::BoatPose :init))
    ((:TugStatus __TugStatus) (let (r) (dotimes (i 0) (push (instance tugboat_control::TugStatus :init) r)) r))
    )
   (send-super :init)
   (setq _ShipPose __ShipPose)
   (setq _TugStatus __TugStatus)
   self)
  (:ShipPose
   (&rest __ShipPose)
   (if (keywordp (car __ShipPose))
       (send* _ShipPose __ShipPose)
     (progn
       (if __ShipPose (setq _ShipPose (car __ShipPose)))
       _ShipPose)))
  (:TugStatus
   (&rest __TugStatus)
   (if (keywordp (car __TugStatus))
       (send* _TugStatus __TugStatus)
     (progn
       (if __TugStatus (setq _TugStatus (car __TugStatus)))
       _TugStatus)))
  (:serialization-length
   ()
   (+
    ;; tugboat_control/BoatPose _ShipPose
    (send _ShipPose :serialization-length)
    ;; tugboat_control/TugStatus[] _TugStatus
    (apply #'+ (send-all _TugStatus :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/BoatPose _ShipPose
       (send _ShipPose :serialize s)
     ;; tugboat_control/TugStatus[] _TugStatus
     (write-long (length _TugStatus) s)
     (dolist (elem _TugStatus)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/BoatPose _ShipPose
     (send _ShipPose :deserialize buf ptr-) (incf ptr- (send _ShipPose :serialization-length))
   ;; tugboat_control/TugStatus[] _TugStatus
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _TugStatus (let (r) (dotimes (i n) (push (instance tugboat_control::TugStatus :init) r)) r))
     (dolist (elem- _TugStatus)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get tugboat_control::ShipControlInput :md5sum-) "945e5ec50a8c1a88de62ff9741f9d15f")
(setf (get tugboat_control::ShipControlInput :datatype-) "tugboat_control/ShipControlInput")
(setf (get tugboat_control::ShipControlInput :definition-)
      "#What information is pertinent for controller??
tugboat_control/BoatPose ShipPose
tugboat_control/TugStatus[] TugStatus
================================================================================
MSG: tugboat_control/BoatPose
float64 timestamp
geometry_msgs/Pose2D[11] Pose
================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
================================================================================
MSG: tugboat_control/TugStatus
uint8[] ID # ID > 99 indicates ship
float64 x #x position in meters
float64 y #y position in meters
float64 theta #orientation in radians or degrees?
float32 PushingForce # Newton
")



(provide :tugboat_control/ShipControlInput "945e5ec50a8c1a88de62ff9741f9d15f")


