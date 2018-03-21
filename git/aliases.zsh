# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

alias gdf="git difftool -t opendiff -y"

git-update-submodules() {
  cd $HOME

  for SUBMODULE in `git submodule status | awk '{print $2, "\n"}'`; do
    SUBMODULE=`echo $SUBMODULE | sed "s/ //g"`
    echo -n "Checking submodule ${SUBMODULE} ..."
    git submodule status ${SUBMODULE} | grep "(" &>/dev/null
    
    if test $? -ne 0; then
      rm -rf ${SUBMODULE}
      echo "initializing."
      git submodule update --init ${SUBMODULE}
    else
      git submodule update ${SUBMODULE}
      echo ""
    fi
  done

  git submodule update --recursive
  cd - &>/dev/null
}

# git add origin
git-add-origin () {
  [ "$1" ] || {
    echo "Missing remote origin URL"
    return 1
  }
  echo "> git init"
  [ -d .git ] || git init
  echo "> git remote add origin"
  git remote add origin "$1"
  echo "> git push origin master"
  git push origin master
}

# git merge master
git-merge-master () {
  [ -d .git ] && {
    echo "> git fetch upstream"
    git fetch upstream
    echo "> git merge upstream/master"
    git merge upstream/master
  } || {
    echo "No .git subdir in this directory"
  }

  # refresh all git submodules
  alias gsref="git submodule foreach git pull origin master"
}

git-shrink-repo () {
  git reflog expire --all --expire=now
  git gc --aggressive --prune=now
}

alias gbv='git branch -vv'
alias gll='glo | head -10; true'
