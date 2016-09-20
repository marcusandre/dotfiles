
#
# Environment
#

export CLICOLOR=1
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"
export NVM_DIR="$HOME/.nvm"
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/go

#
# PATH
#

typeset -U path
path=(/usr/local/bin /usr/local/sbin $GOROOT/bin $GOPATH/bin $path[@])
fpath=(/usr/local/share/zsh-completions $fpath)

#
# Zsh Setup
#

# Enable vim keys
bindkey -v

# `cd` into frequently used directories
setopt auto_cd
cdpath=($HOME/code $GOPATH/src/github.com)

# Enable use of pushd and popd
setopt autopushd
setopt pushdsilent
setopt pushdignoredups
setopt pushdtohome

# Enable command completion
autoload -U compinit && compinit -i

# Enable prompt system
autoload -U promptinit && promptinit

# Enable color support
autoload -U colors && colors

# Enable globbing
setopt extended_glob

# Autocompletion with arrow-key driven interface
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# Enable command caching and force prefix matching
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Autocompletion of command line switches for aliases
unsetopt complete_aliases

# Preventing duplicate lines in history
# setopt HIST_IGNORE_DUPS

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
alias g="git"
alias gl="git l"
alias gd="git diff"
alias gst="git status"
alias gs="git status -sb"
alias gpt="git push --tags"
alias gp="git push"
alias gba="git branch -a"
alias gfp="git fetch origin --prune"
alias gr='cd "$(git rev-parse --show-toplevel)"'

# TaskWarrior aliases
alias t="task"
alias th="task help | less"
alias ta="task add"

#
# Functions
#

# Create folder and cd into it
take () {
  mkdir -p $1 && cd $1
}

#
# Tools
#

source `brew --prefix`/etc/profile.d/z.sh
source `brew --prefix nvm`/nvm.sh

#
# zplug
#

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load zplug
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# Load plugins
zplug "zplug/zplug"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting"

# Install packages not installed yet
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	else
		echo
	fi
fi

# Enable zplug
zplug load
