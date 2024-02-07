cmake_minimum_required(VERSION 3.15)
project(dlt LANGUAGES C CXX)

add_library(${PROJECT_NAME} source/dlt_client.c)

target_include_directories(
  ${PROJECT_NAME}
  PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include> $<INSTALL_INTERFACE:include>
  PRIVATE include/${PROJECT_NAME})

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER include/${PROJECT_NAME}/dlt_client.h)

install(TARGETS ${PROJECT_NAME})

# include(GNUInstallDirs)
# install(
#   TARGETS ${PROJECT_NAME}
#   LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#   PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})
