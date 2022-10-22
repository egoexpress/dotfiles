# generic aliases for zsh environment

alias psgrep='ps wwaux | grep -v grep | grep -i --color'

# global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g SL='| sort | less'
alias -g S='| sort'
alias -g T='| tail'
alias -g C='| cat'

# perform speedtest
alias speedtest="wget -q --no-check-certificate -O - https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python"

# scan subnet
# e.g.: snscan 192.168.42.0/24
alias snscan="nmap -n -sP"

alias sha1='openssl dgst -sha1'
alias md5='openssl dgst -md5'

alias ntp='sudo ntpdate 0.europe.pool.ntp.org'

# display IPv4 addresses of all interfaces
alias ip4='ip -f inet addr show | grep -v valid_lft'
# display IPv6 addresses and lifetime of addresses on all interfaces
alias ip6='ip -f inet6 addr show'

# use bat instead of cat
if (( $+commands[bat] ))
then
  alias cat='bat'
fi
