# source: https://gitlab.kitware.com/cmake/cmake/-/issues/18926

# without arguments, clang-tidy will use the default .clang-tidy file
# -fix -fix-errors: fix errors in place when possible
set(CMAKE_CXX_CLANG_TIDY clang-tidy)
