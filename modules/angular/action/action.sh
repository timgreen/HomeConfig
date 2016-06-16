check() {
  require 'Only when angular-cli is installed.' \
    'type -p ng'
}

pre_install() {
  mkdir -p $HOME/.zsh.d/
  cat << EOF > $HOME/.zsh.d/S45_completion_ng.zsh
# $(angular_cli_version)

$(angular_completion)
EOF
}

angular_cli_version() {
  ng version | awk '/angular-cli:/{print $2}'
}

angular_completion() {
  echo '###-begin-ng-completion###'
  ng completion | awk '{if(p>0){print;next}} /###-begin-ng-completion###/{p=1}'
}
