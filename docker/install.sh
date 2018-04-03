#!/usr/bin/env zsh

if (( ! $+commands[docker-compose] ))
then
  install_tool docker-compose
fi
