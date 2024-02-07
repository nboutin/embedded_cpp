#!/usr/bin/env bash

script_path="$(realpath "${BASH_SOURCE[0]}")" # Get the full path of the script
current_dir="$(dirname "$script_path")"       # Extract the directory part of the path

source "$current_dir"/pretty_printer.sh

conan_create_template_library() {
	header2 "GCC"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc

	header2 "GCC MinSizeRel"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

	header2 "Host Clang"
	conan create . -pr clang

	header2 "ARM GCC"
	conan create . -pr stm32f
}
