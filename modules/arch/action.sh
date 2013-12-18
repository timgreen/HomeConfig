#!/bin/bash

source "$(dirname "$0")/../../util.sh"

check_arch() {
  cat /etc/*-release | grep 'NAME="Arch Linux"'
}

check() {
  require "Only for Arch Linux" check_arch
  require "Need aria2c installed" \
    'type -p aria2c'
}

action_main "$@"
