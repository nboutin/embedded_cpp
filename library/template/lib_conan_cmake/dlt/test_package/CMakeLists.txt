cmake_minimum_required(VERSION 3.15)
project(PackageTest CXX)

find_package(dlt CONFIG REQUIRED)

add_executable(dlt_package_test source/main.cpp)
target_link_libraries(dlt_package_test dlt::dlt)
