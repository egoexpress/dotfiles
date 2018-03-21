[ -d ~/.local/brew ] && {
  export PATH="$HOME/.local/brew/bin:$PATH"
  export MANPATH=":$HOME/.local/brew/share/man:$MANPATH"
  export INFOPATH="$HOME/.local/brew/share/info:$INFOPATH"
  export HOMEBREW_NO_ANALYTICS=1
}
