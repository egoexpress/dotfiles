#!/usr/bin/env zsh

if (( ! $+commands[autojump] ))
then
  install_tool autojump
fi

if (( ! $+commands[grc] ))
then
  install_tool grc
fi

if (( ! $+commands[glances] ))
then
  install_tool glances
fi

if (( ! $+commands[dtrx] ))
then
  install_tool dtrx
fi
