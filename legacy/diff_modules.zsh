#!/bin/zsh

vim -d \
  =(find . -name module.yml | sed -e 's|^\./||' -e 's|/module.yml$||' | LC_ALL=C sort | sed 's|^|  - |') \
  list.yml
