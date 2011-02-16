#!/bin/bash

IFS="
"
cd $(dirname "$0")

function getConfigList() {
  find . -type f \
  | sed "s!^\./!!" \
  | grep -v "^\.git" \
  | grep -v "/.git/" \
  | grep -v "^action.sh" \
  | grep -v "^list"
}

# Check the status of target, see it already point to source or not.
function checkTrackedLink() {
  local file="$1"
  local target="$HOME/$file"
  local targetLink=$(readlink "$target")
  if [[ "$targetLink" != "$PWD/$file" ]]; then
    echo "[NO] - $file" >&2
    return 1
#  else
#    echo "[YES] - $file"
  fi
}

function checkUntrackedFile() {
  local dir="$1"
  [[ -d "$HOME/$dir" ]] || return;

  for target in $(find "$HOME/$dir" -maxdepth 1 -mindepth 1| sed "s!^\./!!"); do
    local file="$dir/$(basename $target)"

    if [[ -d "$target" ]]; then
      if [[ ! -a "$file" ]]; then
        echo "[Untracked dir] - $target" >&2
        continue
      fi
      if [[ ! -d "$file" ]]; then
        echo "[C dir ^dir] - $target" >&2
        continue
      fi
      checkUntrackedFile "$file"
    else
      if [[ ! -a "$PWD/$file" ]]; then
        echo "[Untracked file] - $target" >&2
        continue
      fi
      if [[ ! -L "$target" ]]; then
        echo "[C not link] - $target" >&2
        continue
      fi
      local targetLink=$(readlink "$target")
      if [[ "$targetLink" != "$PWD/$file" ]]; then
        echo "[C link] - $target" >&2
        continue
      fi
    fi
  done
}

function check() {
  for i in $(getConfigList); do
    checkTrackedLink "$i"
  done
  for i in $(find . -maxdepth 1 -mindepth 1 -type d | sed "s!^\./!!"); do
    checkUntrackedFile $i
  done
}

function installConfig() {
  for i in $(getConfigList); do
    local dir=$(dirname "$HOME/$i")
    mkdir -p "$dir"
    ln -sf "$PWD/$i" "$HOME/$i"
  done

  # TODO(timgreen): refactor
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
