#!/usr/bin/env sh

#
# Type 1: run with code
# ass the-magic abc def
#

#
## Workflow diagram
#
# sh -c "$(wget https://c.ass.io -O -)" ass the-magic abc def
#                        ||
#                 [ass_init.sh]
#
# [ass - main.sh]
# RUN: ass the-magic abc def
#  |  Find the-magic in device (list default dir)
#  |   |
#  |   v
#  |   + Not found -> Fetch the-magic from ass repository
#  |   |               |
#  |   |               v
#  |   |              Store to specific space (adcoding to type of run)
#  |   |               |
#  |   |              RUN: Pakage - init.sh
#  |   |               |
#  |   |<--------------+
#  |   |
#  |   v
#  |  RUM: the-magic abc def
#

#
# ass anything<tab>
# --> list suggestion
#

#
# This script installs the Astraitors-core-cli into your device.
#
# This script should be run via wget:
#   sh -c "$(wget https://raw.githubusercontent.com/thanhntmany/astraiers-core-cli-tool/prod/install.sh -O -)"'
#
# As an alternative, you can first download the install script and run it afterwards:
#   wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
#   sh install.sh
#
# (Just for dervelopment) Clone this repository through ssh link and run install.sh afterwards
#   git clone git@github.com:thanhntmany/astraiers-core-cli-tool.git
#   cd astraiers-core-cli-tool
#   sh install.sh
#
## 1. Place program's directory to ASS_DIR
## 2. Add "ass" command into system BINDIR
## 3. Add bash command line completion for ass
## 3.1 (Optional) Add zsh command line completion for ass


# Chose shell mode
set -e


# Greeting
echo "\nInstalling Astraitors-core-cli."
echo "~> ass Do-the-badass-thing\n\n"



# Initial variables
## Execution environment definition

# Define Source code
## If working directory is 


# File system layout definition 
FILE_SYSTEM_LAYOUT=unix-like
[[ "${TERMUX_PREFIX:=$PREFIX}" =~ com.termux ]] && FILE_SYSTEM_LAYOUT=termux

## Choose the destination folders for the installation files
case "$FILE_SYSTEM_LAYOUT" in
    *)
      # Initial default values
      _DEST_PREFIX=/usr
      _DEST_BINDIR=${_DEST_PREFIX}/bin
      _DEST_LIBDIR=${_DEST_PREFIX}/lib

      # Bash compat-completion-directory definition
      # Ref: https://raw.githubusercontent.com/scop/bash-completion/2.8/doc/bash_completion.txt
      _comp_compat_dir=${BASH_COMPLETION_COMPAT_DIR:-/etc/bash_completion.d}
      ;;&
    termux)
      # As Termux uses it own file system layout, we must use a specific one for it.
      # Ref: https://github.com/termux/termux-packages/wiki/Termux-file-system-layout
      _DEST_PREFIX=${TERMUX_PREFIX:=$PREFIX}
      _DEST_BINDIR=${_DEST_PREFIX}/bin
      _DEST_LIBDIR=${_DEST_PREFIX}/lib

      _comp_compat_dir=${BASH_COMPLETION_COMPAT_DIR:-${_DEST_PREFIX}/etc/bash_completion.d}
    ;;
esac


## Place program's directory to ASS_DIR

## Default settings
ASS_GIT_USERNAME=${ASS_GIT_USERNAME:-thanhntmany}
ASS_REPO_NAME=${ASS_REPO:-astraiers-core-cli-tool}
ASS_REMOTE=${ASS_REMOTE:-https://github.com/${ASS_GIT_USERNAME}/${ASS_REPO_NAME}.git}
ASS_BRANCH_NAME=${ASS_BRANCH_NAME:-'prod'}



## Add "ass" command into system _BINDIR
## Aadd bash command line completion for ass

# Execution
## Place 





_PREFIX=${PREFIX:-"/usr"}
_BINDIR=${_BINDIR:-${_PREFIX}/bin}
_LIBDIR=${_LIBDIR:-$_PREFIX/lib}

echo "$_PREFIX"
echo "$_BINDIR"
echo "$_LIBDIR"
cd "$_LIBDIR"

pwd
# rm -Rf $ASS_REPO_NAME &> /dev/null
rm -Rf $ASS_REPO_NAME
echo git clone -b $ASS_BRANCH_NAME $ASS_REMOTE
git clone -b $ASS_BRANCH_NAME $ASS_REMOTE

cd $ASS_REPO_NAME
ASS_WORKING_DIR=$PWD

echo "\nAdd \"ass\" to commandline."
chmod +x astraiers-tool-cli.sh
ASS_DIR_RELATIVE_PATH=$(realpath --relative-to="${_BINDIR}" ./astraiers-tool-cli.sh)
cd $_BINDIR
ln -sf "$ASS_DIR_RELATIVE_PATH" ass

echo "Done.\n"

ass
