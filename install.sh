#!/bin/bash
# Installing for this tool

set -e

echo -e "\nInstalling Astraitors core cli tool..\n\n"
# Default settings
ASS_GIT_USERNAME=${ASS_GIT_USERNAME:-thanhntmany}
ASS_REPO_NAME=${ASS_REPO:-astraiers-core-cli-tool}
ASS_REMOTE=${ASS_REMOTE:-https://github.com/${ASS_GIT_USERNAME}/${ASS_REPO_NAME}.git}
ASS_BRANCH_NAME=${ASS_BRANCH_NAME:-'prod'}

_PREFIX=${PREFIX:-"/usr"}
_BINDIR=${_BINDIR:-${_PREFIX}/bin}
_LIBDIR=${_LIBDIR:-$_PREFIX/lib}

cd "$_LIBDIR"
rm -Rf $ASS_REPO_NAME &> /dev/null
echo git clone -b $ASS_BRANCH_NAME $ASS_REMOTE
git clone -b $ASS_BRANCH_NAME $ASS_REMOTE

cd $ASS_REPO_NAME
ASS_WORKING_DIR=$PWD

echo -e "\nAdd \"ass\" to commandline."
chmod +x astraiers-tool-cli.sh
TMP_ASS_RELATIVE_PATH=$(realpath --relative-to="${_BINDIR}" ./astraiers-tool-cli.sh)
cd $_BINDIR
ln -sf "$TMP_ASS_RELATIVE_PATH" ass

echo -e "Done.\n"

ass

