#!/usr/bin/env bash

[ -r /etc/debian_version ] && {
  # install python3 docker module for glances
  sudo apt install python3-docker
}
