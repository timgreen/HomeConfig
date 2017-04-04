#!/bin/bash

dir=~/Downloads/aria/
mkdir -p $dir
cd $dir

sesson=~/.aria2/rcp_session
aria2c --enable-rpc --input-file=$sesson  --save-session=$sesson \
  --seed-ratio=0.1 \
  --max-concurrent-downloads=100 \
  --continue=true \
  --save-session-interval=10


#--rpc-listen-all=true --rpc-allow-origin-all
