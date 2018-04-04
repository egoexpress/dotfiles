#!/usr/bin/env zsh

if (( ! $+commands[tmuxinator] ))
then
  if [ "$OS" = "redhat" ]
  then
    gem install --user-install tmuxinator
  else
    install_tool tmuxinator
  fi
fi

if [ ! -d ~/.tmux-plugins ]; then
  mkdir ~/.tmux-plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux-plugins/tpm
  ln -s ~/.tmux-plugins ~/.tmux/plugins
fi
