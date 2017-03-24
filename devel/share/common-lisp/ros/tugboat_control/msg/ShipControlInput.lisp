; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude ShipControlInput.msg.html

(cl:defclass <ShipControlInput> (roslisp-msg-protocol:ros-message)
  ((ShipPose
    :reader ShipPose
    :initarg :ShipPose
    :type tugboat_control-msg:BoatPose
    :initform (cl:make-instance 'tugboat_control-msg:BoatPose))
   (TugStatus
    :reader TugStatus
    :initarg :TugStatus
    :type (cl:vector tugboat_control-msg:TugStatus)
   :initform (cl:make-array 0 :element-type 'tugboat_control-msg:TugStatus :initial-element (cl:make-instance 'tugboat_control-msg:TugStatus))))
)

(cl:defclass ShipControlInput (<ShipControlInput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShipControlInput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShipControlInput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<ShipControlInput> is deprecated: use tugboat_control-msg:ShipControlInput instead.")))

(cl:ensure-generic-function 'ShipPose-val :lambda-list '(m))
(cl:defmethod ShipPose-val ((m <ShipControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:ShipPose-val is deprecated.  Use tugboat_control-msg:ShipPose instead.")
  (ShipPose m))

(cl:ensure-generic-function 'TugStatus-val :lambda-list '(m))
(cl:defmethod TugStatus-val ((m <ShipControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:TugStatus-val is deprecated.  Use tugboat_control-msg:TugStatus instead.")
  (TugStatus m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShipControlInput>) ostream)
  "Serializes a message object of type '<ShipControlInput>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ShipPose) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'TugStatus))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'TugStatus))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShipControlInput>) istream)
  "Deserializes a message object of type '<ShipControlInput>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ShipPose) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'TugStatus) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'TugStatus)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tugboat_control-msg:TugStatus))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShipControlInput>)))
  "Returns string type for a message object of type '<ShipControlInput>"
  "tugboat_control/ShipControlInput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShipControlInput)))
  "Returns string type for a message object of type 'ShipControlInput"
  "tugboat_control/ShipControlInput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShipControlInput>)))
  "Returns md5sum for a message object of type '<ShipControlInput>"
  "945e5ec50a8c1a88de62ff9741f9d15f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShipControlInput)))
  "Returns md5sum for a message object of type 'ShipControlInput"
  "945e5ec50a8c1a88de62ff9741f9d15f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShipControlInput>)))
  "Returns full string definition for message of type '<ShipControlInput>"
  (cl:format cl:nil "#What information is pertinent for controller??~%tugboat_control/BoatPose ShipPose~%tugboat_control/TugStatus[] TugStatus~%================================================================================~%MSG: tugboat_control/BoatPose~%float64 timestamp~%geometry_msgs/Pose2D[11] Pose~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%================================================================================~%MSG: tugboat_control/TugStatus~%uint8[] ID # ID > 99 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 theta #orientation in radians or degrees?~%float32 PushingForce # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShipControlInput)))
  "Returns full string definition for message of type 'ShipControlInput"
  (cl:format cl:nil "#What information is pertinent for controller??~%tugboat_control/BoatPose ShipPose~%tugboat_control/TugStatus[] TugStatus~%================================================================================~%MSG: tugboat_control/BoatPose~%float64 timestamp~%geometry_msgs/Pose2D[11] Pose~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%================================================================================~%MSG: tugboat_control/TugStatus~%uint8[] ID # ID > 99 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 theta #orientation in radians or degrees?~%float32 PushingForce # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShipControlInput>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ShipPose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'TugStatus) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShipControlInput>))
  "Converts a ROS message object to a list"
  (cl:list 'ShipControlInput
    (cl:cons ':ShipPose (ShipPose msg))
    (cl:cons ':TugStatus (TugStatus msg))
))
