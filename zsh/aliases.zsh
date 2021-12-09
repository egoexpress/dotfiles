alias reload!='. ~/.zshrc'
alias ll='ls -lAhL'

# https://unix.stackexchange.com/questions/326911/make-and-source-default-to-zshrc/326948#326948
_accept-line() {
  if [[ $BUFFER == "." ]]; then
    BUFFER="omz reload"
  fi
  zle .accept-line
}

zle -N accept-line _accept-line
