## OS type {{{
if [[ $OSTYPE[1,6] == "darwin" ]]; then
    export IS_MACOX=true
elif [[ $OSTYPE[1,5] == "linux" ]]; then
    export IS_LINUX=true
fi
## }}}
