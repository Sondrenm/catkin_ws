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
  :slots (_ID _force ))

(defmethod tugboat_control::PushingForce
  (:init
   (&key
    ((:ID __ID) 0)
    ((:force __force) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _force (float __force))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float32 _force
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; float32 _force
       (sys::poke _force (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _force
     (setq _force (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get tugboat_control::PushingForce :md5sum-) "a7005a38011551613bbcdafc2f85d46e")
(setf (get tugboat_control::PushingForce :datatype-) "tugboat_control/PushingForce")
(setf (get tugboat_control::PushingForce :definition-)
      "# From Arduino
uint8 ID
float32 force #in Newton
")



(provide :tugboat_control/PushingForce "a7005a38011551613bbcdafc2f85d46e")


