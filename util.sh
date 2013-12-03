# Util for action script

action_main() {
  cmd="$1"
  case "$cmd" in 
    post-install)
      if type post_install &> /dev/null; then
        post_install
      fi
    ;;
    pre-install)
      if type pre_install &> /dev/null; then
        pre_install
      fi
    ;;
    post-uninstall)
      if type post_uninstall &> /dev/null; then
        post_uninstall
      fi
    ;;
    pre-uninstall)
      if type pre_uninstall &> /dev/null; then
        pre_uninstall
      fi
    ;;
  esac
}
