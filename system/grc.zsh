# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] ))
then
  [ -r /etc/grc.zsh ] && source /etc/grc.zsh
  [ -r ~/.linuxbrew/etc/grc.zsh ] && source ~/.linuxbrew/etc/grc.zsh
  if [ "${OS}" != "freebsd" ]; then
    alias ls="grc --colour=auto ls --color"
  else
    export CLICOLOR=1
    alias ls="ls -G"
  fi
fi
