; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude ClearWaypoint.msg.html

(cl:defclass <ClearWaypoint> (roslisp-msg-protocol:ros-message)
  ((orderID
    :reader orderID
    :initarg :orderID
    :type cl:fixnum
    :initform 0)
   (tugID
    :reader tugID
    :initarg :tugID
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ClearWaypoint (<ClearWaypoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearWaypoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearWaypoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<ClearWaypoint> is deprecated: use tugboat_control-msg:ClearWaypoint instead.")))

(cl:ensure-generic-function 'orderID-val :lambda-list '(m))
(cl:defmethod orderID-val ((m <ClearWaypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:orderID-val is deprecated.  Use tugboat_control-msg:orderID instead.")
  (orderID m))

(cl:ensure-generic-function 'tugID-val :lambda-list '(m))
(cl:defmethod tugID-val ((m <ClearWaypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:tugID-val is deprecated.  Use tugboat_control-msg:tugID instead.")
  (tugID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearWaypoint>) ostream)
  "Serializes a message object of type '<ClearWaypoint>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orderID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tugID)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearWaypoint>) istream)
  "Deserializes a message object of type '<ClearWaypoint>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orderID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tugID)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearWaypoint>)))
  "Returns string type for a message object of type '<ClearWaypoint>"
  "tugboat_control/ClearWaypoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearWaypoint)))
  "Returns string type for a message object of type 'ClearWaypoint"
  "tugboat_control/ClearWaypoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearWaypoint>)))
  "Returns md5sum for a message object of type '<ClearWaypoint>"
  "8bfe7bbf9baec34c11567f7f4f04bf49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearWaypoint)))
  "Returns md5sum for a message object of type 'ClearWaypoint"
  "8bfe7bbf9baec34c11567f7f4f04bf49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearWaypoint>)))
  "Returns full string definition for message of type '<ClearWaypoint>"
  (cl:format cl:nil "uint8 orderID~%uint8 tugID~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearWaypoint)))
  "Returns full string definition for message of type 'ClearWaypoint"
  (cl:format cl:nil "uint8 orderID~%uint8 tugID~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearWaypoint>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearWaypoint>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearWaypoint
    (cl:cons ':orderID (orderID msg))
    (cl:cons ':tugID (tugID msg))
))
