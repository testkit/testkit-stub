cmake_minimum_required (VERSION 2.8)
project (testkit-stub)

#version number
set (testkit-stub_VERSION_MAJOR 1)
set (testkit-stub_VERSION_MINOR 0)

find_package (Threads)

#include the subdirectory containing our libs
add_subdirectory (source)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/httpserver.h"
  "${PROJECT_BINARY_DIR}/include/httpserver.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/comfun.h"
  "${PROJECT_BINARY_DIR}/include/comfun.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/testcase.h"
  "${PROJECT_BINARY_DIR}/include/testcase.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/autolink.h"
  "${PROJECT_BINARY_DIR}/include/json/autolink.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/config.h"
  "${PROJECT_BINARY_DIR}/include/json/config.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/features.h"
  "${PROJECT_BINARY_DIR}/include/json/features.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/forwards.h"
  "${PROJECT_BINARY_DIR}/include/json/forwards.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/json.h"
  "${PROJECT_BINARY_DIR}/include/json/json.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/reader.h"
  "${PROJECT_BINARY_DIR}/include/json/reader.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/value.h"
  "${PROJECT_BINARY_DIR}/include/json/value.h"
)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/json/writer.h"
  "${PROJECT_BINARY_DIR}/include/json/writer.h"
)

include_directories("${PROJECT_BINARY_DIR}/include")
include_directories("${PROJECT_BINARY_DIR}/include/json")
