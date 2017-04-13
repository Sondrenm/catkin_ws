; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude TugSetpoints.msg.html

(cl:defclass <TugSetpoints> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (o
    :reader o
    :initarg :o
    :type cl:float
    :initform 0.0)
   (force
    :reader force
    :initarg :force
    :type cl:float
    :initform 0.0))
)

(cl:defclass TugSetpoints (<TugSetpoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TugSetpoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TugSetpoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<TugSetpoints> is deprecated: use tugboat_control-msg:TugSetpoints instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <TugSetpoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ID-val is deprecated.  Use tugboat_control-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'o-val :lambda-list '(m))
(cl:defmethod o-val ((m <TugSetpoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:o-val is deprecated.  Use tugboat_control-msg:o instead.")
  (o m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <TugSetpoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:force-val is deprecated.  Use tugboat_control-msg:force instead.")
  (force m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TugSetpoints>) ostream)
  "Serializes a message object of type '<TugSetpoints>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'o))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TugSetpoints>) istream)
  "Deserializes a message object of type '<TugSetpoints>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'o) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TugSetpoints>)))
  "Returns string type for a message object of type '<TugSetpoints>"
  "tugboat_control/TugSetpoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TugSetpoints)))
  "Returns string type for a message object of type 'TugSetpoints"
  "tugboat_control/TugSetpoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TugSetpoints>)))
  "Returns md5sum for a message object of type '<TugSetpoints>"
  "8794df36994479d46b6355b637b13061")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TugSetpoints)))
  "Returns md5sum for a message object of type 'TugSetpoints"
  "8794df36994479d46b6355b637b13061")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TugSetpoints>)))
  "Returns full string definition for message of type '<TugSetpoints>"
  (cl:format cl:nil "uint8 ID~%float64 o~%float64 force~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TugSetpoints)))
  "Returns full string definition for message of type 'TugSetpoints"
  (cl:format cl:nil "uint8 ID~%float64 o~%float64 force~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TugSetpoints>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TugSetpoints>))
  "Converts a ROS message object to a list"
  (cl:list 'TugSetpoints
    (cl:cons ':ID (ID msg))
    (cl:cons ':o (o msg))
    (cl:cons ':force (force msg))
))
