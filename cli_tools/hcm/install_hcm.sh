#!/bin/bash

main() {
  [ -d ~/.hcm/repo ] && return

  mkdir -p ~/.hcm/
  git clone -b v1 https://github.com/timgreen/hcm ~/.hcm/repo
}

main
