#!/bin/bash

source "$(dirname "$0")/../../util.sh"

check() {
  require "Need herbstluftwm installed" \
    'type -p herbstclient'
}

action_main "$@"
