; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude ThrustCommand.msg.html

(cl:defclass <ThrustCommand> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (thrust
    :reader thrust
    :initarg :thrust
    :type cl:fixnum
    :initform 0)
   (cwturn
    :reader cwturn
    :initarg :cwturn
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ThrustCommand (<ThrustCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrustCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrustCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<ThrustCommand> is deprecated: use tugboat_control-msg:ThrustCommand instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <ThrustCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ID-val is deprecated.  Use tugboat_control-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'thrust-val :lambda-list '(m))
(cl:defmethod thrust-val ((m <ThrustCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:thrust-val is deprecated.  Use tugboat_control-msg:thrust instead.")
  (thrust m))

(cl:ensure-generic-function 'cwturn-val :lambda-list '(m))
(cl:defmethod cwturn-val ((m <ThrustCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:cwturn-val is deprecated.  Use tugboat_control-msg:cwturn instead.")
  (cwturn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrustCommand>) ostream)
  "Serializes a message object of type '<ThrustCommand>"
  (cl:let* ((signed (cl:slot-value msg 'ID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'thrust)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cwturn)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrustCommand>) istream)
  "Deserializes a message object of type '<ThrustCommand>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ID) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'thrust) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cwturn) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrustCommand>)))
  "Returns string type for a message object of type '<ThrustCommand>"
  "tugboat_control/ThrustCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrustCommand)))
  "Returns string type for a message object of type 'ThrustCommand"
  "tugboat_control/ThrustCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrustCommand>)))
  "Returns md5sum for a message object of type '<ThrustCommand>"
  "fcc2a347632ee0312c19efd7a2a067b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrustCommand)))
  "Returns md5sum for a message object of type 'ThrustCommand"
  "fcc2a347632ee0312c19efd7a2a067b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrustCommand>)))
  "Returns full string definition for message of type '<ThrustCommand>"
  (cl:format cl:nil "int8 ID~%int8 thrust~%int8 cwturn~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrustCommand)))
  "Returns full string definition for message of type 'ThrustCommand"
  (cl:format cl:nil "int8 ID~%int8 thrust~%int8 cwturn~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrustCommand>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrustCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrustCommand
    (cl:cons ':ID (ID msg))
    (cl:cons ':thrust (thrust msg))
    (cl:cons ':cwturn (cwturn msg))
))
