; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude TugControlCommand.msg.html

(cl:defclass <TugControlCommand> (roslisp-msg-protocol:ros-message)
  ((orientation
    :reader orientation
    :initarg :orientation
    :type cl:float
    :initform 0.0)
   (pushingForce
    :reader pushingForce
    :initarg :pushingForce
    :type cl:float
    :initform 0.0))
)

(cl:defclass TugControlCommand (<TugControlCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TugControlCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TugControlCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<TugControlCommand> is deprecated: use tugboat_control-msg:TugControlCommand instead.")))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <TugControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:orientation-val is deprecated.  Use tugboat_control-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'pushingForce-val :lambda-list '(m))
(cl:defmethod pushingForce-val ((m <TugControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:pushingForce-val is deprecated.  Use tugboat_control-msg:pushingForce instead.")
  (pushingForce m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TugControlCommand>) ostream)
  "Serializes a message object of type '<TugControlCommand>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orientation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pushingForce))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TugControlCommand>) istream)
  "Deserializes a message object of type '<TugControlCommand>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orientation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pushingForce) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TugControlCommand>)))
  "Returns string type for a message object of type '<TugControlCommand>"
  "tugboat_control/TugControlCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TugControlCommand)))
  "Returns string type for a message object of type 'TugControlCommand"
  "tugboat_control/TugControlCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TugControlCommand>)))
  "Returns md5sum for a message object of type '<TugControlCommand>"
  "38391dab0ab53d38a3bbd7116ff3b3f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TugControlCommand)))
  "Returns md5sum for a message object of type 'TugControlCommand"
  "38391dab0ab53d38a3bbd7116ff3b3f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TugControlCommand>)))
  "Returns full string definition for message of type '<TugControlCommand>"
  (cl:format cl:nil "float32 orientation~%float32 pushingForce~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TugControlCommand)))
  "Returns full string definition for message of type 'TugControlCommand"
  (cl:format cl:nil "float32 orientation~%float32 pushingForce~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TugControlCommand>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TugControlCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'TugControlCommand
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':pushingForce (pushingForce msg))
))
