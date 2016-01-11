include_directories("${PROJECT_BINARY_DIR}/include")

aux_source_directory(. DIR_LIB_SRCS)

add_library(jsons ${DIR_LIB_SRCS})
