#!/bin/bash
CONFIGURATION_SHELL_NAME=$(pwd)"/configuration_info.sh"

if [ ! -f $CONFIGURATION_SHELL_NAME ]; then
    printf "Cannot find %s\n" $CONFIGURATION_SHELL_NAME
    exit 1;
fi

. $CONFIGURATION_SHELL_NAME

KEOSD_PID_DIR=$EOS_DATA_DIR/keosd

if [ -f $KEOSD_PID_DIR"/keosd.pid" ]; then
    keosd_pid=`cat $KEOSD_PID_DIR"/keosd.pid"`
    printf "Found keosd pid: %s\n" $keosd_pid
    printf "Stopping keosd"
    kill $keosd_pid
    rm -r $KEOSD_PID_DIR"/keosd.pid"

    while true; do
        [ ! -d "/proc/$keosd_pid/fd" ] && break
	printf "."
	sleep .5
    done

    printf "\nKeosd Stopped.\n"
else
    printf "Cannot find Keosd which was started by Hexlant Start Script\n"
fi


