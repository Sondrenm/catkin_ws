; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude TugSetpoints.msg.html

(cl:defclass <TugSetpoints> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (orientation
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

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <TugSetpoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:orientation-val is deprecated.  Use tugboat_control-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'pushingForce-val :lambda-list '(m))
(cl:defmethod pushingForce-val ((m <TugSetpoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:pushingForce-val is deprecated.  Use tugboat_control-msg:pushingForce instead.")
  (pushingForce m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TugSetpoints>) ostream)
  "Serializes a message object of type '<TugSetpoints>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'orientation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pushingForce))))
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
    (cl:setf (cl:slot-value msg 'orientation) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pushingForce) (roslisp-utils:decode-double-float-bits bits)))
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
  "0b1a644af72e0374fc50096b433f3946")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TugSetpoints)))
  "Returns md5sum for a message object of type 'TugSetpoints"
  "0b1a644af72e0374fc50096b433f3946")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TugSetpoints>)))
  "Returns full string definition for message of type '<TugSetpoints>"
  (cl:format cl:nil "uint8 ID~%float64 orientation~%float64 pushingForce~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TugSetpoints)))
  "Returns full string definition for message of type 'TugSetpoints"
  (cl:format cl:nil "uint8 ID~%float64 orientation~%float64 pushingForce~%~%"))
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
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':pushingForce (pushingForce msg))
))
