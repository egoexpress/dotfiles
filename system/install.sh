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
  install_tool ${GLANCES_PKGNAME}
fi

if (( ! $+commands[curl] ))
then
  install_tool curl
fi

if (( ! $+commands[ncdu] ))
then
  install_tool ncdu
fi

if (( ! $+commands[peco] ))
then
  brew install peco
fi
