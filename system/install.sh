#!/usr/bin/zsh

if (( ! $+commands[autojump] ))
then
  sudo apt-get install -y autojump
fi
