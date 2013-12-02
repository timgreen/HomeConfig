#!/bin/bash

post_install() {
  tic "$HOME/.terminfo/mostlike.txt"
}

cmd="$1"
case "$cmd" in 
  post-install)
    post_install
  ;;
esac
