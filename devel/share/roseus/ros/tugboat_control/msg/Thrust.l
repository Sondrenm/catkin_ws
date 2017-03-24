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
  :slots (_ID _thrust _cwturn ))

(defmethod tugboat_control::Thrust
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
    ;; uint8 _ID
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
     ;; uint8 _ID
       (write-byte _ID s)
     ;; int8 _thrust
       (write-byte _thrust s)
     ;; int8 _cwturn
       (write-byte _cwturn s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _thrust
     (setq _thrust (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _thrust 127) (setq _thrust (- _thrust 256)))
   ;; int8 _cwturn
     (setq _cwturn (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cwturn 127) (setq _cwturn (- _cwturn 256)))
   ;;
   self)
  )

(setf (get tugboat_control::Thrust :md5sum-) "eb36a969d5d22c5ec8c64a8469c7e207")
(setf (get tugboat_control::Thrust :datatype-) "tugboat_control/Thrust")
(setf (get tugboat_control::Thrust :definition-)
      "# To Arduino
uint8 ID
int8 thrust # In % + 100
int8 cwturn # In % + 100
")



(provide :tugboat_control/Thrust "eb36a969d5d22c5ec8c64a8469c7e207")


