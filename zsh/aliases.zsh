# Aliases
alias ..='cd ..'
alias cls='clear; ls -lah'
alias cp="cp -iv"
alias e="vim"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"
alias la="ls -la"
alias ls="ls -GFh"
alias m="make "
alias mv="mv -iv"
alias ngrep="grep --line-number --color"
alias pubip="curl icanhazip.com"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy"
alias reload="source ~/.zshrc"
alias rf="rm -rf"
alias rm="rm -iv"
alias rmds="find . -name \".DS_Store\" | xargs rm"
alias sudo="sudo "
alias v="vim"
alias week="date +%V"

# Git aliases
alias gl="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gd="git diff"
alias gst="git status"
alias gs="git status -sb"
alias gpt="git push --tags"
alias gp="git push"
alias gba="git branch -a"
alias gfp="git fetch origin --prune"
alias gr='cd "$(git rev-parse --show-toplevel)"'
