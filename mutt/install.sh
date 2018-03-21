#!/usr/bin/zsh

if (( ! $+commands[mutt] ))
then
  sudo apt-get install -yqq mutt
fi
