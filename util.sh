# Util for action script

action_main() {
  cmd="$1"
  case "$cmd" in 
    post-install)
      post_install
    ;;
  esac
}
