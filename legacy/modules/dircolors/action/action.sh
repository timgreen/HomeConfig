target="$HOME/.dircolors-solarized"

pre_install() {
  [ -d "$target" ] || git clone https://github.com/seebi/dircolors-solarized.git "$target"
}

post_uninstall() {
  rm -fr "$target"
}
