#!/usr/bin/zsh

# TODO: check if curl is installed

# make sure zsh is installed
which zsh &>/dev/null || apt-get -y install zsh

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  rm ~/.zshrc.pre-oh-my-zsh
}

