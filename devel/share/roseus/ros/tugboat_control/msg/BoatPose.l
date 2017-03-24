;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::BoatPose)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'BoatPose (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::BOATPOSE")
  (make-package "TUGBOAT_CONTROL::BOATPOSE"))

(in-package "ROS")
;;//! \htmlinclude BoatPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass tugboat_control::BoatPose
  :super ros::object
  :slots (_timestamp _Pose ))

(defmethod tugboat_control::BoatPose
  (:init
   (&key
    ((:timestamp __timestamp) 0.0)
    ((:Pose __Pose) (let (r) (dotimes (i 11) (push (instance geometry_msgs::Pose2D :init) r)) r))
    )
   (send-super :init)
   (setq _timestamp (float __timestamp))
   (setq _Pose __Pose)
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:Pose
   (&rest __Pose)
   (if (keywordp (car __Pose))
       (send* _Pose __Pose)
     (progn
       (if __Pose (setq _Pose (car __Pose)))
       _Pose)))
  (:serialization-length
   ()
   (+
    ;; float64 _timestamp
    8
    ;; geometry_msgs/Pose2D[11] _Pose
    (apply #'+ (send-all _Pose :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _timestamp
       (sys::poke _timestamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Pose2D[11] _Pose
     (dolist (elem _Pose)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _timestamp
     (setq _timestamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Pose2D[11] _Pose
   (dotimes (i 11)
     (send (elt _Pose i) :deserialize buf ptr-) (incf ptr- (send (elt _Pose i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get tugboat_control::BoatPose :md5sum-) "fac719579a6887c70b1bfc580630888c")
(setf (get tugboat_control::BoatPose :datatype-) "tugboat_control/BoatPose")
(setf (get tugboat_control::BoatPose :definition-)
      "float64 timestamp
geometry_msgs/Pose2D[11] Pose
================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")



(provide :tugboat_control/BoatPose "fac719579a6887c70b1bfc580630888c")


