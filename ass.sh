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

# =============================================================================
# Minimum-usable-core: BEGIN

declare -a PACKAGE_SOURCES_IN_DEVICE=()

# Find package in device (form the specific directories)
find_package_in_device()
{
    declare -n _pkg_dir=$1
    local pkg_name=$2

    _pkg_dir='some where'

    return 0
}

main()
{
    echo ASS IS BEING EXECUTED.
    # Find and check is package avaliable in device.
    local package_dir=''
    find_package_in_device package_dir package_name

    echo package_dir: $package_dir
}
# Minimum-usable-core: END
# =============================================================================


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
# Main execution
if ! [ "$_FLAG_JUST_LOAD" = true ]; then
    main $@
fi
