pre_install() {
  [ -r fonts-master.zip ] || aria2c -c https://github.com/powerline/fonts/archive/master.zip
  [ -d fonts-master ] || unzip fonts-master.zip
  ls ~/.local/share/fonts/ | grep -i powerline > /dev/null || {
    cd fonts-master
    sh ./install.sh
  }
}
