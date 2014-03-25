#!/bin/bash

source "$(dirname "$0")/../../util.sh"

post_install() {
  GRADLE_BASE="$HOME/dev/gradle/"
  [ -x "$SCALA_BASE/current/bin/gradle" ] || {
    mkdir -p "$GRADLE_BASE"
    cd "$GRADLE_BASE"
    GRADLE_VERSION=gradle-1.11
    aria2c http://services.gradle.org/distributions/${GRADLE_VERSION}-bin.zip
    unzip ${GRADLE_VERSION}-bin.zip
    rm -f current
    ln -s $GRADLE_VERSION current
  }
}

check() {
  require "Only for gradle is not installed" \
    'if type -p gradle > /dev/null; then false; else true; fi'
}

action_main "$@"
