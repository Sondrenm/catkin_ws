; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude BoatPose.msg.html

(cl:defclass <BoatPose> (roslisp-msg-protocol:ros-message)
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
    :initform 0.0))
)

(cl:defclass BoatPose (<BoatPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoatPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoatPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<BoatPose> is deprecated: use tugboat_control-msg:BoatPose instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <BoatPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ID-val is deprecated.  Use tugboat_control-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <BoatPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:x-val is deprecated.  Use tugboat_control-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <BoatPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:y-val is deprecated.  Use tugboat_control-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'o-val :lambda-list '(m))
(cl:defmethod o-val ((m <BoatPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:o-val is deprecated.  Use tugboat_control-msg:o instead.")
  (o m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoatPose>) ostream)
  "Serializes a message object of type '<BoatPose>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoatPose>) istream)
  "Deserializes a message object of type '<BoatPose>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoatPose>)))
  "Returns string type for a message object of type '<BoatPose>"
  "tugboat_control/BoatPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoatPose)))
  "Returns string type for a message object of type 'BoatPose"
  "tugboat_control/BoatPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoatPose>)))
  "Returns md5sum for a message object of type '<BoatPose>"
  "e95f3e67135784b4229f3c4a980afa6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoatPose)))
  "Returns md5sum for a message object of type 'BoatPose"
  "e95f3e67135784b4229f3c4a980afa6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoatPose>)))
  "Returns full string definition for message of type '<BoatPose>"
  (cl:format cl:nil "uint8 ID # ID~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from x-axis~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoatPose)))
  "Returns full string definition for message of type 'BoatPose"
  (cl:format cl:nil "uint8 ID # ID~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from x-axis~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoatPose>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoatPose>))
  "Converts a ROS message object to a list"
  (cl:list 'BoatPose
    (cl:cons ':ID (ID msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':o (o msg))
))
