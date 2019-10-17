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

if (( ! $+commands[gpg] ))
then
  # needed for 'docker login' to work properly
  # see https://stackoverflow.com/a/52881198
  install_tool gnupg2
  install_tool pass
fi

if (( ! $+commands[peco] ))
then
  install_tool peco
fi
