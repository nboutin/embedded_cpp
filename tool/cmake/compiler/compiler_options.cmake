# https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html

set(compiler_options_common_flags
    # Base
    -Wall -Wextra -Wpedantic -Werror -Wfatal-errors
    # Diagnostics
    -fdiagnostics-show-option -fdiagnostics-plain-output -fdiagnostics-color
    # Warning
    -Wfloat-equal
	-Wconversion
	-Wlogical-op
	-Wundef
    -Wunused
	-Wredundant-decls
	-Wshadow
	-Wstrict-overflow=2
	-Wwrite-strings
	-Wpointer-arith
	-Wcast-qual
	-Wformat=2
	-Wformat-truncation
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
    -fshort-enums -fshort-wchar
)

set(compiler_options_c_flags
    -Wmissing-prototypes
)

set(compiler_options_cpp_flags
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
	-fdevirtualize # Attempt to convert calls to virtual functions to direct calls
)
