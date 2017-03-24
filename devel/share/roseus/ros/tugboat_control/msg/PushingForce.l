;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::PushingForce)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'PushingForce (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::PUSHINGFORCE")
  (make-package "TUGBOAT_CONTROL::PUSHINGFORCE"))

(in-package "ROS")
;;//! \htmlinclude PushingForce.msg.html


(defclass tugboat_control::PushingForce
  :super ros::object
  :slots (_ID _Newton ))

(defmethod tugboat_control::PushingForce
  (:init
   (&key
    ((:ID __ID) 0)
    ((:Newton __Newton) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _Newton (float __Newton))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:Newton
   (&optional __Newton)
   (if __Newton (setq _Newton __Newton)) _Newton)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float32 _Newton
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; float32 _Newton
       (sys::poke _Newton (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Newton
     (setq _Newton (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get tugboat_control::PushingForce :md5sum-) "f1e8c141d7c72b50fc72611355ca6d95")
(setf (get tugboat_control::PushingForce :datatype-) "tugboat_control/PushingForce")
(setf (get tugboat_control::PushingForce :definition-)
      "# From Arduino
uint8 ID
float32 Newton
")



(provide :tugboat_control/PushingForce "f1e8c141d7c72b50fc72611355ca6d95")


