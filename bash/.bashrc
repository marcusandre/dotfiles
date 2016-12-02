# Bash environment setup
# ====================================================================
# - https://github.com/marcusandre/dotfiles
# - hello@marcusandre.de

# Options
# --------------------------------------------------------------------

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Environment variables
# --------------------------------------------------------------------

export TERM=xterm-256color

export EDITOR=vim
export VISUAL=$EDITOR

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export COPYFILE_DISABLE=1

# Go
export GOPATH=$HOME

# Expand PATH
export PATH=$PATH:$HOME/bin:/usr/local/opt/go/libexec/bin

# Prompt
# --------------------------------------------------------------------

PS1="\n  \[\e[38;5;168m\]λ\[\e[0m\] \W : "

# Aliases
# --------------------------------------------------------------------

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias wk='cd $GOPATH/src/bitbucket.org/reizwerk'

# fs
alias la='ls -alF'
alias ll='ls -l'

# Applications
alias e='$EDITOR'
alias vi='vim'

# Git
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gs='git st'
alias gsb='git s'

# Vim
alias vimup='vim +PlugInstall +PlugUpdate +qall'

# tmux
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'

# Functions
# --------------------------------------------------------------------

take() {
  [ "$1" ] && mkdir -p "$1" && cd "$1"
}
