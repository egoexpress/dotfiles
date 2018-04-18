#!/usr/bin/env zsh

# TODO: check if curl is installed

# make sure zsh is installed
if (( ! $+commands[zsh] ))
then
  install_tool zsh
fi

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  rm -f ~/.zshrc.pre-oh-my-zsh
fi
