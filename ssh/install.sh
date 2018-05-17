#!/usr/bin/env zsh

if (( ! $+commands[keychain] ))
then
  install_tool keychain
fi

if [ "$OS" = "redhat" ]
then
  # TODO: submit patch to homebrew-core to allow
  # OpenSSH to be built without Kerberos5
  IS_INSTALLED=$(brew list | grep openssh)
  if [ $? -ne 0 ];
  then
    brew install openssh
  fi
fi
