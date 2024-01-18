# https://github.com/danmar/cppcheck
# https://stackoverflow.com/questions/48625499/cppcheck-support-in-cmake

find_program(cppcheck_filepath NAMES cppcheck REQUIRED)

set(cppcheck_options --check-level=exhaustive --enable=all --force --suppressions-list=${CMAKE_SOURCE_DIR}/cppcheck_suppress.txt
--error-exitcode=1 --checkers-report=cppcheck_report.log)

set(CMAKE_C_CPPCHECK ${cppcheck_filepath};${cppcheck_options})
set(CMAKE_CXX_CPPCHECK ${cppcheck_filepath};${cppcheck_options})
