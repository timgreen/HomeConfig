#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  git config --global --get include.path \.gitconfig_common &> /dev/null || {
    git config --global --add include.path .gitconfig_common
  }
}

action_main "$@"
