#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  SCALA_BASE="$HOME/dev/scala/"
  SCALA_VERSION=$(get version)
  SCALA_DOWNLOAD_LINK="http://www.scala-lang.org/files/archive/$SCALA_VERSION.tgz"
  SCALA_DOWNLOAD_PATH="${SCALA_BASE}/$SCALA_VERSION.tgz"

  [ -x "$SCALA_BASE/current/bin/scala" ] && [ -r "$SCALA_DOWNLOAD_PATH" ] || {
    mkdir -p "$SCALA_BASE"
    cd "$SCALA_BASE"
    aria2c "$SCALA_DOWNLOAD_LINK"
    tar xf "$SCALA_DOWNLOAD_PATH"
    rm -f current
    ln -s $SCALA_VERSION current
  }
}

action_main "$@"
