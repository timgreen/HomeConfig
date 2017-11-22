#!/bin/bash

set -x

cd $HOME
ls -al

# install hcm
wget --no-check-certificate --continue https://github.com/timgreen/hcm/archive/v1.zip
rm -fr ./hcm-1
unzip v1.zip &> /dev/null
HCM=./hcm-1/hcm

# link hcm.yml
mkdir -p ~/.hcm
ln -sf /source/hcm.yml ~/.hcm/hcm.yml

# hcm sync
$HCM sync -f
