cmake_minimum_required (VERSION 2.8)
project (testkit-stub)

#version number
set (CMakeHelloWorld_VERSION_MAJOR 1)
set (CMakeHelloWorld_VERSION_MINOR 0)

#include the subdirectory containing our libs
add_subdirectory (include)
add_subdirectory (include/json)
add_subdirectory (source)
add_subdirectory (source/json)
add_subdirectory (source/main)
add_subdirectory (source/ut)
include_directories(include)
include_directories(include/json)
include_directories(source)
include_directories(source/json)
include_directories(source/main)
include_directories(source/ut)
#indicate the entry point for the executable
add_executable (testkit-stub testkit-stub main.cpp)

# Indicate which libraries to include during the link process.
target_link_libraries (testkit-stub testkit-stub)
