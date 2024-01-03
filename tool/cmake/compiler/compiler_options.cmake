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
)

set(warning_options_c
	-Wbad-function-cast
	-Wmissing-declarations
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

set(compiler_options_common_flags
	${warning_options}

	-Wredundant-decls
	-Wshadow
	-Wstrict-overflow=2
	-Wwrite-strings
	-Wpointer-arith
	-Wcast-qual
	-Wmissing-include-dirs
	-Wcast-align
	-Wswitch-enum
	-Wsign-conversion
	-Wdisabled-optimization
	-Winline
	-Winvalid-pch
	-Wmissing-declarations
	-Wdouble-promotion
	-Wshadow
	-Wtrampolines
	-Wvector-operation-performance
	-Wshift-overflow=2
	-Wnull-dereference
	-Wduplicated-cond
	-Wshift-overflow=2
	-Wnull-dereference
	-Wduplicated-cond
	-Wcast-align=strict
	# Controlling C dialect
	-funsigned-char
	# Code Generation Conventions
	-fshort-enums #-fshort-wchar
	-Walloc-zero
	-Wcast-qual
	-Wduplicated-branches
	-Wduplicated-cond
	-Wpadded
	-Wshadow
	-Wswitch-default # Warn whenever a switch statement does not have a default case
	-Wswitch-enum # Warn whenever a switch statement has an index of enumerated type
	-Wunused-macros # Warn whenever a macro is defined but not used
	-Wwrite-strings # Give string constants the type const char[length] so that copying the address of one into a non-const char * pointer will get a warning
	# Diagnostics
	-fdiagnostics-show-option -fdiagnostics-plain-output -fdiagnostics-color
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
    -Wmissing-declarations
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
