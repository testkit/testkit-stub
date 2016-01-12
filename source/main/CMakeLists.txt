include_directories(${PROJECT_BINARY_DIR}/include)

aux_source_directory(. DIR_LIB_SRCS)

add_executable(testkit-stub main.cpp)

IF(i386)
    set_target_properties(testkit-stub PROPERTIES COMPILE_FLAGS "-m32" LINK_FLAGS "-m32")
ENDIF()
IF(x86_64)
    set_target_properties(testkit-stub PROPERTIES COMPILE_FLAGS "-m64" LINK_FLAGS "-m64")
ENDIF()
target_link_libraries(testkit-stub testkitstub)
target_link_libraries(testkit-stub jsons)
target_link_libraries(testkit-stub ut)

target_link_libraries(testkit-stub "${CMAKE_THREAD_LIBS_INIT}")
IF(win32)
    target_link_libraries(testkit-stub wsock32 ws2_32)
ENDIF()
