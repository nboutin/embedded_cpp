#!/usr/bin/env bash

# -e option enables interpretation of backslash escapes

title() {
	echo -e "# $1"
}

header1() {
	echo -e "\n## $1"
}

header2() {
	echo -e "\n### $1"
}

info() {
	echo -e "$1"
}

error() {
	RED='\033[0;41;30m'
	STD='\033[0;0;39m'
	echo -e "ERROR: ${RED}$1${STD}\n"
	exit 1
}
