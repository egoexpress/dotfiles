#!/usr/bin/env zsh

if (( ! $+commands[hub] ))
then
  if [ "$OS" != "freebsd" ]; then
    brew install hub 
  fi
fi

if (( ! $+commands[delta] ))
then
  install_tool git-delta
fi
