#!/bin/bash

_ASS_EXECUTER_PATH=$(which ass 2>/dev/null)
if [[ -x "$_ASS_EXECUTER_PATH" ]]; then
    _ASS_DIR=$(dirname $(realpath "$_ASS_EXECUTER_PATH"))
fi
# For development
if [[ -x "./astraiers-tool-cli.sh" ]]; then
    _ASS_EXECUTER_PATH=./astraiers-tool-cli.sh
    _ASS_DIR=.
fi

# Load helpers
. $_ASS_DIR/helpers/bash-read-write-file-variable/ass-main.sh
. $_ASS_DIR/helpers/load_fhs_variable.sh

PACKAGE_SOURCES_DIR=$_ASS_DIR/package-sources

_find_package_from_package_source_file()
{
    local pkg_name=$1
}

_find_package()
{
    local pkg_name=$1
    shift
    for pkg_s in "$PACKAGE_SOURCES_DIR"/*; do
        echo $pkg_s
        # . "$pkg_s"
    done
}

_find_package $@
