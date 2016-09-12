#!/bin/bash

# switch apt mirror.
## Ubuntu.
sudo su -c "sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list"
## Debian.
sudo su -c "sed -i 's/httpredir.debian.org/opensource.nchc.org.tw/g' /etc/apt/sources.list"
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

