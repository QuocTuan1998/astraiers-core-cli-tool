#!/bin/bash

# Installing for this tool

# Load config
source ./config/default.conf

# Add command to shell
echo ${ASSTRAIERS_CLI_NAME}
ln -fs "astraiers-tool-cli.sh" ${ASSTRAIERS_CLI_NAME}


