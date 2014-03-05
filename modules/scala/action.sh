#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  SCALA_BASE="$HOME/dev/scala/"
  [ -x "$SCALA_BASE/current/bin/scala" ] || {
    mkdir -p "$SCALA_BASE"
    cd "$SCALA_BASE"
    SCALA_VERSION=scala-2.10.3
    aria2c http://www.scala-lang.org/files/archive/$SCALA_VERSION.tgz
    tar xf $SCALA_VERSION.tgz
    rm -f current
    ln -s $SCALA_VERSION current
  }
}

action_main "$@"
