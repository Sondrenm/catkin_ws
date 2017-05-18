
(cl:in-package :asdf)

(defsystem "tugboat_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :tugboat_control-msg
)
  :components ((:file "_package")
    (:file "addOneTug" :depends-on ("_package_addOneTug"))
    (:file "_package_addOneTug" :depends-on ("_package"))
    (:file "removeOneTug" :depends-on ("_package_removeOneTug"))
    (:file "_package_removeOneTug" :depends-on ("_package"))
  ))