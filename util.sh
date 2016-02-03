# Util for action script

action_dir() {
  readlink -f $(dirname "$0")/..
}

module_dir() {
  readlink -f $(action_dir)/..
}


action_main() {
  dir=$(module_dir)
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

get() {
  name="$1"
  config_file="$(action_dir)/config.json"

  [ -r "$config_file" ] || {
    echo "Config file not exists: $config_file"
    exit 1
  }

  type -p jq > /dev/null || {
    echo "Install `jq` before continue."
    exit 1
  }

  jq -r ."$name" "$config_file"
}

# http://stackoverflow.com/questions/4023830/bash-how-compare-two-strings-in-version-format
verlte() {
	[  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
}

verlt() {
	[ "$1" = "$2" ] && return 1 || verlte $1 $2
}

path_for_version() {
  path_tpl="$1"
  version="$2"

  count=$(echo "$path_tpl" | grep -o "%s" | wc -l)
  printf "$path_tpl" $(yes $version | head -n $count)
}
