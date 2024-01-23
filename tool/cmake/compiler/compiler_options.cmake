# https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
# https://best.openssf.org/Compiler-Hardening-Guides/Compiler-Options-Hardening-Guide-for-C-and-C++.html

include(${CMAKE_CURRENT_LIST_DIR}/compiler_options/compiler_options_private.cmake)

# Use: add_compile_options("${compiler_options_flags}")
set(compiler_options_flags
	${warning_options}
	${c_dialect_options}
	${code_generation_options}
	${developper_options}
)

# Use: add_link_options("${compiler_options_linker_flags}")
set(compiler_options_linker_flags ${compiler_options_linker})
