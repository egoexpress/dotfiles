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

ZSH_PLUGINS=${ZSH_CUSTOM}/plugins
ZSH_THEMES=${ZSH_CUSTOM}/themes

mkdir -p ${ZSH_PLUGINS} ${ZSH_THEMES}

# install zsh plugins
if [ ! -d ${ZSH_PLUGINS}/k ]
then
  git clone https://github.com/supercrabtree/k ${ZSH_PLUGINS}/k
fi

if [ ! -d ${ZSH_PLUGINS}/zsh-completions ]
then
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_PLUGINS}/zsh-completions
fi


if [ ! -d ${ZSH_THEMES}/powerlevel10k ]
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_THEMES}/powerlevel10k
fi
