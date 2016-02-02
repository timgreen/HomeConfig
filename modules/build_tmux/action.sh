#!/bin/bash

source "$(dirname "$0")/../../util.sh"

check_tmux_version() {
  # TODO(timgreen): read version from config
  ! type -p tmux || \
    verlt $(tmux -V | awk '{print $2}') $(get_version)
}

check() {
  require "tmux >= $(get_version) already installed" check_tmux_version
}

post_install() {
  # build & install tmux
  echo "build & install tmux $(get_version)"
}

action_main "$@"
