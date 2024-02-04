# Application template

winlibs:

* winlibs-x86_64-mcf-seh-gcc-13.2.0-mingw-w64ucrt-11.0.1-r2

## With CMake presets

    cmake --preset cross_compile
    cmake --build --preset cross_compile
    cmake --build --preset cross_compile --target install

    cmake --preset host_compile
    cmake --build --preset host_compile
    cmake --build --preset host_compile --target install

## Generate, Build, Install with CMake

    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel
    cmake --build build
    cmake --install build --prefix ../../.local

## Generate with toolchain

    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel --toolchain armclang.cmake

## Print compilation command line

    cmake --build build --verbose
