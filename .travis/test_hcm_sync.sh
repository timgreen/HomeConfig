#!/bin/bash

set -x

cd $HOME
ls -al

# install hcm
wget --no-check-certificate https://github.com/timgreen/hcm/archive/v1.zip
unzip v1.zip
HCM=./hcm-1/hcm

# link hcm.yml
mkdir -p ~/.hcm
ln -s /source/hcm.yml ~/.hcm/hcm.yml

# hcm sync
$HCM sync -f
