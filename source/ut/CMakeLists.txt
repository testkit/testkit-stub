include_directories("${PROJECT_BINARY_DIR}/include")

aux_source_directory(. DIR_LIB_SRCS)

add_library(ut ${DIR_LIB_SRCS})

IF(i386)
    set_target_properties(ut PROPERTIES COMPILE_FLAGS "-m32" LINK_FLAGS "-m32")
ENDIF()
IF(x86_64)
    set_target_properties(ut PROPERTIES COMPILE_FLAGS "-m64" LINK_FLAGS "-m64")
ENDIF()
