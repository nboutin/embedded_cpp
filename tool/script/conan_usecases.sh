#!/usr/bin/env bash

# How-to
# run: ./tool/script/conan_usecases.sh

# On error, exit immediately
set -e

script_title="Conan Usecases"
log_filename="conan_usecases"

main() {
	echo -e "# ${script_title}"

	lib_timer_sw
	lib_dlt

	title_1 "Conan list"
	conan list "*" -r=local

	title_1 "Execution time"
}

lib_timer_sw() {
	title_1 "Library Timer SW"
	conan_cache_clean_all
	cd library/template/lib_conan_cmake/timer_sw

	title_2 "Conan create"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

	title_2 "Conan upload"
	conan upload timer_sw -r=local

	cd -
}

lib_dlt() {
	title_1 "Library DLT"
	conan_cache_clean_all
	cd library/template/lib_conan_cmake/dlt

	title_2 "Conan create"
	conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

	title_2 "Conan upload"
	conan upload dlt -r=local

	cd -
}

conan_cache_clean_all() {
	title_2 "Clean Conan local cache"
	conan cache clean -vverbose "*"
	conan remove -c "*"
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

#--- Main

(
	time main
) 2>&1 | tee logs/"${log_filename}".md # redirect stdout/stderr to a file
