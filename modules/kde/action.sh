#!/bin/bash

source "$(dirname "$0")/../../util.sh"

disable_akonadi() {
  CONFIG=$HOME/.config/akonadi/akonadiserverrc
  grep 'StartServer=true' "$CONFIG" &> /dev/null && {
    sed -i 's/StartServer=true/StartServer=false/' "$CONFIG"
    echo 'Disable akonadi from auto start.'
  }
}

post_install() {
  disable_akonadi
}

action_main "$@"
