# Template library Conan with CMake

Links:

- <https://docs.conan.io/2/tutorial/creating_packages/create_your_first_package.html>

## Create Conan package skeleton

  conan new cmake_lib -d name=hello -d version=1.0

## Create Conan package

  conan create .
  conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc
  conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

## Check Conan local cache

  conan list timer_sw
  conan list timer_sw/0.1.0#:*
  conan list timer_sw/*:*
