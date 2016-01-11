cmake_minimum_required (VERSION 2.8)
project (testkit-stub)

#version number
set (testkit-stub_VERSION_MAJOR 1)
set (testkit-stub_VERSION_MINOR 0)

#include the subdirectory containing our libs
add_subdirectory (source)
include_directories(include)
include_directories(include/json)
