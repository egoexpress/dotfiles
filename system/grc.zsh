# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] ))
then
  [ -r /etc/grc.zsh ] && source /etc/grc.zsh
  [ -r ~/.linuxbrew/etc/grc.zsh ] && source ~/.linuxbrew/etc/grc.zsh
  alias ls="grc --colour=auto ls --color"
fi
