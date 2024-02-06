# Include What You Use: IWYU

<https://github.com/include-what-you-use/include-what-you-use>

## Build

Download IWYU source code: <https://include-what-you-use.org/downloads/>

  git clone --config core.autocrlf=false <https://github.com/llvm/llvm-project.git>

or download it from github as zip

  cd llvm-project
  mkdir build; cd build
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS=clang -DLLVM_EXTERNAL_PROJECTS=iwyu \
  -DLLVM_EXTERNAL_IWYU_SOURCE_DIR=/d/perso/dev/include-what-you-use ../llvm
  ninja
