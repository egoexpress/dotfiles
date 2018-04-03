#!/usr/bin/env zsh

if (( ! $+commands[docker-compose] ))
then
  if (( ! $+commands[docker] ))
  then
    install_tool docker-compose
  fi
fi
