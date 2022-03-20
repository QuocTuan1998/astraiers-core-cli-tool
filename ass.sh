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
declare -a FINDING_PACKAGE_SOURCES_metascript_ref=()
declare -a FETCHING_PACKAGE_SOURCES_metascript_ref=()

source_has_package__directory()
{
    local pkg_name=$1
    # $path: set from metascript, indent to package-source-directiory

    local pkg_path=$path/$pkg_name
    if [ -d "$pkg_path" ]; then
        return 0
    fi
    return 1
}

source_has_package()
{
    declare -n source_metascript=$1
    local pkg_name=$2

    #TODO: Them chuc nang load ref file
    type=''
    eval "$source_metascript"

    [ "$type" = dir ] && type=directory #alias

    local handler=source_has_package__$type
    if _is_func_exist $handler; then
        if $handler $pkg_name; then
            return 0
        else
            return 1
        fi
    else
        # echo TODO: Could not found handler for type: $type #TODO: them chuc nang yeu cau nap ass
        # echo haizzz
        return 2
    fi

    return 1
}

# Find package
scan_sources_for_package()
{
    local pkg_name=$1

    for metascript_ref in ${FINDING_PACKAGE_SOURCES_metascript_ref[@]}; do
        if source_has_package $metascript_ref $pkg_name; then
            echo FOUND FOUND FOUND at: $metascript_ref
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
    local package_dir=''
    scan_sources_for_package $package_name

    echo package_dir: $package_dir
}

# Minimum-usable-core: END
# =============================================================================


# =============================================================================
# Attached data: BEGIN
_pkgs_git_thanhntmany_repo="
type=git_repo
git_username=thanhntmany"
FINDING_PACKAGE_SOURCES_metascript_ref+=( _pkgs_git_thanhntmany_repo )

_pkgs_git_thanhntmany_file="
type=git_codeinfile
git_username=thanhntmany
git_repo=ass-single-file-script"
FINDING_PACKAGE_SOURCES_metascript_ref+=( _pkgs_git_thanhntmany_file )

_pkgs_local_thanhntmany_lab="
type=dir;
path=~/lab"
FINDING_PACKAGE_SOURCES_metascript_ref+=( _pkgs_local_thanhntmany_lab )
# Attached data: END
# =============================================================================


# =============================================================================
# Main execution
if ! [ "$_FLAG_JUST_LOAD" = true ]; then
    main $@
fi
