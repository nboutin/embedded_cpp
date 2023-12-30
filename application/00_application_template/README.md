# Application template

## Generate, Build, Install with CMake

    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel
    cmake --build build
    cmake --install build --prefix ../../.local


## Generate with toolchain

    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel --toolchain armclang.cmake
