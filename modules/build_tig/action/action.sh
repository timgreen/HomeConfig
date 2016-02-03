check_tig_version() {
  ! type -p tig || \
    verlt $(tig -v | awk '{print $3}') $(get version)
}

check() {
  require "tig >= $(get version) already installed" check_tig_version
}

pre_install() {
  url=$(path_for_version $(get url_tpl) $(get version))
  file=$(basename $url)
  echo "Downloading $url"
  aria2c -c "$url"
  tar xf "$file"

  # build & install tig
  echo "build & install tig $(get version)"
  buildDir=$(echo $file |sed 's/\.tar.*$//')
  cd $buildDir
  make prefix=/usr/local
  sudo make install prefix=/usr/local
}
