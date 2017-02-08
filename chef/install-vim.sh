#!/bin/bash

# switch bash to vi mode.
BASH_MODE=$(sed -n '$p' /etc/bash.bashrc)
if [ "$BASH_MODE" != "set -o vi" ]; then
  sudo su -c "echo 'set -o vi' >> /etc/bash.bashrc"
fi

# install vim.
sudo apt-get install -y vim exuberant-ctags

# Setting default editor to vim.
sudo update-alternatives --set editor /usr/bin/vim.basic

