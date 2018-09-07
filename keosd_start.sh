#!/bin/bash

############################
## START SCRIPT FOR KEOSD ##
## 2018.05 Sangho Kim     ##
############################

CONFIGURATION_SHELL_NAME=$(pwd)"/configuration_info.sh"

if [ ! -f $CONFIGURATION_SHELL_NAME ]; then
    printf "Cannot find %s\n" $CONFIGURATION_SHELL_NAME
    exit 1;
fi

. $CONFIGURATION_SHELL_NAME

printf "Starting Keosd daemon...\n"

if [ ! -d "$KEOSD_DATA_DIR" ]; then
    printf "Creating keosd/data directory...\n"
    mkdir "$KEOSD_DATA_DIR"
fi

if [ ! -d "$KEOSD_LOG_DIR" ]; then
    printf "Creating keosd/log directory...\n"
    mkdir "$KEOSD_LOG_DIR"
fi

KEOSD_CUR_TIME=$(get_cur_time)
nohup $EOS_BIN_DIR/keosd/keosd --wallet-dir $KEOSD_DATA_DIR --config-dir $KEOSD_CONFIG_DIR --http-server-address $KEOSD_HOST:$KEOSD_PORT &> $KEOSD_LOG_DIR/$KEOSD_CUR_TIME".log" &

KEOSD_PID=$!
echo $KEOSD_PID > $EOS_DATA_DIR/keosd/keosd.pid

printf "  * Process ID : \t%s\n" $KEOSD_PID
printf "  * Path to Config : \t%s\n" $KEOSD_CONFIG_DIR
printf "  * Path to Data : \t%s\n" $KEOSD_DATA_DIR
printf "  * Path to Log : \t%s\n" $KEOSD_LOG_DIR"/"$KEOSD_CUR_TIME".log"

printf "\nSuccessfully Started.\n"
