#!/bin/bash
# Installing for this tool

set -e

echo -e "\nInstalling Astraitors core cli tool..\n\n"
# Default settings
ASS_GIT_USERNAME=${ASS_GIT_USERNAME:-thanhntmany}
ASS_REPO_NAME=${ASS_REPO:-astraiers-core-cli-tool}
ASS_REMOTE=${ASS_REMOTE:-https://github.com/${ASS_GIT_USERNAME}/${ASS_REPO_NAME}.git}
ASS_BRANCH_NAME=${ASS_BRANCH_NAME:-'prod'}

PREFIX=${PREFIX:-"/usr"}
BINDIR=${BINDIR:-$PREFIX/bin}
LIBEXECDIR=${LIBEXEC:-$PREFIX/libexec}

pushd "$LIBEXECDIR" > /dev/null
rm -Rf $ASS_REPO_NAME &> /dev/null
git clone -b $ASS_BRANCH_NAME $ASS_REMOTE 

cd $ASS_REPO_NAME
ASS_WORKING_DIR=$PWD

echo -e "\nAdd \"ass\" to commandline."
chmod +x astraiers-tool-cli.sh
TMP_ASS_RELATIVE_PATH=$(realpath --relative-to="${BINDIR}" ./astraiers-tool-cli.sh)
cd $BINDIR
ln -sf "$TMP_ASS_RELATIVE_PATH" ass

popd > /dev/null

echo -e "Done.\n"

ass

