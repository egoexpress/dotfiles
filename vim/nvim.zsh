# nvim-specific settings

# add vim alias if nvim installed but vim isn't
which nvim &>/dev/null
[ $? -eq 0 ] && {
  which vim &>/dev/null
  [ $? -eq 1 ] && {
    alias vim=nvim
    export GIT_EDITOR=nvim
  }
}
