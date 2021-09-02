## get the keysequences like this:
## use quoted-insert (control-V) and press the key combination.

## Emacs风格 键绑定
bindkey -e
## 设置 [DEL]键 为向后删除
bindkey "\e[3~" delete-char

## 移动光标到第一下参数的前 {{{
move-to-first-param() {
  zle beginning-of-line
  zle forward-word
}
zle -N move-to-first-param
bindkey "\ea" move-to-first-param
## }}}

## 命令搜索 {{{
# Alt-p
bindkey "^[p" history-beginning-search-backward
# Alt-n
bindkey "^[n" history-beginning-search-forward
## }}}

## 光标移动 {{{
# End
bindkey "OF" end-of-line

# Alt-f
bindkey "^[f" emacs-forward-word
# Alt-b
bindkey "^[b" emacs-backward-word

big-emacs-backward-word() {
  local WORDCHARS="${WORDCHARS}./:"
  zle emacs-backward-word
}
big-emacs-forward-word() {
  local WORDCHARS="${WORDCHARS}./:"
  zle emacs-forward-word
}
zle -N big-emacs-forward-word
zle -N big-emacs-backward-word
# Ctrl-left
bindkey "[1;5D" big-emacs-backward-word
# Ctrl-right
bindkey "[1;5C" big-emacs-forward-word
## }}}

## Copy words {{{
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word
## }}}

## Undo / Redo {{{
# Alt-u
bindkey "u" undo
# Alt-r
bindkey "r" redo
## }}}

## Comment current {{{
comment-current() {
  if [[ -n $BUFFER ]]; then
    [[ $BUFFER[1] != "#" ]] && BUFFER="# $BUFFER"
    zle accept-line
  fi
}
zle -N comment-current
# Alt-#
bindkey "#" comment-current
## }}}

## Copy whole line {{{
copy-whole-line() {
  if [[ -n $BUFFER ]]; then
    echo -n "$BUFFER" | xclip
    BUFFER="# $BUFFER"
    zle accept-line
  fi
}
zle -N copy-whole-line
# Alt-y
bindkey "\ey" copy-whole-line
## }}}

## Edit command line {{{
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
## }}}
