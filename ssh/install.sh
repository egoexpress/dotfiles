#!/usr/bin/env zsh

if (( ! $+commands[keychain] ))
then
  install_tool keychain
fi
