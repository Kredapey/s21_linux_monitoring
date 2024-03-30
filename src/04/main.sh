#!/bin/bash

if [[ $# != 0 ]]; then
    echo "No arguments needed"
    exit 1
else
    source config.txt
    COLOR_1=$column1_background
    COLOR_2=$column1_font_color
    COLOR_3=$column2_background
    COLOR_4=$column2_font_color
fi

for var in $COLOR_1 $COLOR_2 $COLOR_3 $COLOR_4
do
    if [[ "$var" < 1 || "$var" > 6 ]]; then
        echo "argument $var is invalid"
        exit 1
    fi
done

chmod +x set_color.sh
bash set_color.sh $COLOR_1 $COLOR_2 $COLOR_3 $COLOR_4