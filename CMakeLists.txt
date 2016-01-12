cmake_minimum_required (VERSION 2.8)
project (testkit-stub)

#build arch option
option(i386 "i386" OFF)
option(x86_64 "x86_64" OFF)
option(arm "arm" OFF)
option(win32 "win32" OFF)
 
#version number
set (testkit-stub_VERSION_MAJOR 1)
set (testkit-stub_VERSION_MINOR 0)

IF(i386)
   message("---------------------------------------------------------------ARCH=i386----------------------------------------------")
ENDIF()
IF(x86_64)
   message("---------------------------------------------------------------ARCH=x86_64--------------------------------------------")
ENDIF()
IF(arm)
   message("---------------------------------------------------------------ARCH=ARM-----------------------------------------------")
ENDIF()

find_package(Threads REQUIRED)

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
