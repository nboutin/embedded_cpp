cmake_minimum_required(VERSION 3.23)
project(iwyu_sandbox)

# set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE include-what-you-use.exe)
find_program(iwyu_path NAMES include-what-you-use iwyu REQUIRED)
message(STATUS "Found include-what-you-use: ${iwyu_path}")

set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${iwyu_path})
set(CMAKE_C_INCLUDE_WHAT_YOU_USE ${iwyu_path})

add_executable(iwyu_sandbox source/main.cc)

set_property(TARGET iwyu_sandbox PROPERTY CXX_INCLUDE_WHAT_YOU_USE ${iwyu_path})
