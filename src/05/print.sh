#!/bin/bash

echo "Total number of folders (including all nested ones) = $TOTAL_NUM_FOLDERS"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_FOLDERS"
echo "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_FILES"
echo "Text files = $TXT_FILES"
echo "Executable files = $EXEC_FILES"
echo "Log files (with the extension .log) = $LOG_FILES"
echo "Archive files = $ARC_FILES"
echo "Symbolic links = $LINC_FILES"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
find "$FILE_NAME" -type f -executable | while read -r file; do
    size=$(du -h "$file" | awk '{print $1}')
    md5=$(md5sum "$file" | awk '{print $1}')
    echo "$file, $size, $md5"
done | sort -hrk 2 | head -10 | cat -n | awk '{print $1 " - " $2 " " $3 " " $4}'
echo "Script execution time (in seconds) = $DIFF"