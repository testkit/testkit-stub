add_subdirectory(json)

add_subdirectory(main)

add_subdirectory(ut)

aux_source_directory(. DIR_LIB_SRCS)

add_library(testkitstub ${DIR_LIB_SRCS} ${HEADER_FILES})
