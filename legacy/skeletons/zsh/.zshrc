# vim: set ft=zsh foldmethod=marker autoindent expandtab shiftwidth=2 :

for zshrc_snipplet in $(find ~/.zsh.d/ -name 'S[0-9][0-9]_*' 2> /dev/null | sort); do
  source $zshrc_snipplet
done

# This removes duplicates from PATH, MANPATH, and FPATH
typeset -U path manpath fpath
