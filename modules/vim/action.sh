#!/bin/bash

post_install() {
  [ -r "$HOME/.vim/bundle/vundle" ] || git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
  echo "Installing vim plugins ..."
  vim +BundleInstall +qall
}

cmd="$1"
case "$cmd" in 
  post-install)
    post_install
  ;;
esac
