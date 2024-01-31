cmake_minimum_required(VERSION 3.15)
project(PackageTest CXX)

find_package(timer_sw CONFIG REQUIRED)

add_executable(timer_sw_package_test source/main.cpp)
target_link_libraries(timer_sw_package_test timer_sw::timer_sw)
