#!/bin/bash

while :; do
 if [ $(xprintidle) -gt 100000 ]
 then
 xdotool mousemove $(($RANDOM % 800)) $(($RANDOM % 600));
 fi

 sleep 30s
done
