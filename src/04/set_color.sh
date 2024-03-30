#!/bin/bash

WHITE="\033[97m"
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
PURPLE="\033[35m"
BLACK="\033[30m"

WHITE_BG="\033[107m"
RED_BG="\033[41m"
GREEN_BG="\033[42m"
BLUE_BG="\033[44m"
PURPLE_BG="\033[45m"
BLACK_BG="\033[40m"

export BG_BEF=$1
export FT_BEF=$2
export BG_AF=$3
export FT_AF=$4

DEF_1=1
DEF_2=2
DEF_3=1
DEF_4=2

export DEF_1_FLAG=0
export DEF_2_FLAG=0
export DEF_3_FLAG=0
export DEF_4_FLAG=0

if [[ -z ${BG_BEF} ]]; then
    BG_BEF=$DEF_1
    DEF_1_FLAG=1
fi

if [[ -z ${FT_BEF} ]]; then
    FT_BEF=$DEF_2
    DEF_2_FLAG=1
fi

if [[ -z ${BG_AF} ]]; then
    BG_AF=$DEF_3
    DEF_3_FLAG=1
fi

if [[ -z ${FT_AF} ]]; then
    FT_AF=$DEF_4
    DEF_4_FLAG=1
fi

if [ $BG_BEF -eq $FT_BEF ] || [ $BG_AF -eq $FT_AF ]; then
    echo "Invalid arguments"
    exit 1
fi

COUNTER=0

for var in BG_BEF FT_BEF BG_AF FT_AF
do
    if [[ $var -eq 1 ]]; then
        
        if [[ $COUNTER -eq 0 ]]; then
            BG_BEF=$WHITE_BG
            export COLOR_BG_BEF=WHITE
        elif [[ $COUNTER -eq 1 ]]; then
            FT_BEF=$WHITE
            export COLOR_FT_BEF=WHITE
        elif [[ COUNTER -eq 2 ]]; then
            BG_AF=$WHITE_BG
            export COLOR_BG_AF=WHITE
        elif [[ COUNTER -eq 3 ]]; then
            FT_AF=$WHITE
            export COLOR_FT_AF=WHITE
        fi
        let COUNTER++
    elif [[ $var -eq 2 ]]; then
        if [[ $COUNTER -eq 0 ]]; then
            BG_BEF=$RED_BG
            export COLOR_BG_BEF=RED
        elif [[ $COUNTER -eq 1 ]]; then
            FT_BEF=$RED
            export COLOR_FT_BEF=RED
        elif [[ COUNTER -eq 2 ]]; then
            BG_AF=$RED_BG
            export COLOR_BG_AF=RED
        elif [[ COUNTER -eq 3 ]]; then
            FT_AF=$RED
            export COLOR_FT_AF=RED
        fi
        let COUNTER++
    elif [[ $var -eq 3 ]]; then
        if [[ $COUNTER -eq 0 ]]; then
            BG_BEF=$GREEN_BG
            export COLOR_BG_BEF=GREEN
        elif [[ $COUNTER -eq 1 ]]; then
            FT_BEF=$GREEN
            export COLOR_FT_BEF=GREEN
        elif [[ COUNTER -eq 2 ]]; then
            BG_AF=$GREEN_BG
            export COLOR_BG_AF=GREEN
        elif [[ COUNTER -eq 3 ]]; then
            FT_AF=$GREEN
            export COLOR_FT_AF=GREEN
        fi
        let COUNTER++
    elif [[ $var -eq 4 ]]; then
        if [[ $COUNTER -eq 0 ]]; then
            BG_BEF=$BLUE_BG
            export COLOR_BG_BEF=BLUE
        elif [[ $COUNTER -eq 1 ]]; then
            FT_BEF=$BLUE
            export COLOR_FT_BEF=BLUE
        elif [[ COUNTER -eq 2 ]]; then
            BG_AF=$BLUE_BG
            export COLOR_BG_AF=BLUE
        elif [[ COUNTER -eq 3 ]]; then
            FT_AF=$BLUE
            export COLOR_FT_AF=BLUE
        fi
        let COUNTER++
    elif [[ $var -eq 5 ]]; then
        if [[ $COUNTER -eq 0 ]]; then
            BG_BEF=$PURPLE_BG
            export COLOR_BG_BEF=PURPLE
        elif [[ $COUNTER -eq 1 ]]; then
            FT_BEF=$PURPLE
            export COLOR_FT_BEF=PURPLE
        elif [[ COUNTER -eq 2 ]]; then
            BG_AF=$PURPLE_BG
            export COLOR_BG_AF=PURPLE
        elif [[ COUNTER -eq 3 ]]; then
            FT_AF=$PURPLE
            export COLOR_FT_AF=PURPLE
        fi
        let COUNTER++
    elif [[ $var -eq 6 ]]; then
        if [[ $COUNTER -eq 0 ]]; then
            BG_BEF=$BLACK_BG
            export COLOR_BG_BEF=BLACK
        elif [[ $COUNTER -eq 1 ]]; then
            FT_BEF=$BLACK
            export COLOR_FT_BEF=PURPLE
        elif [[ COUNTER -eq 2 ]]; then
            BG_AF=$BLACK_BG
            export COLOR_BG_AF=PURPLE
        elif [[ COUNTER -eq 3 ]]; then
            FT_AF=$BLACK
            export COLOR_FT_AF=PURPLE
        fi
        let COUNTER++
    fi
done

export HOSTNAME=$(hostname)
export TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
export UTC=$(date +%z)
export USER=$(whoami)
export TYPE=$(uname -o)
export VERSION=$(lsb_release -a | grep "Description" | awk '{print $2 $3}')
export DATE=$(date '+%d %B %Y %T')
export UPTIME=$(uptime -p)
export UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
export IP=$(ifconfig | grep "inet " | awk '{print $2}')
export NETMASK=$(ifconfig| grep "netmask" | awk '{print $4}')
export GATEWAY=$(ip r | grep "default" | awk '{print $3}')
export RAM_TOTAL=$(free -h | grep -e "Память" -e "Mem" | awk '{print $2}')
export RAM_USED=$(free -h | grep -e "Память" -e "Mem" | awk '{print $3}')
export RAM_FREE=$(free -h | grep -e "Память" -e "Mem" | awk '{print $4}')
export SPACE_TOTAL=$(df -h / | awk '{print $2}' | tail -1)
export SPACE_USED=$(df -h / | awk '{print $3}' | tail -1)
export SPACE_FREE=$(df -h / | awk '{print $4}' | tail -1)

. ./print.sh


