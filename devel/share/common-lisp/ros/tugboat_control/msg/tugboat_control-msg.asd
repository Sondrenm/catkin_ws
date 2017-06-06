
(cl:in-package :asdf)

(defsystem "tugboat_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BoatPose" :depends-on ("_package_BoatPose"))
    (:file "_package_BoatPose" :depends-on ("_package"))
    (:file "BoatPose" :depends-on ("_package_BoatPose"))
    (:file "_package_BoatPose" :depends-on ("_package"))
    (:file "ClearWaypoint" :depends-on ("_package_ClearWaypoint"))
    (:file "_package_ClearWaypoint" :depends-on ("_package"))
    (:file "ClearWaypoint" :depends-on ("_package_ClearWaypoint"))
    (:file "_package_ClearWaypoint" :depends-on ("_package"))
    (:file "Path" :depends-on ("_package_Path"))
    (:file "_package_Path" :depends-on ("_package"))
    (:file "Path" :depends-on ("_package_Path"))
    (:file "_package_Path" :depends-on ("_package"))
    (:file "PushingForce" :depends-on ("_package_PushingForce"))
    (:file "_package_PushingForce" :depends-on ("_package"))
    (:file "PushingForce" :depends-on ("_package_PushingForce"))
    (:file "_package_PushingForce" :depends-on ("_package"))
    (:file "Thrust" :depends-on ("_package_Thrust"))
    (:file "_package_Thrust" :depends-on ("_package"))
    (:file "Thrust" :depends-on ("_package_Thrust"))
    (:file "_package_Thrust" :depends-on ("_package"))
    (:file "TugSetpoints" :depends-on ("_package_TugSetpoints"))
    (:file "_package_TugSetpoints" :depends-on ("_package"))
    (:file "TugSetpoints" :depends-on ("_package_TugSetpoints"))
    (:file "_package_TugSetpoints" :depends-on ("_package"))
    (:file "Waypoint" :depends-on ("_package_Waypoint"))
    (:file "_package_Waypoint" :depends-on ("_package"))
    (:file "Waypoint" :depends-on ("_package_Waypoint"))
    (:file "_package_Waypoint" :depends-on ("_package"))
    (:file "Waypoints" :depends-on ("_package_Waypoints"))
    (:file "_package_Waypoints" :depends-on ("_package"))
    (:file "Waypoints" :depends-on ("_package_Waypoints"))
    (:file "_package_Waypoints" :depends-on ("_package"))
  ))