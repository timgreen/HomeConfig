post_install() {
  git config --global --get include.path \.gitconfig_common &> /dev/null || {
    git config --global --add include.path .gitconfig_common
  }
  git config --global --get include.path \.gitconfig_fzf &> /dev/null || {
    git config --global --add include.path .gitconfig_fzf
  }
}
