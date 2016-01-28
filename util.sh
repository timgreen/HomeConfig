# Util for action script

action_main() {
  dir=$(dirname "$0")
  cmd="$1"
  case "$cmd" in
    check)
      if [[ $(type -t check) == "function" ]]; then
        check "$dir"
      fi
    ;;
    post-install)
      if [[ $(type -t post_install) == "function" ]]; then
        post_install "$dir"
      fi
    ;;
    pre-install)
      if [[ $(type -t pre_install) == "function" ]]; then
        pre_install "$dir"
      fi
    ;;
    post-uninstall)
      if [[ $(type -t post_uninstall) == "function" ]]; then
        post_uninstall "$dir"
      fi
    ;;
    pre-uninstall)
      if [[ $(type -t pre_uninstall) == "function" ]]; then
        pre_uninstall "$dir"
      fi
    ;;
  esac
}

require() {
  msg="$1"
  shift
  eval "$@ &> /dev/null" || {
    echo "$msg"
    exit 1
  }
}

get_version() {
  name="version"
  dir=$(dirname "$0")
  config_file="$dir/action_config.json"

  [ -r "$config_file" ] || {
    echo "Config file not exists: $config_file"
    exit 1
  }

  type -p jq > /dev/null || {
    echo "Install `jq` before continue."
    exit 1
  }

  jq -r .version "$config_file"
}
