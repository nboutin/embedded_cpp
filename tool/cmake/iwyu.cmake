# https://www.kitware.com//static-checks-with-cmake-cdash-iwyu-clang-tidy-lwyu-cpplint-and-cppcheck/
# https://include-what-you-use.org/
# https://stackoverflow.com/questions/30951492/how-can-i-use-the-tool-include-what-you-use-together-with-cmake-to-detect-unus

set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE include-what-you-use;-Xiwyu;--verbose=3)
set(CMAKE_C_INCLUDE_WHAT_YOU_USE include-what-you-use;-Xiwyu;--verbose=3)
# set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE include-what-you-use;-Xiwyu;--error=0;-Xiwyu;--verbose=3)
# set(CMAKE_C_INCLUDE_WHAT_YOU_USE include-what-you-use;-Xiwyu;--error=0;-Xiwyu;--verbose=3)
