#!/bin/bash

source "$(dirname "$0")/../../util.sh"

check_tmux_version() {
  # TODO(timgreen): read version from config
  ! type -p tmux || \
    verlt $(tmux -V | awk '{print $2}') $(get version)
}

check() {
  require "tmux >= $(get version) already installed" check_tmux_version
}

post_install() {
  # build & install tmux
  echo "build & install tmux $(get version)"
  url=$(path_for_version $(get url_tpl) $(get version))
  echo "Downloading $url"
}

action_main "$@"
