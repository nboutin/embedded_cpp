add_subdirectory(component_c)
add_subdirectory(system)

# ---

add_executable(${target_name}
  application/main.cpp
  system/source/startup_stm32f411xe.S
  system/source/syscalls.c
  system/source/system_stub.c
)
target_link_libraries(${target_name} PRIVATE component_c)

set_source_files_properties(system/source/syscalls.c PROPERTIES COMPILE_FLAGS "-Wno-missing-prototypes -Wno-missing-declarations")
set_source_files_properties(system/source/system_stub.c PROPERTIES COMPILE_FLAGS "-Wno-missing-prototypes -Wno-missing-declarations")

# --- install

include(GNUInstallDirs)
install(TARGETS ${target_name} EXPORT ${target_name})
