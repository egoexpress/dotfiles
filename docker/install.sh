#!/usr/bin/env zsh

if (( ! $+commands[docker-compose] ))
then
  sudo apt-get install -yqq docker-compose
fi
