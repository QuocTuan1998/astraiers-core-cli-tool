#!/bin/bash
set -e

read -r -p "Are you sure you want to remove ass? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
	  echo "Uninstall cancelled"
	    exit
fi


ASS_CLI_PATH=$(which ass 2>/dev/null)
ASS_CORE_DIR=$(dirname $(realpath $$ASS_CLI_PATH))

echo "Removing \"ass\" from commandline."
echo rm -f $ASS_CLI_PATH
#rm -f $ASS_CLI_PATH
echo "Removing core directory."
echo rm -Rf $ASS_CORE_DIR
#rm -Rf $ASS_CORE_DIR

echo "Thanks for trying out Asstraiers's CLI tool (ass). It's been uninstalled."
echo "Don't forget to restart your terminal!"

