# Default Path
EOS_BIN_DIR=$HOME"/eos/build/programs"
EOS_DATA_DIR=$(pwd)


# Nodeos Path
NODEOS_DIR=$EOS_DATA_DIR"/nodeos"
NODEOS_CONFIG_DIR=$NODEOS_DIR"/config"
NODEOS_DATA_DIR=$NODEOS_DIR"/data"
NODEOS_LOG_DIR=$NODEOS_DIR"/log"


# Keosd Path
KEOSD_DIR=$EOS_DATA_DIR"/keosd"
KEOSD_CONFIG_DIR=$KEOSD_DIR"/config"
KEOSD_DATA_DIR=$KEOSD_DIR"/data"
KEOSD_LOG_DIR=$KEOSD_DIR"/log"


# Connection Information

## Addr for P2P endpoint
MAIN_IP_ADDR="127.0.0.1"

## Host for NODEOS
NODEOS_SCHEMA="http"
NODEOS_HOST="0.0.0.0"

## Port for NODEOS
NODEOS_PORT="8880"
NODEOS_P2P_PORT="9990"

## Host for KEOSD
KEOSD_SCHEMA="http"
KEOSD_HOST="127.0.0.1"

## Port for KEOSD
KEOSD_PORT="3456"


## genesis nodeos Information
PRODUCER_NAME=lazylion1234
PRODUCER_PUB_KEY=EOS64wKR5yCY5kx5TnW6nYNvxP9jonHEZQmG6L2UhtqRPx1Z7LwNV
PRODUCER_PRIV_KEY=5JR9m7obExvkYt5W9eURTWHZDRgvMZDXRPCLx4WsLsN6cBymDdn
AGENT_NAME="JUNGLE_TESTNET_NODE"


## Functions
get_cur_time () {
    date +"%Y%m%d_%H%M%S"
}


