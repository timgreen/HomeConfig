#!/bin/bash

IFS="
"
cd $(dirname "$0")

function getConfigList() {
  find . -type f \
  | sed "s!^\./!!" \
  | grep -v "^\.git" \
  | grep -v "^action.sh" \
  | grep -v "^list"
}

# Check the status of target, see it already point to source or not.
function checkLink() {
  file="$1"
  target="$HOME/$file"
  targetLink=$(readlink "$target")
  if [[ "$targetLink" == "$PWD/$file" ]]; then
    echo "[YES] - $file"
  else
    echo "[NO] - $file"
    return 1
  fi
}

function check() {
  for i in $(getConfigList); do
    checkLink "$i"
  done
}

function installConfig() {
  for i in $(getConfigList); do
    dir=$(dirname "$HOME/$i")
    mkdir -p "$dir"
    ln -sf "$PWD/$i" "$HOME/$i"
  done

  # compile terminfo
  cd ~/.terminfo/
  tic mostlike.txt
}

function removeConfig() {
  for i in $(getConfigList); do
    rm -f "$HOME/$i"
  done
}

case "$1" in
  check)
  check
    ;;
  install)
    installConfig
    ;;
  rm)
    removeConfig
    ;;
  *)
    getConfigList
    ;;
esac
