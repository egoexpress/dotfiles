#!/usr/bin/env zsh

if (( ! $+commands[hub] ))
then
  if [ "$OS" != "freebsd" ]; then
    brew install hub 
  fi
fi

install_tool git-delta
