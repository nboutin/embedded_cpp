# Template library Conan with CMake

Links:

- <https://docs.conan.io/2/tutorial/creating_packages/create_your_first_package.html>
- <https://docs.conan.io/2/reference/conanfile/methods.html#reference-conanfile-methods>

## Create Conan package

  conan create .
  conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc
  conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel

## Check Conan local cache

  conan list dlt/*:*
