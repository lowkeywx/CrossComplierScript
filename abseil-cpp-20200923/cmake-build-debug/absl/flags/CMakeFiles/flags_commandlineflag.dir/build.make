# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.2\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\DuoBei\ThirdPart\abseil-cpp-20200923

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug

# Include any dependencies generated for this target.
include absl/flags/CMakeFiles/flags_commandlineflag.dir/depend.make

# Include the progress variables for this target.
include absl/flags/CMakeFiles/flags_commandlineflag.dir/progress.make

# Include the compile flags for this target's objects.
include absl/flags/CMakeFiles/flags_commandlineflag.dir/flags.make

absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.obj: absl/flags/CMakeFiles/flags_commandlineflag.dir/flags.make
absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.obj: absl/flags/CMakeFiles/flags_commandlineflag.dir/includes_CXX.rsp
absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.obj: ../absl/flags/commandlineflag.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.obj"
	cd /d C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags && C:\msys64\mingw32\bin\clang++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\flags_commandlineflag.dir\commandlineflag.cc.obj -c C:\DuoBei\ThirdPart\abseil-cpp-20200923\absl\flags\commandlineflag.cc

absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.i"
	cd /d C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags && C:\msys64\mingw32\bin\clang++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\DuoBei\ThirdPart\abseil-cpp-20200923\absl\flags\commandlineflag.cc > CMakeFiles\flags_commandlineflag.dir\commandlineflag.cc.i

absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.s"
	cd /d C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags && C:\msys64\mingw32\bin\clang++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\DuoBei\ThirdPart\abseil-cpp-20200923\absl\flags\commandlineflag.cc -o CMakeFiles\flags_commandlineflag.dir\commandlineflag.cc.s

# Object files for target flags_commandlineflag
flags_commandlineflag_OBJECTS = \
"CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.obj"

# External object files for target flags_commandlineflag
flags_commandlineflag_EXTERNAL_OBJECTS =

absl/flags/libabsl_flags_commandlineflag.a: absl/flags/CMakeFiles/flags_commandlineflag.dir/commandlineflag.cc.obj
absl/flags/libabsl_flags_commandlineflag.a: absl/flags/CMakeFiles/flags_commandlineflag.dir/build.make
absl/flags/libabsl_flags_commandlineflag.a: absl/flags/CMakeFiles/flags_commandlineflag.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libabsl_flags_commandlineflag.a"
	cd /d C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags && $(CMAKE_COMMAND) -P CMakeFiles\flags_commandlineflag.dir\cmake_clean_target.cmake
	cd /d C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\flags_commandlineflag.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
absl/flags/CMakeFiles/flags_commandlineflag.dir/build: absl/flags/libabsl_flags_commandlineflag.a

.PHONY : absl/flags/CMakeFiles/flags_commandlineflag.dir/build

absl/flags/CMakeFiles/flags_commandlineflag.dir/clean:
	cd /d C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags && $(CMAKE_COMMAND) -P CMakeFiles\flags_commandlineflag.dir\cmake_clean.cmake
.PHONY : absl/flags/CMakeFiles/flags_commandlineflag.dir/clean

absl/flags/CMakeFiles/flags_commandlineflag.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\DuoBei\ThirdPart\abseil-cpp-20200923 C:\DuoBei\ThirdPart\abseil-cpp-20200923\absl\flags C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags C:\DuoBei\ThirdPart\abseil-cpp-20200923\cmake-build-debug\absl\flags\CMakeFiles\flags_commandlineflag.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : absl/flags/CMakeFiles/flags_commandlineflag.dir/depend

