#!/bin/bash

source "$(dirname "$0")/../../util.sh"

NPM_COMPLETION_PATH="$HOME/.zsh.comp.d/_npm"
NPM="$HOME/dev/nodejs/bin/npm"

post_install() {
  if [ -x "$NPM" ]; then
    mkdir -p "$(dirname "$NPM_COMPLETION_PATH")"
    $NPM completion > "$NPM_COMPLETION_PATH"
  fi
}

pre_uninstall() {
  [ -e "$NPM_COMPLETION_PATH" ] && rm -f "$NPM_COMPLETION_PATH"
}

action_main "$@"
