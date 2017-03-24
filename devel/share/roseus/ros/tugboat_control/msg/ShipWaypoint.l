;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::ShipWaypoint)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'ShipWaypoint (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::SHIPWAYPOINT")
  (make-package "TUGBOAT_CONTROL::SHIPWAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude ShipWaypoint.msg.html


(defclass tugboat_control::ShipWaypoint
  :super ros::object
  :slots (_xPos _yPos _orientation ))

(defmethod tugboat_control::ShipWaypoint
  (:init
   (&key
    ((:xPos __xPos) 0.0)
    ((:yPos __yPos) 0.0)
    ((:orientation __orientation) 0.0)
    )
   (send-super :init)
   (setq _xPos (float __xPos))
   (setq _yPos (float __yPos))
   (setq _orientation (float __orientation))
   self)
  (:xPos
   (&optional __xPos)
   (if __xPos (setq _xPos __xPos)) _xPos)
  (:yPos
   (&optional __yPos)
   (if __yPos (setq _yPos __yPos)) _yPos)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:serialization-length
   ()
   (+
    ;; float64 _xPos
    8
    ;; float64 _yPos
    8
    ;; float64 _orientation
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _xPos
       (sys::poke _xPos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yPos
       (sys::poke _yPos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _xPos
     (setq _xPos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yPos
     (setq _yPos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _orientation
     (setq _orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tugboat_control::ShipWaypoint :md5sum-) "12dcab14506cdf2d1ef5fd11bde47896")
(setf (get tugboat_control::ShipWaypoint :datatype-) "tugboat_control/ShipWaypoint")
(setf (get tugboat_control::ShipWaypoint :definition-)
      "float64 xPos
float64 yPos
float64 orientation 
#What more do you want?
")



(provide :tugboat_control/ShipWaypoint "12dcab14506cdf2d1ef5fd11bde47896")


