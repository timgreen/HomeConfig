#!/bin/bash

cd $HOME

# link hcm.yml
mkdir -p ~/.hcm
{
  echo "shell: zsh"
  echo "lists:"
  echo "  - /source/list.yml"
} > ~/.hcm/hcm.yml

# hcm sync
/source/sync.sh
