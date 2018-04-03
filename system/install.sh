#!/usr/bin/env zsh

if (( ! $+commands[autojump] ))
then
  install_tool autojump
fi
