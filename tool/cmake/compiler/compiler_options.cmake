# https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html

include(${CMAKE_CURRENT_LIST_DIR}/compiler_options/compiler_options_private.cmake)

# Use: add_compile_options("${compiler_options_common_flags}")
set(compiler_options_common_flags
	${warning_options}
	${c_dialect_options}
	${code_generation_options}
	${diagnostic_message_options}
	${developper_options}
)

# Use: add_compile_options("$<$<COMPILE_LANGUAGE:C>:${compiler_options_c_flags}>")
set(compiler_options_c_flags ${warning_options_c})

# Use: add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${compiler_options_cpp_flags}>")
set(compiler_options_cpp_flags ${warning_options_cpp})

# Use: add_link_options("${compiler_options_linker_flags}")
set(compiler_options_linker_flags ${compiler_options_linker})
