# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mage: 2 messages, 3 services")

set(MSG_I_FLAGS "-Image:/home/daslab-server1/Rakshit/ros/src/mage/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mage_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg" NAME_WE)
add_custom_target(_mage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mage" "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg" ""
)

get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv" NAME_WE)
add_custom_target(_mage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mage" "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv" ""
)

get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg" NAME_WE)
add_custom_target(_mage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mage" "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg" ""
)

get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv" NAME_WE)
add_custom_target(_mage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mage" "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv" ""
)

get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv" NAME_WE)
add_custom_target(_mage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mage" "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
)
_generate_msg_cpp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
)

### Generating Services
_generate_srv_cpp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
)
_generate_srv_cpp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
)
_generate_srv_cpp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
)

### Generating Module File
_generate_module_cpp(mage
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mage_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mage_generate_messages mage_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_cpp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_cpp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_cpp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_cpp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_cpp _mage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mage_gencpp)
add_dependencies(mage_gencpp mage_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mage_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
)
_generate_msg_eus(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
)

### Generating Services
_generate_srv_eus(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
)
_generate_srv_eus(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
)
_generate_srv_eus(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
)

### Generating Module File
_generate_module_eus(mage
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mage_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mage_generate_messages mage_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_eus _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_eus _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_eus _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_eus _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_eus _mage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mage_geneus)
add_dependencies(mage_geneus mage_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mage_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
)
_generate_msg_lisp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
)

### Generating Services
_generate_srv_lisp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
)
_generate_srv_lisp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
)
_generate_srv_lisp(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
)

### Generating Module File
_generate_module_lisp(mage
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mage_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mage_generate_messages mage_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_lisp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_lisp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_lisp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_lisp _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_lisp _mage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mage_genlisp)
add_dependencies(mage_genlisp mage_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mage_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
)
_generate_msg_py(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
)

### Generating Services
_generate_srv_py(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
)
_generate_srv_py(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
)
_generate_srv_py(mage
  "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
)

### Generating Module File
_generate_module_py(mage
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mage_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mage_generate_messages mage_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/sensor_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_py _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/model_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_py _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/msg/command_data.msg" NAME_WE)
add_dependencies(mage_generate_messages_py _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/environmental_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_py _mage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/daslab-server1/Rakshit/ros/src/mage/srv/navigation_data.srv" NAME_WE)
add_dependencies(mage_generate_messages_py _mage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mage_genpy)
add_dependencies(mage_genpy mage_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mage_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mage
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(mage_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mage
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(mage_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mage
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(mage_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mage
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(mage_generate_messages_py std_msgs_generate_messages_py)
