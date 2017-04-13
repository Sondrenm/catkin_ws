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
  :slots (_ID _o _force ))

(defmethod tugboat_control::TugSetpoints
  (:init
   (&key
    ((:ID __ID) 0)
    ((:o __o) 0.0)
    ((:force __force) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _o (float __o))
   (setq _force (float __force))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:o
   (&optional __o)
   (if __o (setq _o __o)) _o)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float64 _o
    8
    ;; float64 _force
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; float64 _o
       (sys::poke _o (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _force
       (sys::poke _force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _o
     (setq _o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _force
     (setq _force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tugboat_control::TugSetpoints :md5sum-) "8794df36994479d46b6355b637b13061")
(setf (get tugboat_control::TugSetpoints :datatype-) "tugboat_control/TugSetpoints")
(setf (get tugboat_control::TugSetpoints :definition-)
      "uint8 ID
float64 o
float64 force
")



(provide :tugboat_control/TugSetpoints "8794df36994479d46b6355b637b13061")


