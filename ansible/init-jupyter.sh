#!/bin/bash
# ============================================================
#  Author: chusiang / chusiang.lai (at) gmail.com
#  Blog: http://note.drx.tw
#  Filename: install-jupyter.sh
#  Modified: 2016-03-06 19:06
#  Description: 
#  Reference: 
#
#   1. Jupyter (aka IPython Notebook) Vagrantfile
#    - https://gist.github.com/davemkirk/90140b1edde8d18c8b83
#
# =========================================================== 

# Jupyter
sudo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo pip install --upgrade ipython[all]

# for support '-k, --ask-pass' option.
sudo apt-get install -y sshpass

