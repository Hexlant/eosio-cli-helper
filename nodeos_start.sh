#!/bin/bash
CONFIGURATION_SHELL_NAME=$(pwd)"/configuration_info.sh"

if [ ! -f $CONFIGURATION_SHELL_NAME ]; then
    printf "Cannot find %s\n" $CONFIGURATION_SHELL_NAME
    exit 1;
fi

. $CONFIGURATION_SHELL_NAME

printf "Starting Genesis EOS daemon...\n"

NODEOS_CUR_TIME=$(get_cur_time)


if [ -n "$(find "$NODEOS_DATA_DIR" -maxdepth 0 -type d -empty 2>/dev/null)" ]; then
    nohup $EOS_BIN_DIR/nodeos/nodeos -e -p $PRODUCER_NAME --genesis-json $NODEOS_CONFIG_DIR"/genesis.json" --signature-provider $PRODUCER_PUB_KEY=KEY:$PRODUCER_PRIV_KEY --agent-name \"$AGENT_NAME\" --config-dir $NODEOS_CONFIG_DIR --data-dir $NODEOS_DATA_DIR --http-server-address $NODEOS_HOST:$NODEOS_PORT --p2p-listen-endpoint 0.0.0.0:$NODEOS_P2P_PORT --p2p-server-address $MAIN_IP_ADDR:$NODEOS_P2P_PORT $1 &> $NODEOS_LOG_DIR/$NODEOS_CUR_TIME".log" &
else
    nohup $EOS_BIN_DIR/nodeos/nodeos -e -p $PRODUCER_NAME                                                  --signature-provider $PRODUCER_PUB_KEY=KEY:$PRODUCER_PRIV_KEY --agent-name \"$AGENT_NAME\" --config-dir $NODEOS_CONFIG_DIR --data-dir $NODEOS_DATA_DIR --http-server-address $NODEOS_HOST:$NODEOS_PORT --p2p-listen-endpoint 0.0.0.0:$NODEOS_P2P_PORT --p2p-server-address $MAIN_IP_ADDR:$NODEOS_P2P_PORT $1 &> $NODEOS_LOG_DIR/$NODEOS_CUR_TIME".log" &
fi


NODEOS_PID=$!
echo $NODEOS_PID > $EOS_DATA_DIR/nodeos/nodeos.pid

printf "  * Process ID : \t%s\n" $NODEOS_PID
printf "  * Initial Producer : \t%s (%s, %s)\n" $PRODUCER_NAME $PRODUCER_PUB_KEY $PRODUCER_PRIV_KEY
printf "  * Path to Config : \t%s\n" $NODEOS_CONFIG_DIR
printf "  * Path to Data : \t%s\n" $NODEOS_DATA_DIR
printf "  * Path to Log : \t%s\n" $NODEOS_LOG_DIR"/"$NODEOS_CUR_TIME".log"


printf "\nSuccessfully Started.\n"
