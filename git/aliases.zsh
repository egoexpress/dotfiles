# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
if (( $+commands[hub] ))
then
  hub_path=$(which hub)
  if $(hub --version &>/dev/null) ; then
    alias git=$hub_path
  fi
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
unalias gd >/dev/null 2>&1
gd() {
  git diff --color $* | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r
}

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

git-show-pending-pushes() {
  TARGET_DIR=.
  [ -z $1 ] || TARGET_DIR=$1

  BRANCH=$(git branch --show-current)
  REMOTE=$(git remote show)
  if [ ! -z ${REMOTE} ]; then
    CHANGES=$(git log origin/${BRANCH}..${BRANCH} | wc -l )
    if [ ${CHANGES} -gt 0 ]; then
      print -P " %F{42}>%f $TARGET_DIR"
    fi
  else
    print -P " %F{65}@%f $TARGET_DIR"
  fi
}

git-find-dirty-repos () {

  TARGET_DIR=.
  [ -z $1 ] || TARGET_DIR=$1

	for SUBDIR in $(find ${TARGET_DIR} -maxdepth 1 ! -path ${TARGET_DIR} -type d); do
		cd $SUBDIR
    DISPLAYDIR=$(echo $SUBDIR | sed "s|${HOME}|~|g")
		if [[ -d .git ]]; then
			if ! [[ -z $(git status -s) ]]; then
				print -P " %F{red}M%f $DISPLAYDIR"
			fi
      git-show-pending-pushes $SUBDIR
    else
			print -P " %F{32}?%f $DISPLAYDIR"
		fi
		cd - >/dev/null
	done
}

git-push-repos () {
	for SUBDIR in $(find . -maxdepth 1 ! -path . -type d); do
		cd $SUBDIR
		if [[ -d .git ]]; then
      echo -n "Trying to push $(basename $SUBDIR)... "
			if ! [[ -z $(git remote -v) ]]; then
			  git push >/dev/null 2>&1
        if [[ $? -eq 0 ]]; then
          echo "done"
        else
          echo "failed"
        fi
      else
        echo "no remote!"
      fi
		fi
		cd - >/dev/null
	done
}
