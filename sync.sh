#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "$0")")"

[ -d /home/linuxbrew ] || {
  echo "Prepare /home/linuxbrew for prebuilt binary."
  sudo mkdir /home/linuxbrew
  sudo chown $(id -un):$(id -ug) /home/linuxbrew
}

sh $BASE_DIR/cli_tools/hcm/install_hcm.sh
~/.hcm/repo/hcm sync -f
