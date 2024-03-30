#!/bin/bash

if [[ $# != 4 ]]; then
    echo "Please enter 4 arguments"
    exit 1
else
    COLOR_1=$1
    COLOR_2=$2
    COLOR_3=$3
    COLOR_4=$4
fi

for var in $COLOR_1 $COLOR_2 $COLOR_3 $COLOR_4
do
    if [[ "$var" < 1 || "$var" > 6 ]]; then
        echo "argument $var is invalid"
        exit 1
    fi
done

if [ $COLOR_1 -eq $COLOR_2 ] || [ $COLOR_3 -eq $COLOR_4 ]; then
    echo "Invalid arguments"
    exit 1
fi

chmod +x set_color.sh
bash set_color.sh $COLOR_1 $COLOR_2 $COLOR_3 $COLOR_4