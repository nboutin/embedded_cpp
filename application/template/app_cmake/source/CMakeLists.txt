
add_executable(${target_name}
  application/main.cpp
)
target_link_libraries(${target_name} PRIVATE component_c system)

# --- subdirectory

add_subdirectory(component_c)
add_subdirectory(system)

# --- install

include(GNUInstallDirs)
install(TARGETS ${target_name} EXPORT ${target_name})
