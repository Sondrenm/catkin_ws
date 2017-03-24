; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude BoatPose.msg.html

(cl:defclass <BoatPose> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:float
    :initform 0.0)
   (Pose
    :reader Pose
    :initarg :Pose
    :type (cl:vector geometry_msgs-msg:Pose2D)
   :initform (cl:make-array 11 :element-type 'geometry_msgs-msg:Pose2D :initial-element (cl:make-instance 'geometry_msgs-msg:Pose2D))))
)

(cl:defclass BoatPose (<BoatPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoatPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoatPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<BoatPose> is deprecated: use tugboat_control-msg:BoatPose instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <BoatPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:timestamp-val is deprecated.  Use tugboat_control-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'Pose-val :lambda-list '(m))
(cl:defmethod Pose-val ((m <BoatPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:Pose-val is deprecated.  Use tugboat_control-msg:Pose instead.")
  (Pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoatPose>) ostream)
  "Serializes a message object of type '<BoatPose>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Pose))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoatPose>) istream)
  "Deserializes a message object of type '<BoatPose>"
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
  (cl:setf (cl:slot-value msg 'Pose) (cl:make-array 11))
  (cl:let ((vals (cl:slot-value msg 'Pose)))
    (cl:dotimes (i 11)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
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
  "fac719579a6887c70b1bfc580630888c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoatPose)))
  "Returns md5sum for a message object of type 'BoatPose"
  "fac719579a6887c70b1bfc580630888c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoatPose>)))
  "Returns full string definition for message of type '<BoatPose>"
  (cl:format cl:nil "float64 timestamp~%geometry_msgs/Pose2D[11] Pose~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoatPose)))
  "Returns full string definition for message of type 'BoatPose"
  (cl:format cl:nil "float64 timestamp~%geometry_msgs/Pose2D[11] Pose~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoatPose>))
  (cl:+ 0
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'Pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoatPose>))
  "Converts a ROS message object to a list"
  (cl:list 'BoatPose
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':Pose (Pose msg))
))
