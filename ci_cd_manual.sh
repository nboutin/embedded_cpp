#!/bin/bash

# On error, exit immediately
set -e

main(){
  install_conan_config
  build_template_app_cmake
  build_template_app_conan_cmake
  # run_clang_tidy
}

install_conan_config(){
  title_1 "Install Conan config"
  (cd tool/conan && ./conan_config_install.sh)
}

build_template_app_cmake(){
  title_1 "Build Application CMake template"

  cd application/template/app_cmake
  rm -rf build/

  title_2 "ARM GCC"
  cmake --preset arm_gcc
  cmake --build --preset arm_gcc
  cmake --build --preset arm_gcc  --target install

  title_2 "Host GCC"
  cmake --preset host_gcc
  cmake --build --preset host_gcc
  cmake --build --preset host_gcc --target install

  cd -
}

build_template_app_conan_cmake(){
  title_1 "Build Application Conan CMake template"

  cd application/template/app_conan_cmake
  rm -rf build/

  title_2 "Cross compile"
  conan build . -pr stm32f

  cd -
}

run_clang_tidy(){
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

info(){
	echo -e "$1"
}

title_1(){
	echo -e "\n#=== $1"
}

title_2(){
	echo -e "\n#--- $1"
}

error(){
  RED='\033[0;41;30m'
  STD='\033[0;0;39m'
	echo -e "ERROR: ${RED}$1${STD}\n"
	exit 1
}

#--- Main

(
  time main
  printf "\nCI/CD Done\n"
) 2>&1 | tee ci_cd_manual.log # redirect stdout/stderr to a file
