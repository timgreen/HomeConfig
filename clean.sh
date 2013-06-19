#!/bin/bash

IFS='
'
for i in $(find $HOME -type l | grep "^$HOME/\."); do
  readlink -f "$i" > /dev/null || {
    echo "Clean dead link: $i"
  }
done
