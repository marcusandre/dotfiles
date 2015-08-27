# Navigation
alias ..="cd .."

# Directory Listings
if [ $(uname -s) == "Linux" ]; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi

alias ls="ls -GFh"
alias la="ls -la"
alias lh="ls -lah"
alias ls1="ls -1"

# Misc
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias rf="rm -rf"
alias sudo="sudo "
alias week="date +%V"
alias m="make "
alias v="vim"
alias s="subl ."
alias cdot="cd ~/.dotfiles"
alias ngrep="grep --line-number --color"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to clipboard.\n'"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"
alias myip="curl icanhazip.com"
alias rmds="find . -name \".DS_Store\" | xargs rm"
alias pull="curl -L#"
alias godeps="go get ./..."
alias listening="lsof -Pan -iTCP -sTCP:listen"

# Git aliases
if hash git 2>/dev/null; then
  alias gl="git log --pretty=oneline --abbrev-commit --graph --decorate"
  alias gd="git diff"
  alias ga="git add"
  alias gst="git status"
  alias gs="git status -sb"
  alias gca="git commit -a"
  alias gcm="git checkout master"
  alias gm="git merge --no-ff"
  alias gpt="git push --tags"
  alias gp="git push"
  alias gpa="git push --all"
  alias gu="git checkout -- ."
  alias grh="git reset --hard"
  alias gco="git checkout"
  alias gba="git branch -a"
  alias gfp="git fetch origin --prune"
  alias gr='cd "$(git rev-parse --show-toplevel)"'
fi

# Vagrant aliases
if hash vagrant 2>/dev/null; then
  alias vup="vagrant up"
  alias vha="vagrant halt"
  alias vst="vagrant status"
  alias vdf="vagrant destroy -f; rm -rf .vagrant"
fi

# cd into new directory
function take {
  mkdir -p "$@" && cd "$_";
}

# create .tgz
function pack {
  tar -czf $1.tgz $1
}

# serve tree via http
function serve {
  local port=${1-3000};
  php -S 0.0.0.0:${port}
}
