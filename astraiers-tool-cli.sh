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
# . $_ASS_DIR/helpers/bash-read-write-file-variable/ass-main.sh
. $_ASS_DIR/helpers/load_fhs_variable.sh

__is_func_exists () {
	declare -f -- "$1" >/dev/null 2>&1
}


PACKAGE_SOURCES_DIR=$_ASS_DIR/package-sources

_load_package_source_handler()
{
    local pkg_type=$1
    local pkg_h_path=$_ASS_DIR/package-source-handlers/$pkg_type.sh
    if [[ -x "$pkg_h_path" ]]; then
        return 0 #true
    fi
}

_get_package_with_source_metadata()
{
    local pkg_s=$1 pkg_name=$2
    shift 2

    # Isolating variable enviroment before loading the script file
    (
        . "$pkg_s"
        echo $pkg_s
        echo - type : $type
    )

}

_get_package()
{
    local pkg_s pkg_name=$1
    shift

    #TODO: them tinh nang sort file truoc khi nap
    for pkg_s in "$PACKAGE_SOURCES_DIR"/*; do
        _get_package_with_source_metadata "$pkg_s" "$pkg_name"
    done

}

_get_package $@
