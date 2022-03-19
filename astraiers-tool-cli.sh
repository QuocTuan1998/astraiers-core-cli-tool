#!/bin/bash

_ASS_EXECUTER_PATH=$(which ass 2>/dev/null)
if [[ -x "$_ASS_EXECUTER_PATH" ]]; then
    _ASS_DIR=$(dirname $(realpath "$_ASS_EXECUTER_PATH"))
fi
# For development
if [[ -x "./astraiers-tool-cli.sh" ]]; then
    _ASS_EXECUTER_PATH=./astraiers-tool-cli.sh
    _ASS_DIR=./
fi

# Load helpers
. $_ASS_DIR/helpers/bash-read-write-file-variable/ass-main.sh
. $_ASS_DIR/helpers/load_fhs_variable.sh

echo _ASS_EXECUTER_PATH : $_ASS_EXECUTER_PATH
echo _ASS_DIR : $_ASS_DIR


echo FILE_SYSTEM_LAYOUT : $FILE_SYSTEM_LAYOUT

# for _comp_file in "$_comp_compat_dir"/*; do
#     [[ ${_comp_file##*/} != @($_backup_glob|Makefile*|$_comp_init_blacklist_glob) &&
#         -f $_comp_file && -r $_comp_file ]] && . "$_comp_file"
# done
