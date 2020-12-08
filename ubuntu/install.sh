#!/bin/bash

_DIST="$(lsb_release -is)"

[ "$_DIST" = "Ubuntu" ] && {
  if ! $(find /etc/apt/sources.list.d -name "neovim-ppa*" | grep -q "."); then
    sudo add-apt-repository -yu ppa:neovim-ppa/unstable
    sudo apt-get install -y neovim
  fi
}

unset _DIST
