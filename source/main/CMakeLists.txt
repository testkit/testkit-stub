configure_file (
  "${PROJECT_SOURCE_DIR}/include/httpserver.h"
  "${PROJECT_BINARY_DIR}/include/comfun.h"
  "${PROJECT_BINARY_DIR}/include/testcase.h"
)

aux_source_directory(. DIR_LIB_SRCS)

add_executable(testkit-stub main.cpp)

target_link_libraries(testkit-stub testkitstub)
target_link_libraries(testkit-stub json)
target_link_libraries(testkit-stub ut)
