[ `uname` = "Darwin" ] && {
  alias top="top -o CPU"
  alias update="cd; git pull -q; brew update; brew upgrade; brew linkapps; brew cleanup; cd - >/dev/null"
  hash -d dl=$HOME/Downloads
  hash -d dev=$HOME/Development
  hash -d doc=$HOME/Documents

  alias o='open'

  lftp () {
    cd /Users/wonder/Downloads
    /usr/local/bin/lftp $*
    cd - >/dev/null
  } 

  # use vim from homebrew
  alias vi=vim
}
