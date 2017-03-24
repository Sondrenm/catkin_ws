# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tugboat_control: 6 messages, 0 services")

set(MSG_I_FLAGS "-Itugboat_control:/home/sondre/catkin_ws/src/tugboat_control/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Itugboat_control:/home/sondre/catkin_ws/src/tugboat_control/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tugboat_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" NAME_WE)
add_custom_target(_tugboat_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tugboat_control" "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" ""
)

get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" NAME_WE)
add_custom_target(_tugboat_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tugboat_control" "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" "tugboat_control/BoatStatus"
)

get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" NAME_WE)
add_custom_target(_tugboat_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tugboat_control" "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" ""
)

get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" NAME_WE)
add_custom_target(_tugboat_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tugboat_control" "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" ""
)

get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" NAME_WE)
add_custom_target(_tugboat_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tugboat_control" "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" ""
)

get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" NAME_WE)
add_custom_target(_tugboat_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tugboat_control" "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
)
_generate_msg_cpp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg"
  "${MSG_I_FLAGS}"
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
)
_generate_msg_cpp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
)
_generate_msg_cpp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
)
_generate_msg_cpp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
)
_generate_msg_cpp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
)

### Generating Services

### Generating Module File
_generate_module_cpp(tugboat_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tugboat_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tugboat_control_generate_messages tugboat_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_cpp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_cpp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_cpp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_cpp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_cpp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_cpp _tugboat_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tugboat_control_gencpp)
add_dependencies(tugboat_control_gencpp tugboat_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tugboat_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
)
_generate_msg_eus(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg"
  "${MSG_I_FLAGS}"
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
)
_generate_msg_eus(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
)
_generate_msg_eus(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
)
_generate_msg_eus(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
)
_generate_msg_eus(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
)

### Generating Services

### Generating Module File
_generate_module_eus(tugboat_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tugboat_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tugboat_control_generate_messages tugboat_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_eus _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_eus _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_eus _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_eus _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_eus _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_eus _tugboat_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tugboat_control_geneus)
add_dependencies(tugboat_control_geneus tugboat_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tugboat_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
)
_generate_msg_lisp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg"
  "${MSG_I_FLAGS}"
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
)
_generate_msg_lisp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
)
_generate_msg_lisp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
)
_generate_msg_lisp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
)
_generate_msg_lisp(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
)

### Generating Services

### Generating Module File
_generate_module_lisp(tugboat_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tugboat_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tugboat_control_generate_messages tugboat_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_lisp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_lisp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_lisp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_lisp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_lisp _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_lisp _tugboat_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tugboat_control_genlisp)
add_dependencies(tugboat_control_genlisp tugboat_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tugboat_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
)
_generate_msg_nodejs(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg"
  "${MSG_I_FLAGS}"
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
)
_generate_msg_nodejs(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
)
_generate_msg_nodejs(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
)
_generate_msg_nodejs(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
)
_generate_msg_nodejs(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
)

### Generating Services

### Generating Module File
_generate_module_nodejs(tugboat_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tugboat_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tugboat_control_generate_messages tugboat_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_nodejs _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_nodejs _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_nodejs _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_nodejs _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_nodejs _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_nodejs _tugboat_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tugboat_control_gennodejs)
add_dependencies(tugboat_control_gennodejs tugboat_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tugboat_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
)
_generate_msg_py(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg"
  "${MSG_I_FLAGS}"
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
)
_generate_msg_py(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
)
_generate_msg_py(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
)
_generate_msg_py(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
)
_generate_msg_py(tugboat_control
  "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
)

### Generating Services

### Generating Module File
_generate_module_py(tugboat_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tugboat_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tugboat_control_generate_messages tugboat_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Thrust.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_py _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatList.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_py _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/TugSetpoints.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_py _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/BoatStatus.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_py _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/Waypoint.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_py _tugboat_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sondre/catkin_ws/src/tugboat_control/msg/PushingForce.msg" NAME_WE)
add_dependencies(tugboat_control_generate_messages_py _tugboat_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tugboat_control_genpy)
add_dependencies(tugboat_control_genpy tugboat_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tugboat_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tugboat_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(tugboat_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(tugboat_control_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET tugboat_control_generate_messages_cpp)
  add_dependencies(tugboat_control_generate_messages_cpp tugboat_control_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tugboat_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(tugboat_control_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(tugboat_control_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET tugboat_control_generate_messages_eus)
  add_dependencies(tugboat_control_generate_messages_eus tugboat_control_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tugboat_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(tugboat_control_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(tugboat_control_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET tugboat_control_generate_messages_lisp)
  add_dependencies(tugboat_control_generate_messages_lisp tugboat_control_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tugboat_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(tugboat_control_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(tugboat_control_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET tugboat_control_generate_messages_nodejs)
  add_dependencies(tugboat_control_generate_messages_nodejs tugboat_control_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tugboat_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(tugboat_control_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(tugboat_control_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET tugboat_control_generate_messages_py)
  add_dependencies(tugboat_control_generate_messages_py tugboat_control_generate_messages_py)
endif()
