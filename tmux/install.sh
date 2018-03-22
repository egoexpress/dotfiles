#!/usr/bin/env zsh

if (( ! $+commands[tmuxinator] ))
then
  sudo apt-get -yqq install tmuxinator
fi
