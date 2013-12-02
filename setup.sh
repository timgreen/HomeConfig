#!/bin/bash

DEBUG=false

BASE=$(dirname $(readlink -f "$0"))
ACTION_SCRIPT="action.sh"
MODULE_PATH="$BASE/modules"
EXT_MODULE_PATH="$BASE/modules"
IFS=$'\n'
declare -a CONFIG_MODULES
declare -a EXT_CONFIG_MODULES

msg_link() {
  echo "  link  $1"
}
msg_mkdir() {
  echo "  mkdir $1"
}
msg_skip_dir() {
  if [[ $DEBUG == true ]]; then
    echo "  skip  $1/"
  fi
}
msg_error_dir() {
  echo "  error $1/"
}
msg_skip_file() {
  if [[ $DEBUG == true ]]; then
    echo "  skip  $1"
  fi
}
msg_error_file() {
  echo "  error $1"
}

find_modules() {
  M_PATH="$1"
  for item in $(find "$M_PATH" -maxdepth 1 -mindepth 1 -type d); do
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
  for m in "${EXT_CONFIG_MODULES[@]}"; do
    echo "Installing $m"
    install_module "$EXT_MODULE_PATH/$m"
    echo "Done       $m"
  done
}

should_ignore() {
  part="$1"
  src="$2"
  [[ "$part" == "action.sh" ]] || \
    [[ "$part" == ".gitignore" ]] || \
    [[ "$part" == ".git" ]] || \
    [[ "$part" == "README.md" ]];
}

install_module() {
  m="$1"
  if [ -f "$m/$ACTION_SCRIPT" ]; then
    sh "$m/$ACTION_SCRIPT" pre-install
  fi

  for src in $(find "$m" -mindepth 1); do
    part=${src:${#m}+1}
    if should_ignore "$part" "$src"; then
      continue;
    fi
    dst="$HOME/$part"
    if [ -d "$src" ]; then
      if [ -e "$dst" ]; then
        if [ -d "$dst" ]; then
          msg_skip_dir "$part"
        else 
          msg_error_dir "$part"
        fi
      else 
        msg_mkdir "$part"
        mkdir "$dst"
      fi
    else
      if [ -e "$dst" ]; then
        if [[ "$(readlink "$dst")" == "$src" ]]; then
          msg_skip_file "$part"
        else
          msg_error_file "$part"
        fi
      else
        msg_link "$part"
        ln -s "$src" "$dst"
      fi
    fi
  done

  if [ -f "$m/$ACTION_SCRIPT" ]; then
    sh "$m/$ACTION_SCRIPT" post-install
  fi
}

main() {
  set -e
  CONFIG_MODULES=($(find_modules "$MODULE_PATH"))
  if [ -d "$EXT_CONFIG_MODULES" ]; then
    EXT_CONFIG_MODULES=($(find_modules "$EXT_MODULE_PATH"))
  fi
  echo "Found ${#CONFIG_MODULES[@]} config modules & ${#EXT_CONFIG_MODULES[@]} ext modules."
  
  install_modules
}

main
