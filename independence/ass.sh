#!/bin/bash

is_ass_exists() {
    command -v ass >/dev/null 2>&1
}

# Directories that store package
declare -a _ASS_REPOSITORES_DIRS

# [#TODO: debug xong thi xoa di] DEV
ASS_LOCAL_EXTEND_REPOSITORY_DIR=~/lab

# Local extend repository (good for development)
if [ -n "${ASS_LOCAL_EXTEND_REPOSITORY_DIR}" ]; then
    _ASS_REPOSITORES_DIRS+=( $ASS_LOCAL_EXTEND_REPOSITORY_DIR )
fi

# Current user: ~/.ass/local-repository
_ASS_REPOSITORES_DIRS+=( ${ASS_USER_REPOSITORY_DIR:=~/.ass/local-repository} )
if [[ -d "$_ASS_REPOSITORES_DIRS" ]]; then
    mkdir -p "$_ASS_REPOSITORES_DIRS"
fi

# All user: /usr/lib/astraiers-core-cli-tool/local-repository
_ASS_EXECUTER_PATH=$(which ass 2>/dev/null)
if [[ -x "$_ASS_EXECUTER_PATH" ]]; then
    _ASS_DIR=$(dirname $(realpath "$_ASS_EXECUTER_PATH"))
    _ASS_REPOSITORES_DIRS+=( $_ASS_DIR/local-repository )
fi

# Find package from the list of specific directories $_ASS_REPOSITORES_DIRS.
# @param $1 package name
# [#TODO] @param $2 (optinal) specifying version ranges
# Fallback:_find_package_dir_RET = dir path of the found package
_find_package_dir_RET=''
_find_package_dir()
{
    local pkg_name=$1 package_dir
    _find_package_dir_RET=''
    for repo_dir in ${_ASS_REPOSITORES_DIRS[@]}; do
        [[ -d "$repo_dir" ]] || continue
        package_dir=$repo_dir/$pkg_name
        if [[ -d "$package_dir" ]] && [[ -e "$package_dir/ass-main.sh" ]]; then
            _find_package_dir_RET=$package_dir
            return 0 #true
        fi
    done
    return 1 #false
}

_fetch_package_via_ass()
{
    local pkg_name=$1
    echo RUN _fetch_package_via_ass: $pkg_name
    if ! is_ass_exists; then
        _install_ass_core
    fi
    ass --fetch-package $pkg_name
}

_fetch_package_RET=''
_fetch_package()
{
    local pkg_name=$1
    
}

_invoke_package()
{
    local pkg_name=$1 package_dir

    if _find_package_dir $pkg_name; then
        package_dir=$_find_package_dir_RET
        echo Found: $package_dir
    else
        echo NOT FOUND
        _fetch_package $pkg_name
        package_dir=$_fetch_package_via_ass_RET_pkg_dir
    fi

    package_dir="$pkg_name"
    echo $package_dir

}

_invoke_package $@
