#!/bin/bash

# On error, exit immediately
set -e

script_path="$(realpath "${BASH_SOURCE[0]}")" # Get the full path of the script
current_dir="$(dirname "$script_path")"       # Extract the directory part of the path

conan config install "${current_dir}"/settings_user.yml
conan config install -sf "${current_dir}"/profiles -tf profiles .
conan config install -sf "${current_dir}"/../cmake/toolchain -tf profiles/cmake_toolchain .
