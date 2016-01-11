aux_source_directory(. DIR_LIB_SRCS)

add_executable(testkit-stub main.cpp)

target_link_library(testkit-stub testkitstub)
target_link_library(testkit-stub json)
target_link_library(testkit-stub ut)
