#!/bin/bash
CONFIGURATION_SHELL_NAME=$(pwd)"/configuration_info.sh"

if [ ! -f $CONFIGURATION_SHELL_NAME ]; then
    printf "Cannot find %s\n" $CONFIGURATION_SHELL_NAME
    exit 1;
fi

. $CONFIGURATION_SHELL_NAME

$EOS_BIN_DIR/cleos/cleos --url http://$NODEOS_HOST:$NODEOS_PORT --wallet-url http://$KEOSD_HOST:$KEOSD_PORT "$@"

