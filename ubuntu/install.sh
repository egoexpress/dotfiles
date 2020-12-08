#!/bin/bash

_DIST="$(lsb_release -is)"

[ "$_DIST" = "Ubuntu" ] && {
  if ! $(ls /etc/apt/sources.list.d/neovim-ppa* >/dev/null 2>&1); then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get install neovim
  fi
}

unset _DIST
