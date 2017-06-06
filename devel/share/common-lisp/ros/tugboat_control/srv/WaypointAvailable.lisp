; Auto-generated. Do not edit!


(cl:in-package tugboat_control-srv)


;//! \htmlinclude WaypointAvailable-request.msg.html

(cl:defclass <WaypointAvailable-request> (roslisp-msg-protocol:ros-message)
  ((waypoint
    :reader waypoint
    :initarg :waypoint
    :type tugboat_control-msg:Waypoint
    :initform (cl:make-instance 'tugboat_control-msg:Waypoint)))
)

(cl:defclass WaypointAvailable-request (<WaypointAvailable-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaypointAvailable-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaypointAvailable-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<WaypointAvailable-request> is deprecated: use tugboat_control-srv:WaypointAvailable-request instead.")))

(cl:ensure-generic-function 'waypoint-val :lambda-list '(m))
(cl:defmethod waypoint-val ((m <WaypointAvailable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:waypoint-val is deprecated.  Use tugboat_control-srv:waypoint instead.")
  (waypoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaypointAvailable-request>) ostream)
  "Serializes a message object of type '<WaypointAvailable-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'waypoint) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaypointAvailable-request>) istream)
  "Deserializes a message object of type '<WaypointAvailable-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'waypoint) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaypointAvailable-request>)))
  "Returns string type for a service object of type '<WaypointAvailable-request>"
  "tugboat_control/WaypointAvailableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointAvailable-request)))
  "Returns string type for a service object of type 'WaypointAvailable-request"
  "tugboat_control/WaypointAvailableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaypointAvailable-request>)))
  "Returns md5sum for a message object of type '<WaypointAvailable-request>"
  "e256e0c870845448cbf5d0a1d2ba0749")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaypointAvailable-request)))
  "Returns md5sum for a message object of type 'WaypointAvailable-request"
  "e256e0c870845448cbf5d0a1d2ba0749")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaypointAvailable-request>)))
  "Returns full string definition for message of type '<WaypointAvailable-request>"
  (cl:format cl:nil "Waypoint waypoint~%~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaypointAvailable-request)))
  "Returns full string definition for message of type 'WaypointAvailable-request"
  (cl:format cl:nil "Waypoint waypoint~%~%================================================================================~%MSG: tugboat_control/Waypoint~%uint8 ID~%float64 x #	x position in meters~%float64 y #	y position in meters~%float64 v #	Velocity in m/s~%float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaypointAvailable-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'waypoint))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaypointAvailable-request>))
  "Converts a ROS message object to a list"
  (cl:list 'WaypointAvailable-request
    (cl:cons ':waypoint (waypoint msg))
))
;//! \htmlinclude WaypointAvailable-response.msg.html

(cl:defclass <WaypointAvailable-response> (roslisp-msg-protocol:ros-message)
  ((ans
    :reader ans
    :initarg :ans
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool)))
)

(cl:defclass WaypointAvailable-response (<WaypointAvailable-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaypointAvailable-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaypointAvailable-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<WaypointAvailable-response> is deprecated: use tugboat_control-srv:WaypointAvailable-response instead.")))

(cl:ensure-generic-function 'ans-val :lambda-list '(m))
(cl:defmethod ans-val ((m <WaypointAvailable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:ans-val is deprecated.  Use tugboat_control-srv:ans instead.")
  (ans m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaypointAvailable-response>) ostream)
  "Serializes a message object of type '<WaypointAvailable-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ans) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaypointAvailable-response>) istream)
  "Deserializes a message object of type '<WaypointAvailable-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ans) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaypointAvailable-response>)))
  "Returns string type for a service object of type '<WaypointAvailable-response>"
  "tugboat_control/WaypointAvailableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointAvailable-response)))
  "Returns string type for a service object of type 'WaypointAvailable-response"
  "tugboat_control/WaypointAvailableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaypointAvailable-response>)))
  "Returns md5sum for a message object of type '<WaypointAvailable-response>"
  "e256e0c870845448cbf5d0a1d2ba0749")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaypointAvailable-response)))
  "Returns md5sum for a message object of type 'WaypointAvailable-response"
  "e256e0c870845448cbf5d0a1d2ba0749")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaypointAvailable-response>)))
  "Returns full string definition for message of type '<WaypointAvailable-response>"
  (cl:format cl:nil "std_msgs/Bool ans~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaypointAvailable-response)))
  "Returns full string definition for message of type 'WaypointAvailable-response"
  (cl:format cl:nil "std_msgs/Bool ans~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaypointAvailable-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ans))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaypointAvailable-response>))
  "Converts a ROS message object to a list"
  (cl:list 'WaypointAvailable-response
    (cl:cons ':ans (ans msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'WaypointAvailable)))
  'WaypointAvailable-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'WaypointAvailable)))
  'WaypointAvailable-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointAvailable)))
  "Returns string type for a service object of type '<WaypointAvailable>"
  "tugboat_control/WaypointAvailable")