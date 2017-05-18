; Auto-generated. Do not edit!


(cl:in-package tugboat_control-srv)


;//! \htmlinclude addOneTug-request.msg.html

(cl:defclass <addOneTug-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass addOneTug-request (<addOneTug-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addOneTug-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addOneTug-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<addOneTug-request> is deprecated: use tugboat_control-srv:addOneTug-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addOneTug-request>) ostream)
  "Serializes a message object of type '<addOneTug-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addOneTug-request>) istream)
  "Deserializes a message object of type '<addOneTug-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addOneTug-request>)))
  "Returns string type for a service object of type '<addOneTug-request>"
  "tugboat_control/addOneTugRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addOneTug-request)))
  "Returns string type for a service object of type 'addOneTug-request"
  "tugboat_control/addOneTugRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addOneTug-request>)))
  "Returns md5sum for a message object of type '<addOneTug-request>"
  "605a7c6929aec48e81da00e68778ab7c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addOneTug-request)))
  "Returns md5sum for a message object of type 'addOneTug-request"
  "605a7c6929aec48e81da00e68778ab7c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addOneTug-request>)))
  "Returns full string definition for message of type '<addOneTug-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addOneTug-request)))
  "Returns full string definition for message of type 'addOneTug-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addOneTug-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addOneTug-request>))
  "Converts a ROS message object to a list"
  (cl:list 'addOneTug-request
))
;//! \htmlinclude addOneTug-response.msg.html

(cl:defclass <addOneTug-response> (roslisp-msg-protocol:ros-message)
  ((Pose
    :reader Pose
    :initarg :Pose
    :type tugboat_control-msg:BoatPose
    :initform (cl:make-instance 'tugboat_control-msg:BoatPose)))
)

(cl:defclass addOneTug-response (<addOneTug-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addOneTug-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addOneTug-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<addOneTug-response> is deprecated: use tugboat_control-srv:addOneTug-response instead.")))

(cl:ensure-generic-function 'Pose-val :lambda-list '(m))
(cl:defmethod Pose-val ((m <addOneTug-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:Pose-val is deprecated.  Use tugboat_control-srv:Pose instead.")
  (Pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addOneTug-response>) ostream)
  "Serializes a message object of type '<addOneTug-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addOneTug-response>) istream)
  "Deserializes a message object of type '<addOneTug-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addOneTug-response>)))
  "Returns string type for a service object of type '<addOneTug-response>"
  "tugboat_control/addOneTugResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addOneTug-response)))
  "Returns string type for a service object of type 'addOneTug-response"
  "tugboat_control/addOneTugResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addOneTug-response>)))
  "Returns md5sum for a message object of type '<addOneTug-response>"
  "605a7c6929aec48e81da00e68778ab7c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addOneTug-response)))
  "Returns md5sum for a message object of type 'addOneTug-response"
  "605a7c6929aec48e81da00e68778ab7c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addOneTug-response>)))
  "Returns full string definition for message of type '<addOneTug-response>"
  (cl:format cl:nil "BoatPose Pose~%~%================================================================================~%MSG: tugboat_control/BoatPose~%uint8 ID # ID~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from x-axis~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addOneTug-response)))
  "Returns full string definition for message of type 'addOneTug-response"
  (cl:format cl:nil "BoatPose Pose~%~%================================================================================~%MSG: tugboat_control/BoatPose~%uint8 ID # ID~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from x-axis~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addOneTug-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addOneTug-response>))
  "Converts a ROS message object to a list"
  (cl:list 'addOneTug-response
    (cl:cons ':Pose (Pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'addOneTug)))
  'addOneTug-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'addOneTug)))
  'addOneTug-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addOneTug)))
  "Returns string type for a service object of type '<addOneTug>"
  "tugboat_control/addOneTug")