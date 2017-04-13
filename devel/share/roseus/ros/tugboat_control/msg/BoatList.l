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
  :slots (_timestamp _boat ))

(defmethod tugboat_control::BoatList
  (:init
   (&key
    ((:timestamp __timestamp) 0.0)
    ((:boat __boat) (let (r) (dotimes (i 0) (push (instance tugboat_control::BoatStatus :init) r)) r))
    )
   (send-super :init)
   (setq _timestamp (float __timestamp))
   (setq _boat __boat)
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
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
    ;; float64 _timestamp
    8
    ;; tugboat_control/BoatStatus[] _boat
    (apply #'+ (send-all _boat :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _timestamp
       (sys::poke _timestamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; tugboat_control/BoatStatus[] _boat
     (write-long (length _boat) s)
     (dolist (elem _boat)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _timestamp
     (setq _timestamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; tugboat_control/BoatStatus[] _boat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _boat (let (r) (dotimes (i n) (push (instance tugboat_control::BoatStatus :init) r)) r))
     (dolist (elem- _boat)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get tugboat_control::BoatList :md5sum-) "1df20aa31d5e143e5b643777392ea400")
(setf (get tugboat_control::BoatList :datatype-) "tugboat_control/BoatList")
(setf (get tugboat_control::BoatList :definition-)
      "float64 timestamp
tugboat_control/BoatStatus[] boat
================================================================================
MSG: tugboat_control/BoatStatus
uint8 ID # ID == 0 indicates ship
float64 x #x position in meters
float64 y #y position in meters
float64 o #orientation in +-pi radians from \"east\"
float32 force # Newton
")



(provide :tugboat_control/BoatList "1df20aa31d5e143e5b643777392ea400")


