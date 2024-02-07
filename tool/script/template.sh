#!/usr/bin/env bash

source helper/pretty_printer.sh

# On error, exit immediately
set -e

script_title="Conan create template library"
log_filename="conan_create_template_library"

main() {
	title "${script_title}"

	header1 "Execution time"
}

conan_create_template_library() {
	header1 "Conan create template library"

	header2 "GCC"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc

	header2 "GCC MinSizeRel"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

	header2 "ARM GCC"
	conan create . -pr stm32f
}

#--- Main

(
	time main
	header1 "${script_title}" "completed"
) 2>&1 | tee logs/"${log_filename}".md # redirect stdout/stderr to a file
