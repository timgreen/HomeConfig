disable_akonadi() {
  CONFIG=$HOME/.config/akonadi/akonadiserverrc
  grep 'StartServer=true' "$CONFIG" &> /dev/null && {
    sed -i 's/StartServer=true/StartServer=false/' "$CONFIG"
    echo 'Disable akonadi from auto start.'
  }
}

echo_imports_info() {
  cat << EOF
################################################################################
#                                                                              #
#                 Rememeber to import follow files into KDE                    #
#                                                                              #
################################################################################
EOF

  find $HOME/.kde_imports
}

post_install() {
  disable_akonadi
  echo_imports_info
}
