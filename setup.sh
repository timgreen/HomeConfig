#!/bin/bash

BASE=$(dirname $(readlink -f "$0"))
MODULE_PATH="$BASE/modules"
IFS=$'\n'
declare -a CONFIG_MODULES

find_modules() {
  for item in $(find "$MODULE_PATH" -maxdepth 1 -mindepth 1 -type d); do
    module=$(basename "$item")
    echo "$module"
  done
}

install_modules() {
  for m in "${CONFIG_MODULES[@]}"; do
    echo "Installing $m"
    echo "Done       $m"
  done
}

main() {
  CONFIG_MODULES=($(find_modules))
  echo "Found ${#CONFIG_MODULES[@]} config modules."
  
  install_modules
}

main
