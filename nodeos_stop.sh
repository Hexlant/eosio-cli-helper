#!/bin/bash
CONFIGURATION_SHELL_NAME=$(pwd)"/configuration_info.sh"

if [ ! -f $CONFIGURATION_SHELL_NAME ]; then
    printf "Cannot find %s\n" $CONFIGURATION_SHELL_NAME
    exit 1;
fi

. $CONFIGURATION_SHELL_NAME

NODEOS_PID_DIR=$EOS_DATA_DIR/nodeos

if [ -f $NODEOS_PID_DIR"/nodeos.pid" ]; then
    nodeos_pid=`cat $NODEOS_PID_DIR"/nodeos.pid"`
    printf "Found nodeos pid: %s\n" $nodeos_pid
    printf "Stopping nodeos"
    kill $nodeos_pid
    rm -r $NODEOS_PID_DIR"/nodeos.pid"

    while true; do
        [ ! -d "/proc/$nodeos_pid/fd" ] && break
	printf "."
	sleep .5
    done

    printf "\nNodeos Stopped.\n"
else
    printf "Cannot find Nodeos which was started by Hexlant Start Script\n"
fi


