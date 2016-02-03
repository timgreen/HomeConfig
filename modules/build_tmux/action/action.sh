check_tmux_version() {
  ! type -p tmux || \
    verlt $(tmux -V | awk '{print $2}') $(get version)
}

check() {
  require "tmux >= $(get version) already installed" check_tmux_version
}

pre_install() {
  url=$(path_for_version $(get url_tpl) $(get version))
  file=$(basename $url)
  echo "Downloading $url"
  aria2c -c "$url"
  tar xf "$file"

  # build & install tmux
  echo "build & install tmux $(get version)"
  buildDir=$(echo $file |sed 's/\.tar.*$//')
  cd $buildDir
  ./configure && make
  sudo make install
}
