#!/bin/bash

# On error, exit immediately
set -e

main(){
  build_application_template
}

build_application_template(){
  title_1 "Build application_template"

  cd application/00_application_template
  rm -rf build/

  title_2 "Cross compile"
  cmake --preset cross_compile
  cmake --build --preset cross_compile
  cmake --build --preset cross_compile --target install

  title_2 "Host compile"
  cmake --preset host_compile
  cmake --build --preset host_compile
  cmake --build --preset host_compile --target install

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
