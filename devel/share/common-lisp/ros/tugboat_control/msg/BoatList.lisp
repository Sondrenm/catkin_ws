; Auto-generated. Do not edit!


(cl:in-package tugboat_control-msg)


;//! \htmlinclude BoatList.msg.html

(cl:defclass <BoatList> (roslisp-msg-protocol:ros-message)
  ((boat
    :reader boat
    :initarg :boat
    :type (cl:vector tugboat_control-msg:BoatStatus)
   :initform (cl:make-array 50 :element-type 'tugboat_control-msg:BoatStatus :initial-element (cl:make-instance 'tugboat_control-msg:BoatStatus))))
)

(cl:defclass BoatList (<BoatList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoatList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoatList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tugboat_control-msg:<BoatList> is deprecated: use tugboat_control-msg:BoatList instead.")))

(cl:ensure-generic-function 'boat-val :lambda-list '(m))
(cl:defmethod boat-val ((m <BoatList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tugboat_control-msg:boat-val is deprecated.  Use tugboat_control-msg:boat instead.")
  (boat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoatList>) ostream)
  "Serializes a message object of type '<BoatList>"
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'boat))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoatList>) istream)
  "Deserializes a message object of type '<BoatList>"
  (cl:setf (cl:slot-value msg 'boat) (cl:make-array 50))
  (cl:let ((vals (cl:slot-value msg 'boat)))
    (cl:dotimes (i 50)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tugboat_control-msg:BoatStatus))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
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
  "fb1531b66e8422b2c672c2aeeec4a39f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoatList)))
  "Returns md5sum for a message object of type 'BoatList"
  "fb1531b66e8422b2c672c2aeeec4a39f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoatList>)))
  "Returns full string definition for message of type '<BoatList>"
  (cl:format cl:nil "tugboat_control/BoatStatus[50] boat~%================================================================================~%MSG: tugboat_control/BoatStatus~%uint8 ID # ID == 0 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from \"east\"~%float32 force # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoatList)))
  "Returns full string definition for message of type 'BoatList"
  (cl:format cl:nil "tugboat_control/BoatStatus[50] boat~%================================================================================~%MSG: tugboat_control/BoatStatus~%uint8 ID # ID == 0 indicates ship~%float64 x #x position in meters~%float64 y #y position in meters~%float64 o #orientation in +-pi radians from \"east\"~%float32 force # Newton~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoatList>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'boat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoatList>))
  "Converts a ROS message object to a list"
  (cl:list 'BoatList
    (cl:cons ':boat (boat msg))
))
