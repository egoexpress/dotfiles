# enable autojump (https://github.com/wting/autojump)
[ -r /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
[ -r ~/.linuxbrew/share/autojump/autojump.zsh ] && . ~/.linuxbrew/share/autojump/autojump.zsh

# handle local autojump (as brew installation is broken for Linux)
[ -r ~/.local/bin/autojump.zsh ] && . ~/.local/bin/autojump.zsh
