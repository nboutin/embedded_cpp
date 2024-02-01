#!/usr/bin/env bash

# On error, exit immediately
set -e

main() {
	echo -e "# CI/CD Manual"

	./setup.sh
	build_app_template_app_cmake
	build_app_template_app_conan_cmake
	build_lib_template_lib_conan_cmake_timer_sw
	# run_clang_tidy
	title_1 "Execution time"
}

build_app_template_app_cmake() {
	title_1 "Build Application Template CMake"

	cd application/template/app_cmake
	rm -rf build/

	title_2 "ARM GCC"
	cmake --preset arm_gcc
	cmake --build --preset arm_gcc
	cmake --build --preset arm_gcc --target install

	title_2 "Host GCC"
	cmake --preset host_gcc
	cmake --build --preset host_gcc
	cmake --build --preset host_gcc --target install

	title_2 "Host Clang"
	cmake --preset host_clang
	cmake --build --preset host_clang
	cmake --build --preset host_clang --target install

	title_2 "Clang Format"
	cmake --build --preset host_gcc --target clang-format-check

	title_2 "Code Linter"
	cmake --preset code_linter
	cmake --build --preset code_linter

	cd -
}

build_app_template_app_conan_cmake() {
	title_1 "Build Application Template Conan CMake"

	cd application/template/app_conan_cmake
	rm -rf build/

	title_2 "ARM GCC"
	conan build . -pr stm32f

	title_2 "Host GCC"
	conan build . -pr gcc

	title_2 "Host Clang"
	conan build . -pr clang

	title_2 "Clang Format"
	cmake --build --preset conan-minsizerel --target clang-format-check

	cd -
}

build_lib_template_lib_conan_cmake_timer_sw() {
	title_1 "Build Library Template Conan CMake Timer SW"

	cd library/template/lib_conan_cmake/timer_sw
	rm -rf test_package/build/

	title_2 "GCC"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc

	title_2 "GCC MinSizeRel"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

	title_2 "Conan cache list"
	conan list timer_sw/*:*

	cd -
}

run_clang_tidy() {
	title_1 "Run Clang Tidy"

	cd application/template/app_conan_cmake

	# Pre-condition:
	#   - LLVM/bin must be in PATH
	#   - python3 be in path (on windows use: mklink python3.exe python.exe)
	# -p: tells clang-tidy to use the compile commands from the specified build directory
	# tee: output clang-tidy to file and stdout
	run-clang-tidy -p build/MinSizeRel | tee build/MinSizeRel/clang_tidy_output.log

	cd -
}

info() {
	echo -e "$1"
}

title_1() {
	echo -e "\n## $1"
}

title_2() {
	echo -e "\n### $1"
}

error() {
	RED='\033[0;41;30m'
	STD='\033[0;0;39m'
	echo -e "ERROR: ${RED}$1${STD}\n"
	exit 1
}

#--- Main

(
	time main
	echo -e "\n## CI/CD Done\n"
) 2>&1 | tee logs/ci_cd_manual.md # redirect stdout/stderr to a file
