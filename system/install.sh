#!/usr/bin/env zsh

install_if_not_present() {
  TOOLNAME=$1
  if (( ! $+commands[${TOOLNAME}] ))
  then
    install_tool ${TOOLNAME}
  fi
  unset TOOLNAME
}

install_if_not_present autojump
install_if_not_present grc
install_if_not_present curl
install_if_not_present ncdu
install_if_not_present peco
install_if_not_present bat
install_if_not_present vifm
install_if_not_present broot

if (( ! $+commands[glances] ))
then
  install_tool ${GLANCES_PKGNAME}
fi

if (( ! $+commands[gpg] ))
then
  # needed for 'docker login' to work properly
  # see https://stackoverflow.com/a/52881198
  install_tool gnupg2
  install_tool pass
fi
