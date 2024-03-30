#!/bin/bash

HOSTNAME=$(hostname)
echo "Hostname: $HOSTNAME"

TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)
echo "Timezone: $TIMEZONE UTC $UTC"

USER=$(whoami)
echo "User: $USER"

TYPE=$(uname -o)
VERSION=$(lsb_release -a | grep "Description" | awk '{print $2 $3}')
echo "Type: $TYPE"
echo "Version $Version: $VERSION"

DATE=$(date '+%d %B %Y %T')
echo "Date: $DATE"

UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
echo "Uptime: $UPTIME"
echo "Uptime in sec: up $UPTIME_SEC"

IP=$(ifconfig | grep "inet " | awk '{print $2}')
NETMASK=$(ifconfig| grep "netmask" | awk '{print $4}')
echo "IP: $IP"
echo "Netmask: $NETMASK"

GATEWAY=$(ip r | grep "default" | awk '{print $3}')
echo "Gateway: $GATEWAY"

RAM_TOTAL=$(free -h | grep -e "Память" -e "Mem" | awk '{print $2}')
RAM_USED=$(free -h | grep -e "Память" -e "Mem" | awk '{print $3}')
RAM_FREE=$(free -h | grep -e "Память" -e "Mem" | awk '{print $4}')
echo "Total RAM: $RAM_TOTAL"
echo "Used RAM: $RAM_USED"
echo "Free RAM: $RAM_FREE"

SPACE_TOTAL=$(df -h / | awk '{print $2}' | tail -1)
SPACE_USED=$(df -h / | awk '{print $3}' | tail -1)
SPACE_FREE=$(df -h / | awk '{print $4}' | tail -1)
echo "SPACE_ROOT: $SPACE_TOTAL"
echo "SPACE_ROOT_USED: $SPACE_USED"
echo "SPACE_ROOT_FREE: $SPACE_FREE"

chmod +x save_file.sh
bash save_file.sh "$HOSTNAME" "$TIMEZONE" "$USER" "$TYPE" "$VERSION" "$DATE" "$UPTIME" "$UPTIME_SEC" "$IP" "$NETMASK" "$GATEWAY" "$RAM_TOTAL" "$RAM_USED" "$RAM_FREE" "$SPACE_TOTAL" "$SPACE_USED" "$SPACE_FREE"