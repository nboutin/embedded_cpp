# Tool Journal

## LLVM

Homepage: <https://clang.llvm.org/>

Download: <https://github.com/llvm/llvm-project/releases>

### run-clang-tidy

Need to be able to call python3.exe, so on windows it is needed to create a symlink:
<https://stackoverflow.com/questions/40914108/bash-python3-command-not-found-windows-discord-py>

  mklink python3.exe python.exe

## Include What You Use: IWYU

<https://github.com/include-what-you-use/include-what-you-use>

### Build

Download IWYU source code: <https://include-what-you-use.org/downloads/>

  git clone --config core.autocrlf=false <https://github.com/llvm/llvm-project.git>

or download it from github as zip

  cd llvm-project
  mkdir build; cd build
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS=clang -DLLVM_EXTERNAL_PROJECTS=iwyu \
  -DLLVM_EXTERNAL_IWYU_SOURCE_DIR=/d/perso/dev/include-what-you-use ../llvm
  ninja

## pre-commit

* <https://pre-commit.com/>

Install

  pip install --user pre-commit

Create a .pre-commit-config.yaml file

Install hook:

  pre-commit install

For new pre-commit hook, run it on all files:

  pre-commit run --all-files
