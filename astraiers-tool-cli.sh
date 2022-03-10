#!/bin/bash

# Make sure this script run at right directory. Also when it is run from a symbolic link.
cd $(dirname -- "$(readlink -f -- "$0")")

# Load configuarations
source ./config/default.conf

# Simple action: Show banner
source ./tools/banner.sh
echo Asstraiers
echo ${ASS["ss"]}

