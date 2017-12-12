#!/bin/zsh

source "$HOME/.zgen/zgen.zsh"
zgen loadall < <(
  sed 's/\s*#.*$//' $HOME/.zgen_list/*.list(N) /dev/null
)
zgen save
