path=("$HOME/.linuxbrew/bin" "$HOME/.linuxbrew/sbin" $path)
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"
export XDG_DATA_DIRS="/home/timgreen/.linuxbrew/share:$XDG_DATA_DIRS"
