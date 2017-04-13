; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude BoatStatus.msg.html

(cl:defclass <BoatStatus> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
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

(cl:defclass BoatStatus (<BoatStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoatStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoatStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<BoatStatus> is deprecated: use tugboat_control-msg:BoatStatus instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <BoatStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ID-val is deprecated.  Use tugboat_control-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <BoatStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:x-val is deprecated.  Use tugboat_control-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <BoatStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:y-val is deprecated.  Use tugboat_control-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'o-val :lambda-list '(m))
(cl:defmethod o-val ((m <BoatStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:o-val is deprecated.  Use tugboat_control-msg:o instead.")
  (o m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <BoatStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:force-val is deprecated.  Use tugboat_control-msg:force instead.")
  (force m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoatStatus>) ostream)
  "Serializes a message object of type '<BoatStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'o))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoatStatus>) istream)
  "Deserializes a message object of type '<BoatStatus>"
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
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'force) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoatStatus>)))
  "Returns string type for a message object of type '<BoatStatus>"
  "tugboat_control/BoatStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoatStatus)))
  "Returns string type for a message object of type 'BoatStatus"
  "tugboat_control/BoatStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoatStatus>)))
  "Returns md5sum for a message object of type '<BoatStatus>"
  "2567430f0fee0ed87837dda5f3903f11")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoatStatus)))
  "Returns md5sum for a message object of type 'BoatStatus"
  "2567430f0fee0ed87837dda5f3903f11")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoatStatus>)))
  "Returns full string definition for message of type '<BoatStatus>"
  (cl:format cl:nil "uint8 ID # ID == 0 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from \"east\"~%float32 force # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoatStatus)))
  "Returns full string definition for message of type 'BoatStatus"
  (cl:format cl:nil "uint8 ID # ID == 0 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from \"east\"~%float32 force # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoatStatus>))
  (cl:+ 0
     1
     8
     8
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoatStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'BoatStatus
    (cl:cons ':ID (ID msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':o (o msg))
    (cl:cons ':force (force msg))
))
