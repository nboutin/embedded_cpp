#!/usr/bin/env bash

# Script to be run once to setup the project

# On error, exit immediately
set -e

pip install --user -U -r requirements.txt
pre-commit install -t pre-commit -t pre-push
(cd tool/conan && ./conan_config_install.sh)
