#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "$0")")"

sh $BASE_DIR/cli_tools/hcm/install_hcm.sh
~/.hcm/repo/hcm sync -f
