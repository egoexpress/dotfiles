#!/usr/bin/env zsh

if (( ! $+commands[mutt] ))
then
  install_tool mutt
fi
