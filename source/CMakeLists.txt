add_subdirectory(json)

add_subdirectory(main)

add_subdirectory(ut)

aux_source_directory(. DIR_LIB_SRCS)

configure_file (
  "${PROJECT_SOURCE_DIR}/include/httpserver.h"
  "${PROJECT_BINARY_DIR}/include/comfun.h"
  "${PROJECT_BINARY_DIR}/include/testcase.h"
)

include_directories(include)
include_directories(include/json)
add_library(testkitstub ${DIR_LIB_SRCS} ${HEADER_FILES})
