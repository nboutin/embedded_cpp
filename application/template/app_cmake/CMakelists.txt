cmake_minimum_required(VERSION 3.15)

project(application_template
  LANGUAGES CXX C ASM)
set(target_name ${PROJECT_NAME})

# --- import tools and configuration

set(tool_dirpath "../../../tool")
include(${tool_dirpath}/cmake/compiler/compiler_options.cmake)
include(${tool_dirpath}/cmake/cppcheck.cmake)

if (CMAKE_CROSSCOMPILING)
  include(${tool_dirpath}/cmake/toolchain/stm32f4.cmake)
  include(${tool_dirpath}/cmake/compiler/binary_size.cmake)
  include(${tool_dirpath}/cmake/compiler/map_file.cmake)
else()
  include(${tool_dirpath}/cmake/clang_tidy.cmake)
endif()

# ---

add_compile_options(${compiler_options_common_flags})
add_compile_options("$<$<COMPILE_LANGUAGE:C>:${compiler_options_c_flags}>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${compiler_options_cpp_flags}>")
add_link_options(${compiler_options_linker_flags})

if (CMAKE_CROSSCOMPILING)
string(APPEND CMAKE_EXE_LINKER_FLAGS " -T ${CMAKE_CURRENT_SOURCE_DIR}/linker/STM32F411VEHX_FLASH.ld")
endif()

add_subdirectory(source)
