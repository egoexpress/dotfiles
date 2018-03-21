#!/usr/bin/env zsh

if (( ! $+commands[brew] ))
then
  sudo apt-get install -yqq linuxbrew-wrapper
  brew bundle
fi

if [ "$1" != "bootstrap" ]
then
  brew bundle --file=$HOME/.dotfiles/brew/Brewfile
fi
