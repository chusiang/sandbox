#!/bin/bash

# switch apt mirror.

## Ubuntu.
sudo su -c "sed -i 's/us.archive.ubuntu.com/mirror.twds.com.tw/g' /etc/apt/sources.list.d/ubuntu.sources"

## Debian.
sudo su -c "sed -i 's/httpredir.debian.org/mirror.twds.com.tw/g' /etc/apt/sources.list"

sudo apt-get update

# install other package.
sudo apt-get install -y \
  ack-grep \
  aptitude \
  git \
  less \
  make \
  mosh \
  tmux \
  w3m

