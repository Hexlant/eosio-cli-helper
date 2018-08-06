# Default Path
EOS_BIN_DIR=$HOME"/eos/build/programs"
EOS_DATA_DIR=$(pwd)


## Nodeos Path
NODEOS_DIR=$EOS_DATA_DIR"/nodeos"
NODEOS_CONFIG_DIR=$NODEOS_DIR"/config"
NODEOS_DATA_DIR=$NODEOS_DIR"/data"
NODEOS_LOG_DIR=$NODEOS_DIR"/log"


## Keosd Path
KEOSD_DIR=$EOS_DATA_DIR"/keosd"
KEOSD_CONFIG_DIR=$KEOSD_DIR"/config"
KEOSD_DATA_DIR=$KEOSD_DIR"/data"
KEOSD_LOG_DIR=$KEOSD_DIR"/log"


## Connection Information
MAIN_IP_ADDR="127.0.0.1"

NODEOS_HOST="127.0.0.1"
NODEOS_PORT="8888"
NODEOS_P2P_PORT="9999"

KEOSD_HOST="127.0.0.1"
KEOSD_PORT="3456"


## genesis nodeos Information
PRODUCER_NAME=eosio
PRODUCER_PUB_KEY=EOS58GWZ6E8bshTgQKyJRza5GKEdrUAxSRL3zdtNehVneLhKdZbpN
PRODUCER_PRIV_KEY=5JP6eTrA3UdaWHLBQ5BSKQxKE2tWkQ4267yWSrjT49azoGjgyrC
AGENT_NAME="Genesis_Agent"


## Functions
get_cur_time () {
    date +"%Y%m%d_%H%M%S"
}


