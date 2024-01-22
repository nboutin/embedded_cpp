cmake_minimum_required(VERSION 3.23)
project(cmake_compiler_options_sandbox)

set(warning_options_gnu -Wformat-overflow=2 -Wformat-signedness)
set(warning_options "$<$<COMPILE_LANG_AND_ID:CXX,GNU>:${warning_options_gnu}>")
set(compiler_options_common_flags "${warning_options}")
add_compile_options("${compiler_options_common_flags}") # GOOD

# add_compile_options($<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wformat-overflow=2 -Wformat-signedness>) # KO
# add_compile_options($<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wformat-overflow=2;-Wformat-signedness>) # KO
# add_compile_options($<$<COMPILE_LANG_AND_ID:CXX,GNU>:"-Wformat-overflow=2 -Wformat-signedness">) # KO
# add_compile_options($<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wformat-overflow=2 -Wformat-signedness>) # KO

# https://gitlab.kitware.com/cmake/cmake/-/issues/20230
# add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wformat-overflow=2;-Wformat-signedness>") # GOOD
# add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wformat-overflow=2$<SEMICOLON>-Wformat-signedness>") # GOOD


get_directory_property(COMPILE_OPTIONS DIRECTORY ${CMAKE_SOURCE_DIR} COMPILE_OPTIONS)
MESSAGE("COMPILE OPTIONS: ${COMPILE_OPTIONS}")
message(STATUS "CMAKE_CXX_COMPILER_ID: ${CMAKE_CXX_COMPILER_ID}")

add_executable(cmake_compiler_options_sandbox source/main.cpp)
