#!/bin/bash
#set -e

echo -e "Astraiers-core-cli-tool uninstaller\n"

ASS_CLI_PATH=$(which ass 2>/dev/null)
if ! [ -x "$ASS_CLI_PATH" ]; then
	echo "ERROR: ass could not be found!"
	exit 1
fi
echo -e "Found \"ass\" excuter at:"
echo -e " - $ASS_CLI_PATH"

ASS_CORE_DIR=$(dirname $(realpath $ASS_CLI_PATH))
echo -e "Linked directory:"
echo -e " - $ASS_CORE_DIR"

echo ""

read -r -p "Are you sure you want to remove ass? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
	echo -e "Uninstall cancelled.\n"
	exit
fi

echo "Removing \"ass\" from commandline."
rm -f $ASS_CLI_PATH
echo "Removing linked directory."
rm -Rf $ASS_CORE_DIR

echo -e "Done.\n"

echo -e "You can reinstall this tool by executing below command:\n"
echo -e 'bash -c "$(wget https://raw.githubusercontent.com/thanhntmany/astraiers-core-cli-tool/main/install.sh -O -)"'
echo ""

echo -e "Thanks for trying out Asstraiers's CLI tool (ass). It's been uninstalled."
echo -e "Don't forget to restart your terminal!\n"


