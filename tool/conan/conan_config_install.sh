#!/bin/bash

# On error, exit immediately
set -e

conan config install settings_user.yml
conan config install -sf profiles -tf profiles .
conan config install -sf ../cmake/toolchain -tf profiles/cmake_toolchain .
