cmake_minimum_required(VERSION 3.15)
project(dlt_package_test CXX)

find_package(dlt CONFIG REQUIRED)

add_executable(${PROJECT_NAME} source/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE dlt::dlt)
