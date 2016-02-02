#!/bin/bash

source "$(dirname "$0")/../../util.sh"

check_tmux_version() {
  # TODO(timgreen): read version from config
  ! type -p tmux || \
    verlt $(tmux -V | awk '{print $2}') 2.1
}

check() {
  require "tmux >= 2.1 already installed" check_tmux_version
}

post_install() {
  # build & install tmux
  echo "build & install tmux"
}

action_main "$@"
