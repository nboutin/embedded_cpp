
if (CMAKE_CROSSCOMPILING)
  add_library(system OBJECT
    source/startup_stm32f411xe.S
    source/syscalls.c
    source/system_stub.c
  )
else()
  add_library(system INTERFACE)
endif()

set_source_files_properties(source/syscalls.c PROPERTIES COMPILE_OPTIONS  "-Wno-missing-prototypes;-Wno-missing-declarations")
set_source_files_properties(source/system_stub.c PROPERTIES COMPILE_OPTIONS  "-Wno-missing-prototypes;-Wno-missing-declarations")
