
(cl:in-package :asdf)

(defsystem "tugboat_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
               :tugboat_control-msg
)
  :components ((:file "_package")
    (:file "AvoidShipCollision" :depends-on ("_package_AvoidShipCollision"))
    (:file "_package_AvoidShipCollision" :depends-on ("_package"))
    (:file "WaypointAvailable" :depends-on ("_package_WaypointAvailable"))
    (:file "_package_WaypointAvailable" :depends-on ("_package"))
    (:file "addOneTug" :depends-on ("_package_addOneTug"))
    (:file "_package_addOneTug" :depends-on ("_package"))
    (:file "removeOneTug" :depends-on ("_package_removeOneTug"))
    (:file "_package_removeOneTug" :depends-on ("_package"))
  ))