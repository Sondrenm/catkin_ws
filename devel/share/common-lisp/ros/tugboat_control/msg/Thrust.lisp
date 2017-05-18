; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude Thrust.msg.html

(cl:defclass <Thrust> (roslisp-msg-protocol:ros-message)
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
   (ccwturn
    :reader ccwturn
    :initarg :ccwturn
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Thrust (<Thrust>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Thrust>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Thrust)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<Thrust> is deprecated: use tugboat_control-msg:Thrust instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <Thrust>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ID-val is deprecated.  Use tugboat_control-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'thrust-val :lambda-list '(m))
(cl:defmethod thrust-val ((m <Thrust>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:thrust-val is deprecated.  Use tugboat_control-msg:thrust instead.")
  (thrust m))

(cl:ensure-generic-function 'ccwturn-val :lambda-list '(m))
(cl:defmethod ccwturn-val ((m <Thrust>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ccwturn-val is deprecated.  Use tugboat_control-msg:ccwturn instead.")
  (ccwturn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Thrust>) ostream)
  "Serializes a message object of type '<Thrust>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'thrust)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ccwturn)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Thrust>) istream)
  "Deserializes a message object of type '<Thrust>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'thrust) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ccwturn) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Thrust>)))
  "Returns string type for a message object of type '<Thrust>"
  "tugboat_control/Thrust")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Thrust)))
  "Returns string type for a message object of type 'Thrust"
  "tugboat_control/Thrust")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Thrust>)))
  "Returns md5sum for a message object of type '<Thrust>"
  "06f7728b8ee5a6c967559af514f9b25c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Thrust)))
  "Returns md5sum for a message object of type 'Thrust"
  "06f7728b8ee5a6c967559af514f9b25c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Thrust>)))
  "Returns full string definition for message of type '<Thrust>"
  (cl:format cl:nil "# To Arduino~%uint8 ID~%int8 thrust # In % +- 100~%int8 ccwturn # In % +- 100~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Thrust)))
  "Returns full string definition for message of type 'Thrust"
  (cl:format cl:nil "# To Arduino~%uint8 ID~%int8 thrust # In % +- 100~%int8 ccwturn # In % +- 100~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Thrust>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Thrust>))
  "Converts a ROS message object to a list"
  (cl:list 'Thrust
    (cl:cons ':ID (ID msg))
    (cl:cons ':thrust (thrust msg))
    (cl:cons ':ccwturn (ccwturn msg))
))
