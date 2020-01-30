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

mkdir -p ~/.zsh-custom/plugins

# install zsh plugins
if [ ! -d ~/.zsh-custom/plugins/k ]
then
  git clone https://github.com/supercrabtree/k ~/.zsh-custom/plugins/k
fi


if [ ! -d ~/.zsh-custom/themes/powerlevel10k ]
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi
