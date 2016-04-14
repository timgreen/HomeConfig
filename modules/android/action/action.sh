pre_install() {
  type -p android &> /dev/null && return

  url=$(path_for_version $(get url_tpl) $(get version))
  file=$(basename $url)
  echo "Downloading $url"
  aria2c -c "$url"
  mkdir -p ~/dev/android
  tar xf "$file"
  ln -s $(readlink -f android-sdk-linux) ~/dev/android/sdk
}
