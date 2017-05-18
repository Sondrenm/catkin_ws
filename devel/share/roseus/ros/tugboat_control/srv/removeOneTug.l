;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::removeOneTug)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'removeOneTug (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::REMOVEONETUG")
  (make-package "TUGBOAT_CONTROL::REMOVEONETUG"))
(unless (find-package "TUGBOAT_CONTROL::REMOVEONETUGREQUEST")
  (make-package "TUGBOAT_CONTROL::REMOVEONETUGREQUEST"))
(unless (find-package "TUGBOAT_CONTROL::REMOVEONETUGRESPONSE")
  (make-package "TUGBOAT_CONTROL::REMOVEONETUGRESPONSE"))

(in-package "ROS")





(defclass tugboat_control::removeOneTugRequest
  :super ros::object
  :slots ())

(defmethod tugboat_control::removeOneTugRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass tugboat_control::removeOneTugResponse
  :super ros::object
  :slots (_ID ))

(defmethod tugboat_control::removeOneTugResponse
  (:init
   (&key
    ((:ID __ID) 0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass tugboat_control::removeOneTug
  :super ros::object
  :slots ())

(setf (get tugboat_control::removeOneTug :md5sum-) "4ac1f338ecfa845186d806d49892dc3b")
(setf (get tugboat_control::removeOneTug :datatype-) "tugboat_control/removeOneTug")
(setf (get tugboat_control::removeOneTug :request) tugboat_control::removeOneTugRequest)
(setf (get tugboat_control::removeOneTug :response) tugboat_control::removeOneTugResponse)

(defmethod tugboat_control::removeOneTugRequest
  (:response () (instance tugboat_control::removeOneTugResponse :init)))

(setf (get tugboat_control::removeOneTugRequest :md5sum-) "4ac1f338ecfa845186d806d49892dc3b")
(setf (get tugboat_control::removeOneTugRequest :datatype-) "tugboat_control/removeOneTugRequest")
(setf (get tugboat_control::removeOneTugRequest :definition-)
      "---
uint8 ID
")

(setf (get tugboat_control::removeOneTugResponse :md5sum-) "4ac1f338ecfa845186d806d49892dc3b")
(setf (get tugboat_control::removeOneTugResponse :datatype-) "tugboat_control/removeOneTugResponse")
(setf (get tugboat_control::removeOneTugResponse :definition-)
      "---
uint8 ID
")



(provide :tugboat_control/removeOneTug "4ac1f338ecfa845186d806d49892dc3b")


