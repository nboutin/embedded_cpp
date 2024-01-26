#!/usr/bin/env bash

# On error, exit immediately
set -e

working_dirpath=$1
preset_name=$2

cd "${working_dirpath}"
# rm -rf build/
cmake --preset "${preset_name}"
cmake --build --preset "${preset_name}"
