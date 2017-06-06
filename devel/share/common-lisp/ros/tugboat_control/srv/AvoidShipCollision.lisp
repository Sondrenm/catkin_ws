; Auto-generated. Do not edit!


(cl:in-package tugboat_control-srv)


;//! \htmlinclude AvoidShipCollision-request.msg.html

(cl:defclass <AvoidShipCollision-request> (roslisp-msg-protocol:ros-message)
  ((from
    :reader from
    :initarg :from
    :type tugboat_control-msg:Waypoint
    :initform (cl:make-instance 'tugboat_control-msg:Waypoint))
   (to
    :reader to
    :initarg :to
    :type tugboat_control-msg:Waypoint
    :initform (cl:make-instance 'tugboat_control-msg:Waypoint)))
)

(cl:defclass AvoidShipCollision-request (<AvoidShipCollision-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AvoidShipCollision-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AvoidShipCollision-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<AvoidShipCollision-request> is deprecated: use tugboat_control-srv:AvoidShipCollision-request instead.")))

(cl:ensure-generic-function 'from-val :lambda-list '(m))
(cl:defmethod from-val ((m <AvoidShipCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:from-val is deprecated.  Use tugboat_control-srv:from instead.")
  (from m))

(cl:ensure-generic-function 'to-val :lambda-list '(m))
(cl:defmethod to-val ((m <AvoidShipCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:to-val is deprecated.  Use tugboat_control-srv:to instead.")
  (to m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AvoidShipCollision-request>) ostream)
  "Serializes a message object of type '<AvoidShipCollision-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'from) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'to) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AvoidShipCollision-request>) istream)
  "Deserializes a message object of type '<AvoidShipCollision-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'from) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'to) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AvoidShipCollision-request>)))
  "Returns string type for a service object of type '<AvoidShipCollision-request>"
  "tugboat_control/AvoidShipCollisionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AvoidShipCollision-request)))
  "Returns string type for a service object of type 'AvoidShipCollision-request"
  "tugboat_control/AvoidShipCollisionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AvoidShipCollision-request>)))
  "Returns md5sum for a message object of type '<AvoidShipCollision-request>"
  "1d3ed13e2b52083674842ac5b19130cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AvoidShipCollision-request)))
  "Returns md5sum for a message object of type 'AvoidShipCollision-request"
  "1d3ed13e2b52083674842ac5b19130cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AvoidShipCollision-request>)))
  "Returns full string definition for message of type '<AvoidShipCollision-request>"
  (cl:format cl:nil "Waypoint from~%Waypoint to~%~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AvoidShipCollision-request)))
  "Returns full string definition for message of type 'AvoidShipCollision-request"
  (cl:format cl:nil "Waypoint from~%Waypoint to~%~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AvoidShipCollision-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'from))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'to))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AvoidShipCollision-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AvoidShipCollision-request
    (cl:cons ':from (from msg))
    (cl:cons ':to (to msg))
))
;//! \htmlinclude AvoidShipCollision-response.msg.html

(cl:defclass <AvoidShipCollision-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type (cl:vector tugboat_control-msg:Waypoint)
   :initform (cl:make-array 0 :element-type 'tugboat_control-msg:Waypoint :initial-element (cl:make-instance 'tugboat_control-msg:Waypoint))))
)

(cl:defclass AvoidShipCollision-response (<AvoidShipCollision-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AvoidShipCollision-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AvoidShipCollision-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<AvoidShipCollision-response> is deprecated: use tugboat_control-srv:AvoidShipCollision-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <AvoidShipCollision-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:path-val is deprecated.  Use tugboat_control-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AvoidShipCollision-response>) ostream)
  "Serializes a message object of type '<AvoidShipCollision-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AvoidShipCollision-response>) istream)
  "Deserializes a message object of type '<AvoidShipCollision-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tugboat_control-msg:Waypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AvoidShipCollision-response>)))
  "Returns string type for a service object of type '<AvoidShipCollision-response>"
  "tugboat_control/AvoidShipCollisionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AvoidShipCollision-response)))
  "Returns string type for a service object of type 'AvoidShipCollision-response"
  "tugboat_control/AvoidShipCollisionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AvoidShipCollision-response>)))
  "Returns md5sum for a message object of type '<AvoidShipCollision-response>"
  "1d3ed13e2b52083674842ac5b19130cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AvoidShipCollision-response)))
  "Returns md5sum for a message object of type 'AvoidShipCollision-response"
  "1d3ed13e2b52083674842ac5b19130cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AvoidShipCollision-response>)))
  "Returns full string definition for message of type '<AvoidShipCollision-response>"
  (cl:format cl:nil "Waypoint[] path~%~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AvoidShipCollision-response)))
  "Returns full string definition for message of type 'AvoidShipCollision-response"
  (cl:format cl:nil "Waypoint[] path~%~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AvoidShipCollision-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AvoidShipCollision-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AvoidShipCollision-response
    (cl:cons ':path (path msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AvoidShipCollision)))
  'AvoidShipCollision-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AvoidShipCollision)))
  'AvoidShipCollision-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AvoidShipCollision)))
  "Returns string type for a service object of type '<AvoidShipCollision>"
  "tugboat_control/AvoidShipCollision")