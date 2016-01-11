include_directories(${PROJECT_BINARY_DIR}/include)

aux_source_directory(. DIR_LIB_SRCS)

add_executable(testkit-stub main.cpp)

target_link_libraries(testkit-stub testkitstub)
target_link_libraries(testkit-stub jsons)
target_link_libraries(testkit-stub ut)
target_link_libraries (testkit-stub ${CMAKE_THREAD_LIBS_INIT})
