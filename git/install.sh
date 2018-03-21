#!/usr/bin/env zsh

if (( ! $+commands[hub] ))
then
  brew install hub 
fi
