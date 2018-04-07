#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

apt-get update

dpkg --add-architecture armhf
apt-get update && apt-get upgrade -y
apt-get install crossbuild-essential-armhf bc git -y
