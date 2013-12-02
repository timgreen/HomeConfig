#!/bin/bash

source "$(dirname "$0")/../../util.sh"

pre_install() {
  git clone https://github.com/seebi/dircolors-solarized.git "$HOME/.dircolors-solarized"
}

action_main "$@"
