
(cl:in-package :asdf)

(defsystem "tugboat_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BoatPose" :depends-on ("_package_BoatPose"))
    (:file "_package_BoatPose" :depends-on ("_package"))
    (:file "BoatPose" :depends-on ("_package_BoatPose"))
    (:file "_package_BoatPose" :depends-on ("_package"))
    (:file "ThrustCommand" :depends-on ("_package_ThrustCommand"))
    (:file "_package_ThrustCommand" :depends-on ("_package"))
    (:file "ThrustCommand" :depends-on ("_package_ThrustCommand"))
    (:file "_package_ThrustCommand" :depends-on ("_package"))
  ))