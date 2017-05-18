;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::Thrust)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'Thrust (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::THRUST")
  (make-package "TUGBOAT_CONTROL::THRUST"))

(in-package "ROS")
;;//! \htmlinclude Thrust.msg.html


(defclass tugboat_control::Thrust
  :super ros::object
  :slots (_ID _thrust _ccwturn ))

(defmethod tugboat_control::Thrust
  (:init
   (&key
    ((:ID __ID) 0)
    ((:thrust __thrust) 0)
    ((:ccwturn __ccwturn) 0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _thrust (round __thrust))
   (setq _ccwturn (round __ccwturn))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:thrust
   (&optional __thrust)
   (if __thrust (setq _thrust __thrust)) _thrust)
  (:ccwturn
   (&optional __ccwturn)
   (if __ccwturn (setq _ccwturn __ccwturn)) _ccwturn)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; int8 _thrust
    1
    ;; int8 _ccwturn
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; int8 _thrust
       (write-byte _thrust s)
     ;; int8 _ccwturn
       (write-byte _ccwturn s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _thrust
     (setq _thrust (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _thrust 127) (setq _thrust (- _thrust 256)))
   ;; int8 _ccwturn
     (setq _ccwturn (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _ccwturn 127) (setq _ccwturn (- _ccwturn 256)))
   ;;
   self)
  )

(setf (get tugboat_control::Thrust :md5sum-) "06f7728b8ee5a6c967559af514f9b25c")
(setf (get tugboat_control::Thrust :datatype-) "tugboat_control/Thrust")
(setf (get tugboat_control::Thrust :definition-)
      "# To Arduino
uint8 ID
int8 thrust # In % +- 100
int8 ccwturn # In % +- 100
")



(provide :tugboat_control/Thrust "06f7728b8ee5a6c967559af514f9b25c")


