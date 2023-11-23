#!/bin/zsh

source "$HOME/.zgenom/zgenom.zsh"
zgenom loadall < <(
  sed 's/\s*#.*$//' $HOME/.zgen_list/*.list(N) /dev/null
)
zgenom save
