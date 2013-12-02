#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  mkdir -p "$HOME/.vim/bundle/"
  [ -r "$HOME/.vim/bundle/vundle" ] || git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
  echo "Installing vim plugins ..."
  vim +BundleInstall +qall
}

action_main "$@"
