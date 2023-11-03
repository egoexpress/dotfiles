alias reload!='. ~/.zshrc'

# https://unix.stackexchange.com/questions/326911/make-and-source-default-to-zshrc/326948#326948
_accept-line() {
  if [[ $BUFFER == "." ]]; then
    BUFFER="omz reload"
  fi
  zle .accept-line
}

zle -N accept-line _accept-line

if (( $+commands[eza] ))
then
  alias ls="eza"
  alias lss="eza -alh --icons --git-ignore"
  alias ll='ls -lAh'
else
  alias ll='ls -lAhL'
fi
