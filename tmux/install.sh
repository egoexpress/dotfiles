#!/usr/bin/env zsh

if [ ! -d ~/.tmux ]
then
  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
fi

if (( ! $+commands[tmuxinator] ))
then
  if [ "$OS" = "redhat" ]
  then
    gem install --user-install tmuxinator
  elif [ "$OS" != "freebsd" ]
  then
    install_tool tmuxinator
  fi
fi

if [ ! -d ~/.tmux-plugins ]; then
  mkdir ~/.tmux-plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux-plugins/tpm
  git clone https://github.com/egel/tmux-gruvbox.git ~/.tmux-plugins/tmux-gruvbox
  ln -s ~/.tmux-plugins ~/.tmux/plugins
fi
