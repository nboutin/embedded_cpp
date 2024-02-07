#!/usr/bin/env bash

# On error, exit immediately
set -e

source tool/script/helper/pretty_printer.sh

script_title="CI/CD Manual"
log_filename="ci_cd_manual"

main() {
	title "${script_title}"

	./setup.sh
	conan_cache_clean_all
	# build_arm_gcc
	build_lib_template_lib_conan_cmake_dlt
	build_lib_template_lib_conan_cmake_timer_sw
	build_app_template_app_cmake
	build_app_template_app_conan_cmake

	# run_clang_tidy
	header1 "Execution time"
}

build_arm_gcc() {
	header1 "Build ARM GCC"

	header2 "DLT"
	cd library/template/lib_conan_cmake/dlt
	rm -rf test_package/build/
	conan create . -pr stm32f
	cd -

	header2 "Timer SW"
	cd library/template/lib_conan_cmake/timer_sw
	rm -rf test_package/build/
	conan create . -pr stm32f
	cd -

}

build_lib_template_lib_conan_cmake_dlt() {
	header1 "Build Library Template Conan CMake DLT"

	cd library/template/lib_conan_cmake/dlt
	rm -rf test_package/build/

	conan_create_template_library "dlt"

	cd -
}

build_lib_template_lib_conan_cmake_timer_sw() {
	header1 "Build Library Template Conan CMake Timer SW"

	cd library/template/lib_conan_cmake/timer_sw
	rm -rf test_package/build/

	conan_create_template_library "timer_sw"

	cd -
}

build_app_template_app_cmake() {
	header1 "Build Application Template CMake"

	cd application/template/app_cmake
	rm -rf build/

	header2 "ARM GCC"
	cmake --preset arm_gcc
	cmake --build --preset arm_gcc
	cmake --build --preset arm_gcc --target install

	header2 "Host GCC"
	cmake --preset host_gcc
	cmake --build --preset host_gcc
	cmake --build --preset host_gcc --target install

	header2 "Host Clang"
	cmake --preset host_clang
	cmake --build --preset host_clang
	cmake --build --preset host_clang --target install

	header2 "Clang Format"
	cmake --build --preset host_gcc --target clang-format-check

	header2 "Code Linter"
	cmake --preset code_linter
	cmake --build --preset code_linter

	cd -
}

build_app_template_app_conan_cmake() {
	header1 "Build Application Template Conan CMake"

	cd application/template/app_conan_cmake
	rm -rf build/

	header2 "Host GCC"
	conan build . -pr gcc

	header2 "Host Clang"
	conan build . -pr clang

	# header2 "ARM GCC"
	# conan build . -pr stm32f

	header2 "Clang Format"
	cmake --build --preset conan-release --target clang-format-check

	cd -
}

run_clang_tidy() {
	header1 "Run Clang Tidy"

	cd application/template/app_conan_cmake

	# Pre-condition:
	#   - LLVM/bin must be in PATH
	#   - python3 be in path (on windows use: mklink python3.exe python.exe)
	# -p: tells clang-tidy to use the compile commands from the specified build directory
	# tee: output clang-tidy to file and stdout
	run-clang-tidy -p build/MinSizeRel | tee build/MinSizeRel/clang_tidy_output.log

	cd -
}

conan_cache_clean_all() {
	header2 "Clean Conan local cache"
	conan cache clean "*" --source --build --temp --download
	conan remove -c "*"
}

conan_create_template_library() {
	header2 "GCC"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc

	header2 "GCC MinSizeRel"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

	header2 "Host Clang"
	conan create . -pr clang

	# header2 "ARM GCC"
	# conan create . -pr stm32f

	header2 "Conan cache list"
	conan list "$1"/*:*
}

#--- Main

(
	time main
	header1 "${script_title}" "completed"
) 2>&1 | tee logs/"${log_filename}".md # redirect stdout/stderr to a file
