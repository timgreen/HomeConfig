#!/bin/bash

cd $HOME

# install hcm
wget -q --no-check-certificate --continue https://github.com/timgreen/hcm/archive/v1.zip
rm -fr ./hcm-1
unzip -qq v1.zip
HCM=./hcm-1/hcm

# link hcm.yml
mkdir -p ~/.hcm
ln -sf /source/hcm.yml ~/.hcm/hcm.yml

# hcm sync
$HCM sync -f
