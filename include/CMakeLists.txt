add_subdirectory(json)

aux_source_directory(. DIR_LIB_SRCS)

add_library(includes ${DIR_LIB_SRCS})
