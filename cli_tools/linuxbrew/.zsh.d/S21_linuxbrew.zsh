export LINUXBREW_HOME='/home/linuxbrew/.linuxbrew'
path=("$LINUXBREW_HOME/bin" "$LINUXBREW_HOME/sbin" $path)
fpath+="$LINUXBREW_HOME/share/zsh/site-functions"
export MANPATH="$LINUXBREW_HOME/share/man:$MANPATH"
export INFOPATH="$LINUXBREW_HOME/share/info:$INFOPATH"
export XDG_DATA_DIRS="$LINUXBREW_HOME/share:$XDG_DATA_DIRS"
