#!/bin/bash
# Installing for this tool

set -e

# Default settings
ASS_REPO=${REPO:-ohmyzsh/ohmyzsh}
ASS_REMOTE=${REMOTE:-https://github.com/${REPO}.git}
ASS_BRANCH=${BRANCH:-master}

PREFIX=${PREFIX:-"/usr"}
BINDIR=${BINDIR:-$PREFIX/bin}
LIBEXECDIR=${LIBEXEC:-$PREFIX/libexec}

#echo $PREFIX
#echo $BINDIR
#echo $LIBEXECDIR

echo "Cloning Asstraiters-core-cli-tool...:

