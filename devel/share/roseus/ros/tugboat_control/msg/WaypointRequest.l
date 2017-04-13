;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::WaypointRequest)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'WaypointRequest (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::WAYPOINTREQUEST")
  (make-package "TUGBOAT_CONTROL::WAYPOINTREQUEST"))

(in-package "ROS")
;;//! \htmlinclude WaypointRequest.msg.html


(defclass tugboat_control::WaypointRequest
  :super ros::object
  :slots (_ID _x _y _o ))

(defmethod tugboat_control::WaypointRequest
  (:init
   (&key
    ((:ID __ID) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:o __o) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _x (float __x))
   (setq _y (float __y))
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
   ;; float64 _o
     (setq _o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tugboat_control::WaypointRequest :md5sum-) "e95f3e67135784b4229f3c4a980afa6c")
(setf (get tugboat_control::WaypointRequest :datatype-) "tugboat_control/WaypointRequest")
(setf (get tugboat_control::WaypointRequest :definition-)
      "uint8 ID
float64 x #x position in meters
float64 y #y position in meters
float64 o #orientation in +- pi radians away from \"east\"
")



(provide :tugboat_control/WaypointRequest "e95f3e67135784b4229f3c4a980afa6c")


