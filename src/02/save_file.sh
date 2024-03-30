#!/bin/bash

HOSTNAME=$1
TIMEZONE=$2
USER=$3
TYPE=$4
VERSION=$5
DATE=$6
UPTIME=$7
UPTIME_SEC=$8
IP=$9
NETMASK=${10}
GATEWAY=${11}
RAM_TOTAL=${12}
RAM_USED=${13}
RAM_FREE=${14}
SPACE_TOTAL=${15}
SPACE_USED=${16}
SPACE_FREE=${17}

read -p "Do you want to white data to a file?(Y or N) " ANSWER

if [ "$ANSWER" == "Y" ] || [ "$ANSWER" == "y" ]; then
    NAME_FILE="$(date +%d_%m_%Y_%H_%M_%S).status"
    touch "$NAME_FILE"
    echo "Hostname: $HOSTNAME" >> $NAME_FILE
    echo "Timezone: $TIMEZONE UTC $UTC"  >> $NAME_FILE
    echo "User: $USER"  >> $NAME_FILE
    echo "Type: $TYPE" >> $NAME_FILE
    echo "Version $Version: $VERSION"  >> $NAME_FILE
    echo "Date: $DATE"  >> $NAME_FILE
    echo "Uptime: $UPTIME"  >> $NAME_FILE
    echo "Uptime in sec: up $UPTIME_SEC"  >> $NAME_FILE
    echo "IP: $IP"  >> $NAME_FILE
    echo "Netmask: $NETMASK"  >> $NAME_FILE
    echo "Gateway: $GATEWAY"  >> $NAME_FILE
    echo "Total RAM: $RAM_TOTAL"  >> $NAME_FILE
    echo "Used RAM: $RAM_USED"  >> $NAME_FILE
    echo "Free RAM: $RAM_FREE"  >> $NAME_FILE
    echo "SPACE_ROOT: $SPACE_TOTAL"  >> $NAME_FILE
    echo "SPACE_ROOT_USED: $SPACE_USED"  >> $NAME_FILE
    echo "SPACE_ROOT_FREE: $SPACE_FREE"  >> $NAME_FILE
    echo "Data saved to $NAME_FILE"
else
    echo "Data not saved"
fi
