;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::AvoidShipCollision)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'AvoidShipCollision (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::AVOIDSHIPCOLLISION")
  (make-package "TUGBOAT_CONTROL::AVOIDSHIPCOLLISION"))
(unless (find-package "TUGBOAT_CONTROL::AVOIDSHIPCOLLISIONREQUEST")
  (make-package "TUGBOAT_CONTROL::AVOIDSHIPCOLLISIONREQUEST"))
(unless (find-package "TUGBOAT_CONTROL::AVOIDSHIPCOLLISIONRESPONSE")
  (make-package "TUGBOAT_CONTROL::AVOIDSHIPCOLLISIONRESPONSE"))

(in-package "ROS")





(defclass tugboat_control::AvoidShipCollisionRequest
  :super ros::object
  :slots (_from _to ))

(defmethod tugboat_control::AvoidShipCollisionRequest
  (:init
   (&key
    ((:from __from) (instance tugboat_control::Waypoint :init))
    ((:to __to) (instance tugboat_control::Waypoint :init))
    )
   (send-super :init)
   (setq _from __from)
   (setq _to __to)
   self)
  (:from
   (&rest __from)
   (if (keywordp (car __from))
       (send* _from __from)
     (progn
       (if __from (setq _from (car __from)))
       _from)))
  (:to
   (&rest __to)
   (if (keywordp (car __to))
       (send* _to __to)
     (progn
       (if __to (setq _to (car __to)))
       _to)))
  (:serialization-length
   ()
   (+
    ;; tugboat_control/Waypoint _from
    (send _from :serialization-length)
    ;; tugboat_control/Waypoint _to
    (send _to :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/Waypoint _from
       (send _from :serialize s)
     ;; tugboat_control/Waypoint _to
       (send _to :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/Waypoint _from
     (send _from :deserialize buf ptr-) (incf ptr- (send _from :serialization-length))
   ;; tugboat_control/Waypoint _to
     (send _to :deserialize buf ptr-) (incf ptr- (send _to :serialization-length))
   ;;
   self)
  )

(defclass tugboat_control::AvoidShipCollisionResponse
  :super ros::object
  :slots (_path ))

(defmethod tugboat_control::AvoidShipCollisionResponse
  (:init
   (&key
    ((:path __path) (let (r) (dotimes (i 0) (push (instance tugboat_control::Waypoint :init) r)) r))
    )
   (send-super :init)
   (setq _path __path)
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:serialization-length
   ()
   (+
    ;; tugboat_control/Waypoint[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/Waypoint[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/Waypoint[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance tugboat_control::Waypoint :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass tugboat_control::AvoidShipCollision
  :super ros::object
  :slots ())

(setf (get tugboat_control::AvoidShipCollision :md5sum-) "1d3ed13e2b52083674842ac5b19130cb")
(setf (get tugboat_control::AvoidShipCollision :datatype-) "tugboat_control/AvoidShipCollision")
(setf (get tugboat_control::AvoidShipCollision :request) tugboat_control::AvoidShipCollisionRequest)
(setf (get tugboat_control::AvoidShipCollision :response) tugboat_control::AvoidShipCollisionResponse)

(defmethod tugboat_control::AvoidShipCollisionRequest
  (:response () (instance tugboat_control::AvoidShipCollisionResponse :init)))

(setf (get tugboat_control::AvoidShipCollisionRequest :md5sum-) "1d3ed13e2b52083674842ac5b19130cb")
(setf (get tugboat_control::AvoidShipCollisionRequest :datatype-) "tugboat_control/AvoidShipCollisionRequest")
(setf (get tugboat_control::AvoidShipCollisionRequest :definition-)
      "Waypoint from
Waypoint to

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
---
Waypoint[] path

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
")

(setf (get tugboat_control::AvoidShipCollisionResponse :md5sum-) "1d3ed13e2b52083674842ac5b19130cb")
(setf (get tugboat_control::AvoidShipCollisionResponse :datatype-) "tugboat_control/AvoidShipCollisionResponse")
(setf (get tugboat_control::AvoidShipCollisionResponse :definition-)
      "Waypoint from
Waypoint to

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
---
Waypoint[] path

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
")



(provide :tugboat_control/AvoidShipCollision "1d3ed13e2b52083674842ac5b19130cb")


