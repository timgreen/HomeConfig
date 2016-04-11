#!/bin/bash

function usage()
{
    echo "$0 source destination"
    exit 1
}

function progressbar()
{
    bar="=================================================="
    barlength=${#bar}
    n=$(($1*barlength/100))
    printf "\r[%-${barlength}s] %d%%" "${bar:0:n}" "$1"
    # echo -ne "\b$1"
}

export -f progressbar

[[ $# < 2 ]] && usage

SRC=$1
DST=$2

[ ! -f $SRC ] && { \
    echo "source file not found"; \
    exit 2; \
}

which adb >/dev/null 2>&1 || { \
    echo "adb doesn't exist in your path"; \
    exit 3; \
}

SIZE=$(ls -l $SRC | awk '{print $5}')
ADB_TRACE=adb adb push $SRC $DST 2>&1 \
    | sed -n '/DATA/p' \
    | awk -v T=$SIZE 'BEGIN{FS="[=:]"}{t+=$7;system("progressbar " sprintf("%d\n", t/T*100))}'

echo 
