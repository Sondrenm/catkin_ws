; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude BoatList.msg.html

(cl:defclass <BoatList> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:float
    :initform 0.0)
   (boat
    :reader boat
    :initarg :boat
    :type (cl:vector tugboat_control-msg:BoatStatus)
   :initform (cl:make-array 0 :element-type 'tugboat_control-msg:BoatStatus :initial-element (cl:make-instance 'tugboat_control-msg:BoatStatus))))
)

(cl:defclass BoatList (<BoatList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoatList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoatList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<BoatList> is deprecated: use tugboat_control-msg:BoatList instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <BoatList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:timestamp-val is deprecated.  Use tugboat_control-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'boat-val :lambda-list '(m))
(cl:defmethod boat-val ((m <BoatList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:boat-val is deprecated.  Use tugboat_control-msg:boat instead.")
  (boat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoatList>) ostream)
  "Serializes a message object of type '<BoatList>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'boat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'boat))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoatList>) istream)
  "Deserializes a message object of type '<BoatList>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'boat) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'boat)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tugboat_control-msg:BoatStatus))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoatList>)))
  "Returns string type for a message object of type '<BoatList>"
  "tugboat_control/BoatList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoatList)))
  "Returns string type for a message object of type 'BoatList"
  "tugboat_control/BoatList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoatList>)))
  "Returns md5sum for a message object of type '<BoatList>"
  "7496deb9bbcbc436dc7f31a8e28cfe6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoatList)))
  "Returns md5sum for a message object of type 'BoatList"
  "7496deb9bbcbc436dc7f31a8e28cfe6d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoatList>)))
  "Returns full string definition for message of type '<BoatList>"
  (cl:format cl:nil "float64 timestamp~%tugboat_control/BoatStatus[] boat~%================================================================================~%MSG: tugboat_control/BoatStatus~%uint8 ID # ID > 99 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 theta #orientation in radians or degrees?~%float32 PushingForce # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoatList)))
  "Returns full string definition for message of type 'BoatList"
  (cl:format cl:nil "float64 timestamp~%tugboat_control/BoatStatus[] boat~%================================================================================~%MSG: tugboat_control/BoatStatus~%uint8 ID # ID > 99 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 theta #orientation in radians or degrees?~%float32 PushingForce # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoatList>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'boat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoatList>))
  "Converts a ROS message object to a list"
  (cl:list 'BoatList
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':boat (boat msg))
))
