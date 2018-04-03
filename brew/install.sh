#!/usr/bin/env zsh

if (( ! $+commands[brew] ))
then
  if [ "$OS" = "redhat" ]
  then
     # sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
     # see https://github.com/Linuxbrew/brew/wiki/CentOS6
     git clone --depth 1 https://github.com/Linuxbrew/brew.git ~/.linuxbrew
     HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_BUILD_FROM_SOURCE=1 brew install gcc --without-glibc
     ln -s ~/.linuxbrew/Cellar/gcc/5.5.0_3/lib/gcc/x86_64-unknown-linux-gnu/5.5.0 ~/.linuxbrew/Cellar/gcc/5.5.0_3/lib/gcc/x86_64-unknown-linux-gnu/5.5.0_3
     brew install glibc
  elif [ "$OS" = "debian" ]
  then
    install_tool linuxbrew-wrapper
    brew bundle
  fi
fi

if [ "$1" != "bootstrap" ]
then
  brew bundle --file=$HOME/.dotfiles/brew/Brewfile
fi
