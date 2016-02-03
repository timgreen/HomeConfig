post_install() {
  force_htop_config
}

force_htop_config() {
  local dir="$(module_dir)"
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
