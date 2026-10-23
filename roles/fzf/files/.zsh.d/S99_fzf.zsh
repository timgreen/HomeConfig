# A process started from inside tmux (e.g. a terminal emulator launched from a
# tmux pane) inherits TMUX/TMUX_PANE even though it is not attached to a pane.
# In that state fzf-tab's ftb-tmux-popup still runs `tmux display-popup`, which
# targets the client in the *other* terminal, and fzf's --popup does the same.
# Only trust the variables when the pane they point at is really our own tty.
if [[ -n ${TMUX-}${TMUX_PANE-} ]]; then
  __fzf_my_tty=${TTY:-$(command tty 2>/dev/null)}
  __fzf_pane_tty=$(command tmux display-message -p '#{pane_tty}' 2>/dev/null)
  if [[ -z $__fzf_pane_tty || $__fzf_pane_tty != $__fzf_my_tty ]]; then
    unset TMUX TMUX_PANE
  fi
  unset __fzf_my_tty __fzf_pane_tty
fi

# Legacy knob for the old fzf-tmux wrapper, which is not installed here.
# Kept out of the environment so nothing accidentally calls it.
unset FZF_TMUX

# --popup is a no-op outside tmux/Zellij, so no detection needed.
# Keep --popup after --height: fzf resolves them by position, last one wins,
# so inside tmux we get a popup and outside we get the --height window.
export FZF_DEFAULT_OPTS="--height 40% --min-height 20+ --popup center,80%"

path=(
	$HOME/.fzf/bin
	$path
)
