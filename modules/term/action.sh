#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  tic "$HOME/.terminfo/mostlike.txt"
}

action_main "$@"
