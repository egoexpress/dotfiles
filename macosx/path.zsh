[ `uname` = "Darwin" ] && {
  [ -d /usr/local/sbin ] && PATH=$PATH:/usr/local/sbin
  [ -d /opt/local/bin ] && PATH=$PATH:/opt/local/bin
  [ -d /Library/Frameworks/Python.framework/Versions/3.2/bin ] && PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.2/bin
  [ -d $HOME/.gem/ruby/1.8/bin ] && PATH=$PATH:$HOME/.gem/ruby/1.8/bin
  export PATH
}
