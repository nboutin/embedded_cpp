# Application Conan CMake Template

See tool/conan/README.md about conan config install user_settings and profiles

## Build with Conan for stm32f target

  conan build . -pr stm32f

## Build with Conan for host target

  conan build . -pr gcc
  conan build . -pr clang
