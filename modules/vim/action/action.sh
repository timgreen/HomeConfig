post_install() {
  echo "Installing vim plugins ..."
  vim +PlugInstall +qall &> /dev/null
  tput cuu1
  tput ed
}
