; Auto-generated. Do not edit!


(cl:in-package tugboat_control-srv)


;//! \htmlinclude removeOneTug-request.msg.html

(cl:defclass <removeOneTug-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass removeOneTug-request (<removeOneTug-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <removeOneTug-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'removeOneTug-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<removeOneTug-request> is deprecated: use tugboat_control-srv:removeOneTug-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <removeOneTug-request>) ostream)
  "Serializes a message object of type '<removeOneTug-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <removeOneTug-request>) istream)
  "Deserializes a message object of type '<removeOneTug-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<removeOneTug-request>)))
  "Returns string type for a service object of type '<removeOneTug-request>"
  "tugboat_control/removeOneTugRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeOneTug-request)))
  "Returns string type for a service object of type 'removeOneTug-request"
  "tugboat_control/removeOneTugRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<removeOneTug-request>)))
  "Returns md5sum for a message object of type '<removeOneTug-request>"
  "4ac1f338ecfa845186d806d49892dc3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'removeOneTug-request)))
  "Returns md5sum for a message object of type 'removeOneTug-request"
  "4ac1f338ecfa845186d806d49892dc3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<removeOneTug-request>)))
  "Returns full string definition for message of type '<removeOneTug-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'removeOneTug-request)))
  "Returns full string definition for message of type 'removeOneTug-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <removeOneTug-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <removeOneTug-request>))
  "Converts a ROS message object to a list"
  (cl:list 'removeOneTug-request
))
;//! \htmlinclude removeOneTug-response.msg.html

(cl:defclass <removeOneTug-response> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0))
)

(cl:defclass removeOneTug-response (<removeOneTug-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <removeOneTug-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'removeOneTug-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-srv:<removeOneTug-response> is deprecated: use tugboat_control-srv:removeOneTug-response instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <removeOneTug-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-srv:ID-val is deprecated.  Use tugboat_control-srv:ID instead.")
  (ID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <removeOneTug-response>) ostream)
  "Serializes a message object of type '<removeOneTug-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <removeOneTug-response>) istream)
  "Deserializes a message object of type '<removeOneTug-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<removeOneTug-response>)))
  "Returns string type for a service object of type '<removeOneTug-response>"
  "tugboat_control/removeOneTugResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeOneTug-response)))
  "Returns string type for a service object of type 'removeOneTug-response"
  "tugboat_control/removeOneTugResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<removeOneTug-response>)))
  "Returns md5sum for a message object of type '<removeOneTug-response>"
  "4ac1f338ecfa845186d806d49892dc3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'removeOneTug-response)))
  "Returns md5sum for a message object of type 'removeOneTug-response"
  "4ac1f338ecfa845186d806d49892dc3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<removeOneTug-response>)))
  "Returns full string definition for message of type '<removeOneTug-response>"
  (cl:format cl:nil "uint8 ID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'removeOneTug-response)))
  "Returns full string definition for message of type 'removeOneTug-response"
  (cl:format cl:nil "uint8 ID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <removeOneTug-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <removeOneTug-response>))
  "Converts a ROS message object to a list"
  (cl:list 'removeOneTug-response
    (cl:cons ':ID (ID msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'removeOneTug)))
  'removeOneTug-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'removeOneTug)))
  'removeOneTug-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeOneTug)))
  "Returns string type for a service object of type '<removeOneTug>"
  "tugboat_control/removeOneTug")