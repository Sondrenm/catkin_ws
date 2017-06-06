; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude Path.msg.html

(cl:defclass <Path> (roslisp-msg-protocol:ros-message)
  ((tugID
    :reader tugID
    :initarg :tugID
    :type cl:fixnum
    :initform 0)
   (orderID
    :reader orderID
    :initarg :orderID
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector tugboat_control-msg:Waypoint)
   :initform (cl:make-array 0 :element-type 'tugboat_control-msg:Waypoint :initial-element (cl:make-instance 'tugboat_control-msg:Waypoint))))
)

(cl:defclass Path (<Path>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<Path> is deprecated: use tugboat_control-msg:Path instead.")))

(cl:ensure-generic-function 'tugID-val :lambda-list '(m))
(cl:defmethod tugID-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:tugID-val is deprecated.  Use tugboat_control-msg:tugID instead.")
  (tugID m))

(cl:ensure-generic-function 'orderID-val :lambda-list '(m))
(cl:defmethod orderID-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:orderID-val is deprecated.  Use tugboat_control-msg:orderID instead.")
  (orderID m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:data-val is deprecated.  Use tugboat_control-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path>) ostream)
  "Serializes a message object of type '<Path>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tugID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orderID)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path>) istream)
  "Deserializes a message object of type '<Path>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tugID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orderID)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tugboat_control-msg:Waypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path>)))
  "Returns string type for a message object of type '<Path>"
  "tugboat_control/Path")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path)))
  "Returns string type for a message object of type 'Path"
  "tugboat_control/Path")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path>)))
  "Returns md5sum for a message object of type '<Path>"
  "f0271dfc1e84d185aae5c12a5ce14e50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path)))
  "Returns md5sum for a message object of type 'Path"
  "f0271dfc1e84d185aae5c12a5ce14e50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path>)))
  "Returns full string definition for message of type '<Path>"
  (cl:format cl:nil "uint8 tugID~%uint8 orderID~%Waypoint[] data~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path)))
  "Returns full string definition for message of type 'Path"
  (cl:format cl:nil "uint8 tugID~%uint8 orderID~%Waypoint[] data~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path>))
  (cl:+ 0
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path>))
  "Converts a ROS message object to a list"
  (cl:list 'Path
    (cl:cons ':tugID (tugID msg))
    (cl:cons ':orderID (orderID msg))
    (cl:cons ':data (data msg))
))
