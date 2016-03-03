#!/bin/bash

# switch apt mirror.
sudo su -c "sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list"
sudo apt-get update

# install other package.
sudo apt-get install -y aptitude git tmux make less w3m mosh

