# https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html

# https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
set(warning_options
	# -fmax-errors=1 # Limits the maximum number of error messages (-Wfatal-errors takes precedence)
	-Werror # Make all warnings into errors
	-Wfatal-errors # Make all errors into fatal errors
	-Wpedantic # Issue all the warnings demanded by strict ISO C and ISO C++
	-pedantic-errors
	-Wall # Enables commonly used warning options
	-Wextra # Enables some extra warning flags that are not enabled by -Wall
	-Wdouble-promotion # Warn if float is implicit promoted to double
	-Wformat=2 # Warn about printf/scanf/strftime/strfmon format string
	-Wformat-overflow=2 # Warn about printf/scanf/strftime/strfmon format string overflow
	-Wformat-nonliteral # Warn about printf/scanf/strftime/strfmon format string that is not a string literal
	-Wformat-security
	-Wformat-signedness
	-Wformat-truncation=2
	-Wnull-dereference # Warn if a null dereference is detected
	-Wuninitialized # Warn if an automatic variable is used without first being initialized
	-Winit-self # Warn about uninitialized variables initialized with themselves
	-Wmissing-include-dirs # Warn if a user-supplied include directory does not exist
	-Wparentheses # Warn if parentheses are omitted in certain contexts
	-Wreturn-type # Warn if a function returns a value whose type is incompatible with the function's declared return type
	-Wfloat-equal # Warn if floating-point values are used in equality comparisons
	-Wconversion # Warn for implicit conversions that may alter a value
	-Wlogical-op # Warn about logical operations being used where bitwise were probably wanted
	-Wundef # Warn if an undefined identifier is evaluated in an #if directive
	-Wredundant-decls # Warn if anything is declared more than once in the same scope
	-Wshadow # Warn whenever a local variable shadows another local variable
	-Wstrict-overflow=4 # Warn about cases where the compiler optimizes based on the assumption that signed overflow does not occur
	-Wwrite-strings # Give string constants the type const char[length]
	-Wpointer-arith # Warn about anything that depends on the "size of" a function type or of void
	-Wcast-qual # Warn whenever a pointer is cast so as to remove a type qualifier from the target type
	-Wcast-align=strict # Warn whenever a pointer is cast such that the required alignment of the target is increased
	-Wswitch-enum # Warn whenever a switch statement has an index of enumerated type
	-Wsign-conversion # Warn for implicit conversions that may change the sign of an integer value
	-Wdisabled-optimization # Warn if a requested optimization pass is disabled
	-Winline # Warn if a function can not be inlined
	-Winvalid-pch # Warn if a precompiled header (pch) file is found in the search path but can't be used
	-Wmissing-declarations # Warn if a global function is defined without a previous declaration
	-Wtrampolines # Warn if trampolines are required to make calls to nested functions work
	-Wvector-operation-performance # Warn about inefficient use of vector operations
	-Wshift-overflow=2 # Warn about left shift overflow
	-Wduplicated-cond # Warn if a if/else chain has duplicated conditions
	-Walloc-zero # Warn if malloc(0) is called
	-Wduplicated-branches # Warn if a if/else chain has duplicated branches
	-Wpadded # Warn if padding is included in a structure
	-Wswitch-default # Warn whenever a switch statement does not have a default case
	-Wunused-macros # Warn whenever a macro is defined but not used
)

set(warning_options_c
	-Wbad-function-cast
	-Wmissing-parameter-type
	# -Wdeclaration-missing-parameter-type
	-Wmissing-prototypes
	# -Wmissing-variable-declarations
	-Wnested-externs
	-Wold-style-declaration
	-Wold-style-definition
	-Wstrict-prototypes # Warn if a function is declared or defined without specifying the argument types
	# -Wtraditional
	-Wtraditional-conversion
	# -Wdeclaration-after-statement
	-Wpointer-sign
)

set(warning_options_cpp
	# -Wnrvo # Warn if return value optimization is not performed
	# -Wreturn-mismatch # Warn if a function returns a value whose type is incompatible with the function's declared return type
)

set(c_dialect_options
	-funsigned-char # Let the type char be unsigned, like unsigned char
)

set(code_generation_options
	-fshort-enums # Allocate to an enum type only as many bytes as it needs for the declared range of possible values
	-fno-common # In C code, controls the placement of uninitialized global variables
)

set(diagnostic_message_options
	-fdiagnostics-show-option
	-fdiagnostics-plain-output
	-fdiagnostics-color
)

set(developper_options
	-fstack-usage
	-Wstack-usage=256
)

set(compiler_options_common_flags
	${warning_options}
	${c_dialect_options}
	${code_generation_options}
	${diagnostic_message_options}
	${developper_options}
)

set(compiler_options_c_flags
	${warning_options_c}
	-Wmissing-prototypes
)

set(compiler_options_cpp_flags
	${warning_options_cpp}
	-Wold-style-cast
	-Wnon-virtual-dtor
	-Wctor-dtor-privacy
	-Woverloaded-virtual
	-Wnoexcept
	-Wstrict-null-sentinel
	-Wuseless-cast
	-Wzero-as-null-pointer-constant
	-Wextra-semi
	# Disabled Warnings
	# -Wno-c++98-compat
	# -Wno-c++98-compat-pedantic
	# -Wno-exit-time-destructors # causes warnings if you use static values
	# -Wno-global-constructors # causes warnings if you use static values
	# -Wno-covered-switch-default
)

set(compiler_options_linker_flags
	-ffunction-sections # Place each function in its own section (ELF Only)
	-fdata-sections # Place each data in its own section (ELF Only)
	-Wl,--gc-sections # Dead code elimination
	-fdevirtualize # Attempt to convert calls to virtual functions to direct calls
	-Wl,--fatal-warnings
	-Wl,--no-warn-rwx-segments # Disable error: has a LOAD segment with RWX permissions
)
