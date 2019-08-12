#!/usr/bin/env bash

[ -r /etc/debian_version ] && {
  # install python3 docker module for glances
  dpkg -l | grep python3-docker >/dev/null 2>&1
  [ $? -eq 0 ] || sudo apt install python3-docker
}
