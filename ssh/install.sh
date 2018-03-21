#!/usr/bin/zsh

if (( ! $+commands[keychain] ))
then
  sudo apt-get install -yq keychain
fi
