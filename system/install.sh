#!/usr/bin/env zsh

if (( ! $+commands[autojump] ))
then
  install_tool autojump
fi

if (( ! $+commands[grc] ))
then
  install_tool grc
fi
