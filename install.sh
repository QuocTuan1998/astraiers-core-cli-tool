#!/bin/bash
# Installing for this tool

set -e

echo -e "\nInstalling Astraitors core cli tool..\n\n"
# Default settings
ASS_GIT_USERNAME=${ASS_GIT_USERNAME:-thanhntmany}
ASS_REPO_NAME=${ASS_REPO:-astraiers-core-cli-tool}
ASS_REMOTE=${ASS_REMOTE:-https://github.com/${ASS_GIT_USERNAME}/${ASS_REPO_NAME}.git}

PREFIX=${PREFIX:-"/usr"}
BINDIR=${BINDIR:-$PREFIX/bin}
LIBEXECDIR=${LIBEXEC:-$PREFIX/libexec}

pushd "$LIBEXECDIR" > /dev/null
rm -Rf $ASS_REPO_NAME &> /dev/null
git clone $ASS_REMOTE 
cd $ASS_REPO_NAME

echo -e "\nAdd \"ass\" to commandline."
chmod +x astraiers-tool-cli.sh
ln -f astraiers-tool-cli.sh ass


popd > /dev/null

#echo $PREFIX
#echo $BINDIR
#echo $LIBEXECDIR




