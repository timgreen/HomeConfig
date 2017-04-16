check_arch() {
  cat /etc/*-release | grep 'NAME="Arch Linux"'
}

check() {
  require "Only for Arch Linux" check_arch
  require "Need aria2c installed" \
    'type -p aria2c'
  require "Need jq installed" \
    'type -p jq'
}
