# Set path env
typeset -U path
path=(/usr/local/bin /usr/local/sbin $path[@])

# Set env
export EDITOR="nvim"
export LC_ALL="en_US.UTF-8"
export TERM="screen-256color"

# Enable vim keys
bindkey -v

# Enable auto-cd
setopt AUTO_CD

# Enable use of pushd and popd
setopt autopushd
setopt pushdsilent
setopt pushdignoredups
setopt pushdtohome

# Enable command completion
autoload -U compinit && compinit -i

# Enable prompt system
autoload -U promptinit && promptinit

# Enable globbing
setopt extended_glob

# Autocompletion with arrow-key driven interface
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# Autocompletion of command line switches for aliases
setopt completealiases

# Preventing duplicate lines in history
setopt HIST_IGNORE_DUPS

# Keep background jobs running
setopt NO_HUP

#
# Aliases
#

alias ..='cd ..'
alias cls='clear; ls -lah'
alias cp="cp -iv"
alias e="vim"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"
alias j="jobs"
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
alias gl="git l"
alias gd="git diff"
alias gst="git status"
alias gs="git status -sb"
alias gpt="git push --tags"
alias gp="git push"
alias gba="git branch -a"
alias gfp="git fetch origin --prune"
alias gr='cd "$(git rev-parse --show-toplevel)"'

# Create folder and cd into it
take () {
  mkdir -p $1 && cd $1
}
