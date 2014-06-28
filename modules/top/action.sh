#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  force_htop_config "$1"
}

force_htop_config() {
  local dir="$1"
  local htop_config="$HOME/.config/htop/htoprc"

  for line in $(grep "^    " "$dir/README.md" | sed "s/^    //"); do
    key=$(echo "$line" | cut -f1 -d=)
    value=$(echo "$line" | cut -f2 -d=)

    grep "^$key=$value$" "$htop_config" > /dev/null && continue
    echo "  htoprc: $key -> $value"

    sed -i "/^$key=/d" "$htop_config"
    echo "$key=$value" >> "$htop_config"
  done
}

action_main "$@"
