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
include tugboat_control/CMakeFiles/tugboat_control.dir/depend.make

# Include the progress variables for this target.
include tugboat_control/CMakeFiles/tugboat_control.dir/progress.make

# Include the compile flags for this target's objects.
include tugboat_control/CMakeFiles/tugboat_control.dir/flags.make

tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o: tugboat_control/CMakeFiles/tugboat_control.dir/flags.make
tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o: /home/sondre/catkin_ws/src/tugboat_control/src/logger.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sondre/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o"
	cd /home/sondre/catkin_ws/build/tugboat_control && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tugboat_control.dir/src/logger.cpp.o -c /home/sondre/catkin_ws/src/tugboat_control/src/logger.cpp

tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tugboat_control.dir/src/logger.cpp.i"
	cd /home/sondre/catkin_ws/build/tugboat_control && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sondre/catkin_ws/src/tugboat_control/src/logger.cpp > CMakeFiles/tugboat_control.dir/src/logger.cpp.i

tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tugboat_control.dir/src/logger.cpp.s"
	cd /home/sondre/catkin_ws/build/tugboat_control && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sondre/catkin_ws/src/tugboat_control/src/logger.cpp -o CMakeFiles/tugboat_control.dir/src/logger.cpp.s

tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.requires:

.PHONY : tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.requires

tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.provides: tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.requires
	$(MAKE) -f tugboat_control/CMakeFiles/tugboat_control.dir/build.make tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.provides.build
.PHONY : tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.provides

tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.provides.build: tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o


# Object files for target tugboat_control
tugboat_control_OBJECTS = \
"CMakeFiles/tugboat_control.dir/src/logger.cpp.o"

# External object files for target tugboat_control
tugboat_control_EXTERNAL_OBJECTS =

/home/sondre/catkin_ws/devel/lib/libtugboat_control.so: tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o
/home/sondre/catkin_ws/devel/lib/libtugboat_control.so: tugboat_control/CMakeFiles/tugboat_control.dir/build.make
/home/sondre/catkin_ws/devel/lib/libtugboat_control.so: tugboat_control/CMakeFiles/tugboat_control.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sondre/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/sondre/catkin_ws/devel/lib/libtugboat_control.so"
	cd /home/sondre/catkin_ws/build/tugboat_control && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tugboat_control.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tugboat_control/CMakeFiles/tugboat_control.dir/build: /home/sondre/catkin_ws/devel/lib/libtugboat_control.so

.PHONY : tugboat_control/CMakeFiles/tugboat_control.dir/build

tugboat_control/CMakeFiles/tugboat_control.dir/requires: tugboat_control/CMakeFiles/tugboat_control.dir/src/logger.cpp.o.requires

.PHONY : tugboat_control/CMakeFiles/tugboat_control.dir/requires

tugboat_control/CMakeFiles/tugboat_control.dir/clean:
	cd /home/sondre/catkin_ws/build/tugboat_control && $(CMAKE_COMMAND) -P CMakeFiles/tugboat_control.dir/cmake_clean.cmake
.PHONY : tugboat_control/CMakeFiles/tugboat_control.dir/clean

tugboat_control/CMakeFiles/tugboat_control.dir/depend:
	cd /home/sondre/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sondre/catkin_ws/src /home/sondre/catkin_ws/src/tugboat_control /home/sondre/catkin_ws/build /home/sondre/catkin_ws/build/tugboat_control /home/sondre/catkin_ws/build/tugboat_control/CMakeFiles/tugboat_control.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tugboat_control/CMakeFiles/tugboat_control.dir/depend
