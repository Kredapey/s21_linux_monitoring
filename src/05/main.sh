#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Please enter 1 argument"
    exit 1
fi

export FILE_NAME=$1

if [[ ${FILE_NAME: -1} != '/' ]]; then
    echo "ERROR! Path should end with '/'"
    exit 1
fi

if [[ ! -d ${FILE_NAME} ]]; then
    echo "$1 is not a directory"
    exit 1
fi

START=$(date +%s)

export TOTAL_NUM_FOLDERS=$(find $FILE_NAME -type d | wc | awk '{print $1}')\
export TOP_FOLDERS=$(du -h $FILE_NAME | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')
export TOTAL_FILES=$(find $FILE_NAME -type f | wc | awk '{print $1}')
export CONF_FILES=$(find $FILE_NAME -type f -name "*.conf" | wc | awk '{print $1}')
export TXT_FILES=$(find $FILE_NAME -type f -name "*.txt" | wc | awk '{print $1}')
export EXEC_FILES=$(find $FILE_NAME -type f -executable | wc | awk '{print $1}')
export LOG_FILES=$(find $FILE_NAME -type f -name "*.log" | wc | awk '{print $1}')
export ARC_FILES=$(find $FILE_NAME -type f -name "*.zip" -o -name "*.tar" -o -name "*.gz" | wc | awk '{print $1}')
export LINC_FILES=$(find $FILE_NAME -type l| wc | awk '{print $1}')
export TOP_FILES=$(find $FILE_NAME -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')
END=$(date +%s)
export DIFF=$((END-START))

. ./print.sh

