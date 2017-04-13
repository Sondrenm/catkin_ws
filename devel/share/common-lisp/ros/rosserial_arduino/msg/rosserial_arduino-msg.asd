
(cl:in-package :asdf)

(defsystem "rosserial_arduino-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Adc" :depends-on ("_package_Adc"))
    (:file "_package_Adc" :depends-on ("_package"))
    (:file "PushingForce" :depends-on ("_package_PushingForce"))
    (:file "_package_PushingForce" :depends-on ("_package"))
    (:file "ThrustCommand" :depends-on ("_package_ThrustCommand"))
    (:file "_package_ThrustCommand" :depends-on ("_package"))
  ))