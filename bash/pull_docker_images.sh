#!/bin/bash
# ============================================================
#  Author: chusiang / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: pull_docker_images.sh
#  Modified: 2025-08-22 17:30
#  Description: Batch pull docker images from text file.

for IMAGE in $(cat docker_images.txt); do
  echo "==> ${IMAGE} .."
  docker pull ${IMAGE}
  echo
done
