# https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
# https://best.openssf.org/Compiler-Hardening-Guides/Compiler-Options-Hardening-Guide-for-C-and-C++.html

include(${CMAKE_CURRENT_LIST_DIR}/compiler_options/compiler_options_private.cmake)

# Use: add_compile_options("${compiler_options_flags}")
set(compiler_options_flags
    ${warning_options}
    ${c_dialect_options}
    ${code_generation_options}
    ${developper_options}
    ${optimization_options}
    ${instrumentation_options})

# Use: add_compile_options("${compiler_options_runtime_flags}")
set(compiler_options_runtime_flags ${compiler_options_runtime})

# Use: if (CMAKE_CROSSCOMPILING) add_compile_options("${compiler_options_arm_flags}") endif()
set(compiler_options_arm_flags ${compiler_options_arm})

# Use: add_link_options("${compiler_options_linker_flags}")
set(compiler_options_linker_flags ${compiler_options_linker})

# Use: add_compile_options("${compiler_options_sanitizer_flags}") Do not use for production code, only for testing
set(compiler_options_sanitizer_flags ${compiler_options_sanitizer})
