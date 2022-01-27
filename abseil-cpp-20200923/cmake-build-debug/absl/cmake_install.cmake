# Install script for directory: C:/DuoBei/ThirdPart/abseil-cpp-20200923/absl

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/absl")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/base/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/algorithm/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/container/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/debugging/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/flags/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/functional/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/hash/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/memory/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/meta/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/numeric/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/random/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/status/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/strings/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/synchronization/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/time/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/types/cmake_install.cmake")
  include("C:/DuoBei/ThirdPart/abseil-cpp-20200923/cmake-build-debug/absl/utility/cmake_install.cmake")

endif()

