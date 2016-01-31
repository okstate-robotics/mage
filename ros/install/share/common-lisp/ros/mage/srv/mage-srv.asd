
(cl:in-package :asdf)

(defsystem "mage-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "environmental_data" :depends-on ("_package_environmental_data"))
    (:file "_package_environmental_data" :depends-on ("_package"))
    (:file "model_data" :depends-on ("_package_model_data"))
    (:file "_package_model_data" :depends-on ("_package"))
    (:file "navigation_data" :depends-on ("_package_navigation_data"))
    (:file "_package_navigation_data" :depends-on ("_package"))
  ))