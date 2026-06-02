#!/bin/bash
# ============================================================
#  Author: chusiang / chusiang.lai (at) gmail.com
#  Blog: https://note.drx.tw
#  Filename: install-jupyter.sh
#  Modified: 2026-05-20 00:29
#  Description:
#  Reference:
#
#   1. Jupyter (aka IPython Notebook) Vagrantfile
#    - https://gist.github.com/davemkirk/90140b1edde8d18c8b83
#
# ===========================================================


sudo apt purge -y \
  python3-jsonschema

sudo apt-get install -y \
  python-dev-is-python3

sudo apt-get install -y \
  python3-pip

# Jupyter notebook
sudo pip install --upgrade --break-system-packages \
  notebook

