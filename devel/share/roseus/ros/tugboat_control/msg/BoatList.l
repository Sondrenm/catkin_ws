;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::BoatList)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'BoatList (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::BOATLIST")
  (make-package "TUGBOAT_CONTROL::BOATLIST"))

(in-package "ROS")
;;//! \htmlinclude BoatList.msg.html


(defclass tugboat_control::BoatList
  :super ros::object
  :slots (_boat ))

(defmethod tugboat_control::BoatList
  (:init
   (&key
    ((:boat __boat) (let (r) (dotimes (i 50) (push (instance tugboat_control::BoatStatus :init) r)) r))
    )
   (send-super :init)
   (setq _boat __boat)
   self)
  (:boat
   (&rest __boat)
   (if (keywordp (car __boat))
       (send* _boat __boat)
     (progn
       (if __boat (setq _boat (car __boat)))
       _boat)))
  (:serialization-length
   ()
   (+
    ;; tugboat_control/BoatStatus[50] _boat
    (apply #'+ (send-all _boat :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tugboat_control/BoatStatus[50] _boat
     (dolist (elem _boat)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tugboat_control/BoatStatus[50] _boat
   (dotimes (i 50)
     (send (elt _boat i) :deserialize buf ptr-) (incf ptr- (send (elt _boat i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get tugboat_control::BoatList :md5sum-) "fb1531b66e8422b2c672c2aeeec4a39f")
(setf (get tugboat_control::BoatList :datatype-) "tugboat_control/BoatList")
(setf (get tugboat_control::BoatList :definition-)
      "tugboat_control/BoatStatus[50] boat
================================================================================
MSG: tugboat_control/BoatStatus
uint8 ID # ID == 0 indicates ship
float64 x #x position in meters
float64 y #y position in meters
float64 o #orientation in +-pi radians from \"east\"
float32 force # Newton
")



(provide :tugboat_control/BoatList "fb1531b66e8422b2c672c2aeeec4a39f")


