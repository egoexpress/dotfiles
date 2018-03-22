#!/usr/bin/env zsh

if (( ! $+commands[tmuxinator] ))
then
  sudo apt-get -yqq install tmuxinator
fi

if [ ! -d ~/.tmux-plugins ]; then
  mkdir ~/.tmux-plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux-plugins/tpm
  ln -s ~/.tmux-plugins ~/.tmux/plugins
fi
