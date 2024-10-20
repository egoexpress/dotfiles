#!/usr/bin/env zsh

install_if_not_present() {
  TOOLNAME=$1
  if (( ! $+commands[${TOOLNAME}] ))
  then
    if (( $(which ${TOOLNAME} >/dev/null 2>&1) ))
    then
      install_tool ${TOOLNAME}
    fi
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
install_if_not_present ack
install_if_not_present hstr
install_if_not_present gh
install_if_not_present ghq
install_if_not_present gcc
install_if_not_present eza

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
