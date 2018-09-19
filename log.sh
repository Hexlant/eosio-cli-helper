#!/bin/bash
CONFIGURATION_SHELL_NAME=$(pwd)"/configuration_info.sh"

if [ ! -f $CONFIGURATION_SHELL_NAME ]; then
    printf "Cannot find %s\n" $CONFIGURATION_SHELL_NAME
    exit 1;
fi

. $CONFIGURATION_SHELL_NAME

if [ ! -d "$NODEOS_DATA_DIR" ]; then
    printf "Creating nodeos/data directory...\n"
    mkdir "$NODEOS_DATA_DIR"
fi

if [ ! -d "$NODEOS_LOG_DIR" ]; then
    printf "Creating nodeos/log directory...\n"
    mkdir "$NODEOS_LOG_DIR"
fi

default_line_fetch=50

last=$(ls -Ft "$NODEOS_LOG_DIR" | grep -v '[/=|]$' | head -1)

if [ ${#last} -eq 0 ]; then
    echo "No file exists!"
    exit
fi

echo " - Target file : $NODEOS_LOG_DIR/$last"
echo " - from last $default_line_fetch lines ... "
echo
tail -f -n $default_line_fetch "$NODEOS_LOG_DIR/$last"
