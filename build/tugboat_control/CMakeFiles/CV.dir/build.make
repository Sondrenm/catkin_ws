# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sondre/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sondre/catkin_ws/build

# Include any dependencies generated for this target.
include tugboat_control/CMakeFiles/CV.dir/depend.make

# Include the progress variables for this target.
include tugboat_control/CMakeFiles/CV.dir/progress.make

# Include the compile flags for this target's objects.
include tugboat_control/CMakeFiles/CV.dir/flags.make

tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o: tugboat_control/CMakeFiles/CV.dir/flags.make
tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o: /home/sondre/catkin_ws/src/tugboat_control/src/CV.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sondre/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o"
	cd /home/sondre/catkin_ws/build/tugboat_control && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/CV.dir/src/CV.cpp.o -c /home/sondre/catkin_ws/src/tugboat_control/src/CV.cpp

tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CV.dir/src/CV.cpp.i"
	cd /home/sondre/catkin_ws/build/tugboat_control && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sondre/catkin_ws/src/tugboat_control/src/CV.cpp > CMakeFiles/CV.dir/src/CV.cpp.i

tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CV.dir/src/CV.cpp.s"
	cd /home/sondre/catkin_ws/build/tugboat_control && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sondre/catkin_ws/src/tugboat_control/src/CV.cpp -o CMakeFiles/CV.dir/src/CV.cpp.s

tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.requires:

.PHONY : tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.requires

tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.provides: tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.requires
	$(MAKE) -f tugboat_control/CMakeFiles/CV.dir/build.make tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.provides.build
.PHONY : tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.provides

tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.provides.build: tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o


# Object files for target CV
CV_OBJECTS = \
"CMakeFiles/CV.dir/src/CV.cpp.o"

# External object files for target CV
CV_EXTERNAL_OBJECTS =

/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: tugboat_control/CMakeFiles/CV.dir/build.make
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libroscpp.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/librosconsole.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/librostime.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libcpp_common.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_stitching3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_superres3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_videostab3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_aruco3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_bgsegm3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_bioinspired3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_ccalib3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_cvv3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_datasets3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_dpm3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_face3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_fuzzy3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_hdf3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_line_descriptor3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_optflow3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_plot3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_reg3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_saliency3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_stereo3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_structured_light3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_surface_matching3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_text3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_xfeatures2d3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_ximgproc3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_xobjdetect3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_xphoto3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_shape3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_video3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_viz3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_phase_unwrapping3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_rgbd3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_calib3d3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_features2d3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_flann3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_objdetect3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_ml3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_highgui3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_photo3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_videoio3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_imgcodecs3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_imgproc3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: /opt/ros/kinetic/lib/libopencv_core3.so.3.2.0
/home/sondre/catkin_ws/devel/lib/tugboat_control/CV: tugboat_control/CMakeFiles/CV.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sondre/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/sondre/catkin_ws/devel/lib/tugboat_control/CV"
	cd /home/sondre/catkin_ws/build/tugboat_control && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CV.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tugboat_control/CMakeFiles/CV.dir/build: /home/sondre/catkin_ws/devel/lib/tugboat_control/CV

.PHONY : tugboat_control/CMakeFiles/CV.dir/build

tugboat_control/CMakeFiles/CV.dir/requires: tugboat_control/CMakeFiles/CV.dir/src/CV.cpp.o.requires

.PHONY : tugboat_control/CMakeFiles/CV.dir/requires

tugboat_control/CMakeFiles/CV.dir/clean:
	cd /home/sondre/catkin_ws/build/tugboat_control && $(CMAKE_COMMAND) -P CMakeFiles/CV.dir/cmake_clean.cmake
.PHONY : tugboat_control/CMakeFiles/CV.dir/clean

tugboat_control/CMakeFiles/CV.dir/depend:
	cd /home/sondre/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sondre/catkin_ws/src /home/sondre/catkin_ws/src/tugboat_control /home/sondre/catkin_ws/build /home/sondre/catkin_ws/build/tugboat_control /home/sondre/catkin_ws/build/tugboat_control/CMakeFiles/CV.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tugboat_control/CMakeFiles/CV.dir/depend

