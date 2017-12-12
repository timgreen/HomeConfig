#!/bin/zsh

source "$HOME/.zgen/zgen.zsh"
yes | zgen selfupdate
yes n | zgen update
zgen loadall < <(sed 's/\s*#.*$//' $HOME/.zgen_list/*.list)
zgen save
