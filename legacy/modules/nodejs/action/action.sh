NPM_COMPLETION_PATH="$HOME/.zsh.comp.d/_npm"
NPM="$HOME/dev/nodejs/bin/npm"

pre_install() {
  NODE_BASE="$HOME/dev/node"
  NODE_VERSION="$(get version)"
  NODE_DOWNLOAD_LINK="https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz"
  NODE_DOWNLOAD_NAME="node-${NODE_VERSION}-linux-x64.tar.gz"
  NODE_DOWNLOAD_PATH="${NODE_BASE}/${NODE_DOWNLOAD_NAME}"

  [ -x "$NODE_BASE/current/bin/node" ] && [ -r "$NODE_DOWNLOAD_PATH" ] || {
    mkdir -p "$NODE_BASE"
    cd "$NODE_BASE"
    aria2c "$NODE_DOWNLOAD_LINK"
    tar xf "$NODE_DOWNLOAD_PATH"
    rm -f current
    ln -s ${NODE_DOWNLOAD_NAME%.tar.gz} current
  }
}

post_install() {
  if [ -x "$NPM" ] && [ ! -e "$NPM_COMPLETION_PATH" ]; then
    mkdir -p "$(dirname "$NPM_COMPLETION_PATH")"
    $NPM completion > "$NPM_COMPLETION_PATH"
  fi
}

pre_uninstall() {
  [ -e "$NPM_COMPLETION_PATH" ] && {
    rm -f "$NPM_COMPLETION_PATH"
    rmdir $(dirname "$NPM_COMPLETION_PATH")
  }
}
