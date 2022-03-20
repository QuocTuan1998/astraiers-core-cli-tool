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

_is_func_exist () {
	declare -f -- "$1" >/dev/null 2>&1
}


# Core variables
declare -a LOCAL_PACKAGE_SOURCES_metascript_ref=()
declare -a FETCHING_PACKAGE_SOURCES_metascript_ref=()

find_package_with_metadata()
{
    echo aa
}

# Find package from extend-package source
find_package_extend()
{
    declare -n _pkg_dir=$1
    local pkg_name=$2

    _pkg_dir='some where in device'

    return 0
}

find_package__directory()
{
    declare -n _out=$1
    local pkg_name=$2
    # $path: set from metascript, indent to package-source-directiory

    local pkg_path=$path/$pkg_name
    if [ -d "$pkg_path" ]; then
        _out=$pkg_path
        return 0
    fi
    return 1
}

find_package_local_with_metascript_ref()
{
    declare -n _out=$1
    local pkg_name=$2
    declare -n metascript=$3

    #TODO: Them chuc nang load ref file
    eval "$metascript"

    [ "$type" = dir ] && type=directory #alias

    _out=''
    local handler=find_package__$type
    echo "" #TODO: Remove this line
    if _is_func_exist $handler; then
        local _ret
        if $handler _ret $pkg_name; then
            echo $_ret
            _out=$_ret
            return 0
        fi
    fi
    echo TODO: Could not found $handler #TODO: them chuc nang yeu cau nap ass
    echo haizzz
    return 1
}

# Find package in device
find_package_local()
{
    declare -n _out=$1
    local pkg_name=$2

    _out=''
    local __pkg_dir
    for metascript_ref in ${LOCAL_PACKAGE_SOURCES_metascript_ref[@]}; do
        if find_package_local_with_metascript_ref __pkg_dir $pkg_name $metascript_ref;
        then
            _out=$__pkg_dir
            return 0
        fi
    done
    return 1
}

main()
{
    local package_name=$1
    #TODO: them validate cho input
    echo ASS IS BEING EXECUTED.
    # Find and check is package avaliable in device.
    local package_dir=''
    find_package_local package_dir $package_name

    echo package_dir: $package_dir
}

# Minimum-usable-core: END
# =============================================================================


# =============================================================================
# Attached data: BEGIN

_pkgs_git_thanhntmany="type=git_codeinfile; git_username=~/lab"
LOCAL_PACKAGE_SOURCES_metascript_ref+=( _pkgs_git_thanhntmany )

_pkgs_local_thanhntmany_lab="type=dir; path=~/lab"
LOCAL_PACKAGE_SOURCES_metascript_ref+=( _pkgs_local_thanhntmany_lab )
# Attached data: END
# =============================================================================


# =============================================================================
# Main execution
if ! [ "$_FLAG_JUST_LOAD" = true ]; then
    main $@
fi
