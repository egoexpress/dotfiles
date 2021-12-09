# load fzf completions and key bindings

[ -d /usr/share/doc/fzf ] && FZF_DIR="/usr/share/doc/fzf/examples"
[ -d $HOME/.linuxbrew/opt/fzf/shell ] && FZF_DIR="$HOME/.linuxbrew/opt/fzf/shell"
[ -d /usr/local/share/examples/fzf/shell ] && FZF_DIR="/usr/local/share/examples/fzf/shell"

# [ -v FZF_DIR ] && {
#  source ${FZF_DIR}/key-bindings.zsh
#  source ${FZF_DIR}/completion.zsh
#  unset FZF_DIR
# }
