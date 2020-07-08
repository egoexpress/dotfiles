[[ -z "${PATH// }" ]] || EXTPATH="${PATH}"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
[[ -z "${EXTPATH// }" ]] || {
  export PATH="${EXTPATH}:${PATH}"
  unset EXTPATH
}

[ -d /snap/bin ] && export PATH="/snap/bin:$PATH"
[ -d $HOME/bin ] && export PATH="$HOME/bin:$PATH"
[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"
