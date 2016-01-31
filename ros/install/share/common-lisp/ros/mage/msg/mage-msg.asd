
(cl:in-package :asdf)

(defsystem "mage-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "command_data" :depends-on ("_package_command_data"))
    (:file "_package_command_data" :depends-on ("_package"))
    (:file "navigation_data" :depends-on ("_package_navigation_data"))
    (:file "_package_navigation_data" :depends-on ("_package"))
    (:file "sensor_data" :depends-on ("_package_sensor_data"))
    (:file "_package_sensor_data" :depends-on ("_package"))
  ))