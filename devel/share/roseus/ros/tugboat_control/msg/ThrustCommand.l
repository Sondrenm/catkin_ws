;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::ThrustCommand)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'ThrustCommand (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::THRUSTCOMMAND")
  (make-package "TUGBOAT_CONTROL::THRUSTCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ThrustCommand.msg.html


(defclass tugboat_control::ThrustCommand
  :super ros::object
  :slots (_ID _thrust _cwturn ))

(defmethod tugboat_control::ThrustCommand
  (:init
   (&key
    ((:ID __ID) 0)
    ((:thrust __thrust) 0)
    ((:cwturn __cwturn) 0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _thrust (round __thrust))
   (setq _cwturn (round __cwturn))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:thrust
   (&optional __thrust)
   (if __thrust (setq _thrust __thrust)) _thrust)
  (:cwturn
   (&optional __cwturn)
   (if __cwturn (setq _cwturn __cwturn)) _cwturn)
  (:serialization-length
   ()
   (+
    ;; int8 _ID
    1
    ;; int8 _thrust
    1
    ;; int8 _cwturn
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _ID
       (write-byte _ID s)
     ;; int8 _thrust
       (write-byte _thrust s)
     ;; int8 _cwturn
       (write-byte _cwturn s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _ID 127) (setq _ID (- _ID 256)))
   ;; int8 _thrust
     (setq _thrust (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _thrust 127) (setq _thrust (- _thrust 256)))
   ;; int8 _cwturn
     (setq _cwturn (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cwturn 127) (setq _cwturn (- _cwturn 256)))
   ;;
   self)
  )

(setf (get tugboat_control::ThrustCommand :md5sum-) "fcc2a347632ee0312c19efd7a2a067b6")
(setf (get tugboat_control::ThrustCommand :datatype-) "tugboat_control/ThrustCommand")
(setf (get tugboat_control::ThrustCommand :definition-)
      "int8 ID
int8 thrust
int8 cwturn
")



(provide :tugboat_control/ThrustCommand "fcc2a347632ee0312c19efd7a2a067b6")


