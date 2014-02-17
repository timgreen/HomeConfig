#!/bin/bash

DEBUG=false

BASE=$(dirname $(readlink -f "$0"))
ACTION_SCRIPT="action.sh"
MODULE_PATH="$BASE/modules"
EXT_MODULE_PATH="$BASE/ext_modules"
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
msg_unlink() {
  echo "  unlink $1"
}

run_action() {
  m="$1"
  stage="$2"
  if [ -f "$m/$ACTION_SCRIPT" ]; then
    sh "$m/$ACTION_SCRIPT" $stage
  fi
}

find_modules() {
  M_PATH="$1/"
  (for item in $(find "$M_PATH" -maxdepth 1 -mindepth 1 -type d); do
    module=$(basename "$item")
    echo "$module"
  done) | grep -v "^.git$"
}

install_modules() {
  for m in "${CONFIG_MODULES[@]}"; do
    install_module "$MODULE_PATH/$m"
  done
  for m in "${EXT_CONFIG_MODULES[@]}"; do
    install_module "$EXT_MODULE_PATH/$m"
  done
}

uninstall_modules() {
  stage="$1"
  for m in "${CONFIG_MODULES[@]}"; do
    uninstall_module "$MODULE_PATH/$m" $stage
  done
  for m in "${EXT_CONFIG_MODULES[@]}"; do
    uninstall_module "$EXT_MODULE_PATH/$m" $stage
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
  if ! run_action "$m" check; then
    echo "Skip       $m"
    return
  fi

  echo "Installing $m"
  run_action "$m" pre-install

  for src in $(find "$m" -mindepth 1); do
    part=${src:${#m}+1}
    if should_ignore "$part" "$src"; then
      continue
    fi
    dst="$HOME/$part"
    if [ ! -L "$src" ] && [ -d "$src" ]; then
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

  run_action "$m" post-install
  echo "Done       $m"
}

uninstall_module() {
  m="$1"
  stage="$2"

  run_action "$m" $stage
}

scan_configs() {
  CONFIG_MODULES=($(find_modules "$MODULE_PATH"))
  if [ -r "$EXT_MODULE_PATH" ]; then
    EXT_CONFIG_MODULES=($(find_modules "$EXT_MODULE_PATH"))
  fi
  echo "Found ${#CONFIG_MODULES[@]} config modules & ${#EXT_CONFIG_MODULES[@]} ext modules."
}

uninstall_config() {
  uninstall_modules pre-uninstall
  for item in $(find $HOME -mindepth 1 -type l); do
    src=$(readlink "$item")
    if [[ "${src:0:${#BASE}}" == "$BASE" ]]; then
      msg_unlink "$item" "$src"
      unlink "$item"
    fi
  done
  uninstall_modules post-uninstall
}

clean_config() {
  for item in $(find $HOME -mindepth 1 -type l); do
    src=$(readlink "$item")
    if [[ "${src:0:${#BASE}}" == "$BASE" ]] && [ ! -f "$src" ]; then
      msg_unlink "$item" "$src"
      unlink "$item"
    fi
  done
}

cmd="$1"
set -e
scan_configs
case "$cmd" in
  uninstall)
    uninstall_config
  ;;
  clean)
    clean_config
  ;;
  "" | install)
    install_modules
  ;;
esac
