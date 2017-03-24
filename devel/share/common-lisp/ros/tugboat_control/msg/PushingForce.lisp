; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude PushingForce.msg.html

(cl:defclass <PushingForce> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (Newton
    :reader Newton
    :initarg :Newton
    :type cl:float
    :initform 0.0))
)

(cl:defclass PushingForce (<PushingForce>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PushingForce>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PushingForce)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<PushingForce> is deprecated: use tugboat_control-msg:PushingForce instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <PushingForce>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ID-val is deprecated.  Use tugboat_control-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'Newton-val :lambda-list '(m))
(cl:defmethod Newton-val ((m <PushingForce>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:Newton-val is deprecated.  Use tugboat_control-msg:Newton instead.")
  (Newton m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PushingForce>) ostream)
  "Serializes a message object of type '<PushingForce>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Newton))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PushingForce>) istream)
  "Deserializes a message object of type '<PushingForce>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Newton) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PushingForce>)))
  "Returns string type for a message object of type '<PushingForce>"
  "tugboat_control/PushingForce")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushingForce)))
  "Returns string type for a message object of type 'PushingForce"
  "tugboat_control/PushingForce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PushingForce>)))
  "Returns md5sum for a message object of type '<PushingForce>"
  "f1e8c141d7c72b50fc72611355ca6d95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PushingForce)))
  "Returns md5sum for a message object of type 'PushingForce"
  "f1e8c141d7c72b50fc72611355ca6d95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PushingForce>)))
  "Returns full string definition for message of type '<PushingForce>"
  (cl:format cl:nil "# From Arduino~%uint8 ID~%float32 Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PushingForce)))
  "Returns full string definition for message of type 'PushingForce"
  (cl:format cl:nil "# From Arduino~%uint8 ID~%float32 Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PushingForce>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PushingForce>))
  "Converts a ROS message object to a list"
  (cl:list 'PushingForce
    (cl:cons ':ID (ID msg))
    (cl:cons ':Newton (Newton msg))
))
