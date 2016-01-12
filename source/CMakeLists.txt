add_subdirectory(json)

add_subdirectory(main)

add_subdirectory(ut)

include_directories("${PROJECT_BINARY_DIR}/include")

aux_source_directory(. DIR_LIB_SRCS)

add_library(testkitstub ${DIR_LIB_SRCS} ${HEADER_FILES})

IF(i386)
    set_target_properties(testkitstub PROPERTIES COMPILE_FLAGS "-m32" LINK_FLAGS "-m32")
ENDIF()
IF(x86_64)
    set_target_properties(testkitstub PROPERTIES COMPILE_FLAGS "-m64" LINK_FLAGS "-m64")
ENDIF()
