#!/bin/zsh

local v
while read v; do
  if [[ $v == -* ]]; then
    unset ${v/#-/}
  else
    # Add quotes around the argument
    v=${v/=/\=\"}
    v=${v/%/\"}
    eval export $v
  fi
done < <(tmux show-environment)
