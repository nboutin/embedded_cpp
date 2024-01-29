add_library(component_c STATIC include/component_c/component_c.h source/component_c.c)

target_include_directories(
  component_c
  PUBLIC include
  PRIVATE include/component_c)
