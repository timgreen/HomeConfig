function find-up() {
  local filename=$1
  local dir=$(pwd)

  while [[ $dir != / ]]; do
    if [[ -f $dir/$filename ]]; then
      echo "$dir/$filename"
      return 0
    fi
    dir=$(dirname $dir)
  done
  return 1
}

# Update the prompt with "make -C <dir>" if the prompt is empty or "make"
function find_nearest_makefile() {
  # Check if the prompt is empty or contains "make"
  if [[ -z $BUFFER || $BUFFER == make ]]; then
    # Find the nearest Makefile
    local makefile=$(find-up Makefile)

    # If a Makefile is found, update the prompt to "make"
    # with the appropriate -C option
    if [[ -n $makefile ]]; then
      local makefile_dir=$(dirname $makefile)
      makefile_dir=$(realpath --relative-to=$(pwd) $makefile_dir)
      if [[ $makefile_dir != "." ]]; then
        BUFFER="make -C $makefile_dir "
        zle reset-prompt
        zle end-of-line
      fi
    fi
  fi
}

# Bind the widget to Ctrl-Space
zle -N find_nearest_makefile
bindkey '^ ' find_nearest_makefile
