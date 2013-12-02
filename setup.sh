#!/bin/bash

BASE=$(dirname $(readlink -f "$0"))
MODULE_PATH="$BASE/modules"
IFS=$'\n'
declare -a CONFIG_MODULES

msg_link() {
  echo "  link  $1"
}
msg_mkdir() {
  echo "  mkdir $1"
}
msg_skip() {
  echo "  skip  $1"
}

find_modules() {
  for item in $(find "$MODULE_PATH" -maxdepth 1 -mindepth 1 -type d); do
    module=$(basename "$item")
    echo "$module"
  done
}

install_modules() {
  for m in "${CONFIG_MODULES[@]}"; do
    echo "Installing $m"
    install_module "$MODULE_PATH/$m"
    echo "Done       $m"
  done
}

install_module() {
  m="$1"
  for src in $(find "$m" -mindepth 1); do
    part=${src:${#m}+1}
    dst="$HOME/$part"
    if [ -d "$src" ]; then
      #mkdir -p "$HOME/$part"
      msg_mkdir "$part"
    else
      if [ -e "$dst" ]; then
        msg_skip "$part"
      else
        #ln -s "$src" "$dst"
        msg_link "$part"
      fi
    fi
  done
}

main() {
  set -e
  CONFIG_MODULES=($(find_modules))
  echo "Found ${#CONFIG_MODULES[@]} config modules."
  
  install_modules
}

main
