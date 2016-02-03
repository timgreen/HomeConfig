post_install() {
  [ -x ~/bin/g8 ] || {
    curl -L https://raw.github.com/n8han/conscript/master/setup.sh | sh
    ~/bin/cs n8han/giter8
  }
}

pre_uninstall() {
  rm -f ~/bin/cs
  rm -f ~/bin/g8
}
