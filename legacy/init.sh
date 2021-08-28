#!/bin/bash

# The script to init cli env.

PATH=~/.local/bin:$PATH

sudo apt install -y git tmux zip jq python-pip
which yq || pip install yq

mkdir -p ~/workspace
cd ~/workspace

[ -d HomeConfig ] || git clone https://github.com/timgreen/HomeConfig.git

mkdir -p ~/.hcm
[ -f ~/.hcm/hcm.yml ] || ln -s ~/workspace/HomeConfig/cli.yml ~/.hcm/hcm.yml

cd HomeConfig
git pull
./sync.sh
