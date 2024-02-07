find_package(timer_sw CONFIG REQUIRED)
find_package(dlt CONFIG REQUIRED)

add_executable(${target_name} application/main.cpp)
target_link_libraries(${target_name} PUBLIC timer_sw::timer_sw dlt::dlt PRIVATE component_c system)

# --- subdirectory

add_subdirectory(component_c)
add_subdirectory(system)

# --- install

include(GNUInstallDirs)
install(TARGETS ${target_name} EXPORT ${target_name})
