#!/bin/bash

set -e

[[ -d wallaby-linux ]] || git clone https://github.com/F-WuTS/wallaby-linux.git --depth=1

cd wallaby-linux

# Remove .git folder to prevent dirty kernel names
[[ -d build ]] || rm -rf .git

KCFLAGS="-fno-pie -fno-pic" KBUILD_DEBARCH=armhf make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- deb-pkg -j8
