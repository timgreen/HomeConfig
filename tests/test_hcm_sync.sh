#!/bin/bash

cd $HOME

# install hcm
wget --no-check-certificate https://github.com/timgreen/hcm/archive/v1.zip
unzip v1.zip

# link hcm.yml
mkdir -p ~/.hcm
ln -s /source/hcm.yml ~/.hcm/hcm.yml

# hcm sync
./hcm-1/hcm sync -f
