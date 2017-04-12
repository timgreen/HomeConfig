export LANG=en_US.UTF8
export LC_ALL=en_US.UTF8

## Editor
export EDITOR=vim

## Git
export GIT_PAGER='less -R'

## Path {{{
# TODO(timgreen): use wildcard.
path=(
  $HOME/sh/
  $HOME/bin/

  $HOME/local/bin/                          # user local

  /usr/local/bin/                           # local

  $path                                     # System default
  /sbin/                                    # sbin
  /usr/sbin/                                # sbin
  /usr/local/sbin                           # local sbin
)
## }}}

# This removes duplicates from PATH, CDPATH, MANPATH, and FPATH
typeset -U path manpath fpath


## ibus
declare -x XMODIFIERS="@im=ibus"
