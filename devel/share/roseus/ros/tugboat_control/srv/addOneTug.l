;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::addOneTug)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'addOneTug (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::ADDONETUG")
  (make-package "TUGBOAT_CONTROL::ADDONETUG"))
(unless (find-package "TUGBOAT_CONTROL::ADDONETUGREQUEST")
  (make-package "TUGBOAT_CONTROL::ADDONETUGREQUEST"))
(unless (find-package "TUGBOAT_CONTROL::ADDONETUGRESPONSE")
  (make-package "TUGBOAT_CONTROL::ADDONETUGRESPONSE"))

(in-package "ROS")





(defclass tugboat_control::addOneTugRequest
  :super ros::object
  :slots ())

(defmethod tugboat_control::addOneTugRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass tugboat_control::addOneTugResponse
  :super ros::object
  :slots (_Pose ))

(defmethod tugboat_control::addOneTugResponse
  (:init
   (&key
    ((:Pose __Pose) (instance tugboat_control::BoatPose :init))
    )
   (send-super :init)
   (setq _Pose __Pose)
   self)
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
    ;; tugboat_control/BoatPose _Pose
    (send _Pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/BoatPose _Pose
       (send _Pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/BoatPose _Pose
     (send _Pose :deserialize buf ptr-) (incf ptr- (send _Pose :serialization-length))
   ;;
   self)
  )

(defclass tugboat_control::addOneTug
  :super ros::object
  :slots ())

(setf (get tugboat_control::addOneTug :md5sum-) "605a7c6929aec48e81da00e68778ab7c")
(setf (get tugboat_control::addOneTug :datatype-) "tugboat_control/addOneTug")
(setf (get tugboat_control::addOneTug :request) tugboat_control::addOneTugRequest)
(setf (get tugboat_control::addOneTug :response) tugboat_control::addOneTugResponse)

(defmethod tugboat_control::addOneTugRequest
  (:response () (instance tugboat_control::addOneTugResponse :init)))

(setf (get tugboat_control::addOneTugRequest :md5sum-) "605a7c6929aec48e81da00e68778ab7c")
(setf (get tugboat_control::addOneTugRequest :datatype-) "tugboat_control/addOneTugRequest")
(setf (get tugboat_control::addOneTugRequest :definition-)
      "---
BoatPose Pose

================================================================================
MSG: tugboat_control/BoatPose
uint8 ID # ID
float64 x #x position in meters
float64 y #y position in meters
")

(setf (get tugboat_control::addOneTugResponse :md5sum-) "605a7c6929aec48e81da00e68778ab7c")
(setf (get tugboat_control::addOneTugResponse :datatype-) "tugboat_control/addOneTugResponse")
(setf (get tugboat_control::addOneTugResponse :definition-)
      "---
BoatPose Pose

================================================================================
MSG: tugboat_control/BoatPose
uint8 ID # ID
float64 x #x position in meters
float64 y #y position in meters
")



(provide :tugboat_control/addOneTug "605a7c6929aec48e81da00e68778ab7c")


