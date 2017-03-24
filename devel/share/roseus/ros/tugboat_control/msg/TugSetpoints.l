;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::TugSetpoints)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'TugSetpoints (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::TUGSETPOINTS")
  (make-package "TUGBOAT_CONTROL::TUGSETPOINTS"))

(in-package "ROS")
;;//! \htmlinclude TugSetpoints.msg.html


(defclass tugboat_control::TugSetpoints
  :super ros::object
  :slots (_ID _orientation _pushingForce ))

(defmethod tugboat_control::TugSetpoints
  (:init
   (&key
    ((:ID __ID) 0)
    ((:orientation __orientation) 0.0)
    ((:pushingForce __pushingForce) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _orientation (float __orientation))
   (setq _pushingForce (float __pushingForce))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:pushingForce
   (&optional __pushingForce)
   (if __pushingForce (setq _pushingForce __pushingForce)) _pushingForce)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float64 _orientation
    8
    ;; float64 _pushingForce
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; float64 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pushingForce
       (sys::poke _pushingForce (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _orientation
     (setq _orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pushingForce
     (setq _pushingForce (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tugboat_control::TugSetpoints :md5sum-) "0b1a644af72e0374fc50096b433f3946")
(setf (get tugboat_control::TugSetpoints :datatype-) "tugboat_control/TugSetpoints")
(setf (get tugboat_control::TugSetpoints :definition-)
      "uint8 ID
float64 orientation
float64 pushingForce
")



(provide :tugboat_control/TugSetpoints "0b1a644af72e0374fc50096b433f3946")


