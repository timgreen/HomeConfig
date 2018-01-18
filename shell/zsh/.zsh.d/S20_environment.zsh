export LANG=en_US.UTF8
export LC_ALL=en_US.UTF8

## Editor
export EDITOR=vim

## Path
path=(
  $HOME/sh
  $HOME/bin

  $HOME/local/bin                          # user local
  $HOME/.local/bin                         # e.g. pip install --local

  /usr/local/bin                           # local

  $path                                    # System default
  /sbin                                    # sbin
  /usr/sbin                                # sbin
  /usr/local/sbin                          # local sbin
)

# This removes duplicates from PATH, CDPATH, MANPATH, and FPATH
typeset -U path manpath fpath
