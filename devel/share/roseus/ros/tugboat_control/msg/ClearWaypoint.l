;; Auto-generated. Do not edit!


(when (boundp 'tugboat_control::ClearWaypoint)
  (if (not (find-package "TUGBOAT_CONTROL"))
    (make-package "TUGBOAT_CONTROL"))
  (shadow 'ClearWaypoint (find-package "TUGBOAT_CONTROL")))
(unless (find-package "TUGBOAT_CONTROL::CLEARWAYPOINT")
  (make-package "TUGBOAT_CONTROL::CLEARWAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude ClearWaypoint.msg.html


(defclass tugboat_control::ClearWaypoint
  :super ros::object
  :slots (_orderID _tugID ))

(defmethod tugboat_control::ClearWaypoint
  (:init
   (&key
    ((:orderID __orderID) 0)
    ((:tugID __tugID) 0)
    )
   (send-super :init)
   (setq _orderID (round __orderID))
   (setq _tugID (round __tugID))
   self)
  (:orderID
   (&optional __orderID)
   (if __orderID (setq _orderID __orderID)) _orderID)
  (:tugID
   (&optional __tugID)
   (if __tugID (setq _tugID __tugID)) _tugID)
  (:serialization-length
   ()
   (+
    ;; uint8 _orderID
    1
    ;; uint8 _tugID
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _orderID
       (write-byte _orderID s)
     ;; uint8 _tugID
       (write-byte _tugID s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _orderID
     (setq _orderID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _tugID
     (setq _tugID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get tugboat_control::ClearWaypoint :md5sum-) "8bfe7bbf9baec34c11567f7f4f04bf49")
(setf (get tugboat_control::ClearWaypoint :datatype-) "tugboat_control/ClearWaypoint")
(setf (get tugboat_control::ClearWaypoint :definition-)
      "uint8 orderID
uint8 tugID
")



(provide :tugboat_control/ClearWaypoint "8bfe7bbf9baec34c11567f7f4f04bf49")


