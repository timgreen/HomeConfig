# Prefer a tmux popup for fzf zsh keybindings.
# --popup is ignored outside tmux/Zellij, so no $TMUX check is needed; the
# --height from __fzf_defaults then provides the inline fallback.
# https://github.com/junegunn/fzf/blob/4603d540c3ae648c9e2ef84f33433b275290aa7c/shell/key-bindings.zsh#L57-L60
__fzfcmd() {
	echo "fzf --popup bottom,100%,40%"
}
