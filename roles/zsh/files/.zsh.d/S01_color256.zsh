## 256 Colors Term
if [[ -n $COLORTERM ]]; then
  case $TERM in
    xterm)
    export TERM="xterm-256color"
    ;;
    screen)
    export TERM="screen-256color"
    ;;
    *)
    ;;
  esac
fi

