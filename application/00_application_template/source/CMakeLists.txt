add_subdirectory(component_c)

# ---

add_executable(${PROJECT_NAME} main.cpp)

set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".axf")

target_link_libraries(${PROJECT_NAME} PRIVATE component_c)

# --- install

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME})
