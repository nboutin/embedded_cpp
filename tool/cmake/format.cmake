# * Need LLVM installed and in the path.
# * see git-clang-format help and option:
#   https://github.com/llvm/llvm-project/blob/main/clang/tools/clang-format/git-clang-format
# * https://clang.llvm.org/docs/ClangFormat.html

find_program(CLANG_FORMAT_PROGRAM clang-format)
find_program(GIT_CLANG_FORMAT_PROGRAM git-clang-format)
find_program(GIT_PROGRAM git)
find_package(Python)
# find_program(CMAKE_FORMAT_PROGRAM cmake-format)

if(CLANG_FORMAT_PROGRAM
   AND GIT_CLANG_FORMAT_PROGRAM
   AND Python_FOUND
   AND GIT_PROGRAM)

  set(CLANG_FORMAT_COMMAND ${Python_EXECUTABLE} ${GIT_CLANG_FORMAT_PROGRAM} --binary=${CLANG_FORMAT_PROGRAM})

  # Get Git empty tree hash. Hash of first commit on a new repository.
  execute_process(
    COMMAND ${GIT_PROGRAM} hash-object -t tree /dev/null
    OUTPUT_VARIABLE GIT_EMPTY_TREE_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE)

  add_custom_target(
    clang-format-check
    COMMENT "Return error if files are not formatted correctly."
    COMMAND ${CLANG_FORMAT_COMMAND} --force --commit ${GIT_EMPTY_TREE_HASH} --diff --quiet --extensions=c,h,cpp,hpp
            --style=file
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

  add_custom_target(
    clang-format-fix
    COMMENT "Apply clang-format fixes to all files."
    COMMAND ${CLANG_FORMAT_COMMAND} --force --commit ${GIT_EMPTY_TREE_HASH} --extensions=c,h,cpp,hpp --style=file
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

else()
  message(ERROR "CLANG_FORMAT_PROGRAM: ${CLANG_FORMAT_PROGRAM}")
  message(ERROR "GIT_CLANG_FORMAT_PROGRAM: ${GIT_CLANG_FORMAT_PROGRAM}")
  message(ERROR "Python_FOUND: ${Python_FOUND}")
  message(ERROR "GIT_PROGRAM: ${GIT_PROGRAM}")
endif()
