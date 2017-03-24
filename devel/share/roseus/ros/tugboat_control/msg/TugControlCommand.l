;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::TugControlCommand)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'TugControlCommand (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::TUGCONTROLCOMMAND")
  (make-package "TUGBOAT_CONTROL::TUGCONTROLCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude TugControlCommand.msg.html


(defclass tugboat_control::TugControlCommand
  :super ros::object
  :slots (_orientation _pushingForce ))

(defmethod tugboat_control::TugControlCommand
  (:init
   (&key
    ((:orientation __orientation) 0.0)
    ((:pushingForce __pushingForce) 0.0)
    )
   (send-super :init)
   (setq _orientation (float __orientation))
   (setq _pushingForce (float __pushingForce))
   self)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:pushingForce
   (&optional __pushingForce)
   (if __pushingForce (setq _pushingForce __pushingForce)) _pushingForce)
  (:serialization-length
   ()
   (+
    ;; float32 _orientation
    4
    ;; float32 _pushingForce
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pushingForce
       (sys::poke _pushingForce (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _orientation
     (setq _orientation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pushingForce
     (setq _pushingForce (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get tugboat_control::TugControlCommand :md5sum-) "38391dab0ab53d38a3bbd7116ff3b3f9")
(setf (get tugboat_control::TugControlCommand :datatype-) "tugboat_control/TugControlCommand")
(setf (get tugboat_control::TugControlCommand :definition-)
      "float32 orientation
float32 pushingForce
")



(provide :tugboat_control/TugControlCommand "38391dab0ab53d38a3bbd7116ff3b3f9")


