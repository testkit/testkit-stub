SET(CMAKE_SYSTEM_NAME Windows)
include(CMakeForceCompiler)
# Prefix detection only works with compiler id "GNU"
CMAKE_FORCE_C_COMPILER(${GNU_HOST}-gcc GNU)
# CMake doesn't automatically look for prefixed 'windres', do it manually:
SET(CMAKE_C_COMPILER ${GNU_HOST}-gcc)
SET(CMAKE_CXX_COMPILER ${GNU_HOST}-g++)
SET(CMAKE_RC_COMPILER ${GNU_HOST}-windres)

SET(CMAKE_FIND_ROOT_PATH  /usr/${GNU_HOST} /home/joey/workspace/testkit-lite/shaofeng/testkit-stub/tools/pthreads-w32/i686-w64-mingw32)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
