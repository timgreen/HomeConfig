#!/bin/bash

for tmux_snipplet in $(
  find ~/.tmux/ -maxdepth 1 \
    -name 'S[0-9][0-9]_*.tmux.sh' \
    -o \
    -name 'S[0-9][0-9]_*.tmux.conf' \
    2>/dev/null | sort
); do
  case "$tmux_snipplet" in
    *.tmux.sh)
      sh "$tmux_snipplet"
      ;;
    *.tmux.conf)
      tmux source-file "$tmux_snipplet"
      ;;
  esac
done
