#!/bin/bash

# Khẩu huyết tâm pháp xây dựng hệ thống:
# Cái app main phụ thuộc cái tool độc lập
# Cái độc lập thì phải độc lập luôn.

# Để có thể hoạt động độc lập thì cái củ lìn này phải lưu thêm 1 lượng tối
# tối thiểu vừa đủ dùng.
# Nhức cái đầu.
# Anh em nào muốn tìm hiểu thêm thì liên hệ Thanhntmany (0344087349)
# mình đàm đạo hen

# This is the portable version (the minimum-usable-core) of Astraiers-core-tool.
# You can run this executer independently at anywhere.
#
# The best way is run with the dynamic command below:
#     bash -c "$(wget https://raw.githubusercontent.com/thanhntmany/astraiers-core-cli-tool/prod/ass.sh -O -)" the-magic param1 param 2
#
# Or shorter with this executer file after clone it into your device:
#     bash ./ass.sh the-magic param1 param 2
#

_FLAG_JUST_LOAD=false
if [ "$1" =  "--just-load" ]; then
    _FLAG_JUST_LOAD=true
    shift
fi

# Init
# List package source metadata to find the specific package
declare -a _ASS_PACKAGE_SOURCE_ATTACHED_REFs
declare -a _ASS_PACKAGE_SOURCE_Ds

# =============================================================================
# Attached data: BEGIN
_pkgs_git_thanhntmany="type=git-codeinfile; git_username=~/lab"

# Regist to attadhed source list
_ASS_PACKAGE_SOURCE_ATTACHED_REFs+=( _pkgs_git_thanhntmany )
# Attached data: END
# =============================================================================


# =============================================================================
# DRAFT: BEGIN
_ASS_EXECUTER_PATH=$(which ass 2>/dev/null)
if [[ -x "$_ASS_EXECUTER_PATH" ]]; then
    _ASS_DIR=$(dirname $(realpath "$_ASS_EXECUTER_PATH"))
fi
# For development
if [[ -x "./astraiers-tool-cli.sh" ]]; then
    _ASS_EXECUTER_PATH=./astraiers-tool-cli.sh
    _ASS_DIR=.
fi

__is_func_exists () {
	declare -f -- "$1" >/dev/null 2>&1
}

_ASS_PACKAGE_SOURCE_Ds=$_ASS_DIR/package-sources
# DRAFT: END
# =============================================================================


# =============================================================================
# Minimum-usable-core

# Find package in device (form the specific directories)
find_package_local_dir()
{
    declare -n _out=$1
    local pkg_name=$2
    local dir=$3
    shift 3

}

find_package_local()
{
    declare -n _out=$1
    local pkg_name=$2
    shift 2
    echo ----
}

find_package_from_source()
{
    declare -n _out=$1
    local pkg_name=$2
    declare -n source=$3
    shift 3

    source[type]

}


find_package()
{
    declare -n _out=$1
    local pkg_name=$2

}

# If not found in device, try to fetch it from list repositories.

# =============================================================================
# Main execution
main()
{
    echo okokokokok
}

if ! [ $_FLAG_JUST_LOAD = true ]; then
    main $@
fi
