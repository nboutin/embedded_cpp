#!/usr/bin/env bash

# Script to be run once to setup the project

# On error, exit immediately
set -e

title_1() {
	echo -e "\n## $1"
}

title_2() {
	echo -e "\n### $1"
}

title_1 "Setup project dependencies"

title_2 "Install Python requirements"
pip install --user -U -r requirements.txt

title_2 "Install pre-commit hooks"
pre-commit install -t pre-commit -t pre-push

title_2 "Install Conan config"
(cd tool/conan && ./conan_config_install.sh)
