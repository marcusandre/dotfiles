
#
# Environment
#

export COPYFILE_DISABLE=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export VISUAL=$EDITOR
export GOPATH=$HOME
export PATH=$PATH:$HOME/bin:/usr/local/opt/go/libexec/bin
export GITHUB_USERNAME='marcusandre'
export BITBUCKET_USERNAME='reizwerk'

#
# Prompt
#

PS1="\n  \[\e[38;5;168m\]❧ \[\e[0m\] \W : "

#
# Aliases
#

# navigating
alias ..='cd ..'
alias ...='cd ../..'

# editors
alias e='$EDITOR'

# git
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gr='cd $(git root)'
alias gs='git st'
alias gsb='git s'

# tmux
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd) | tr -d ".")'

# clipboard
alias copy='pbcopy'
alias paste='pbpaste'

# misc
alias la='ls -alhFG'
alias less='less -R'
alias ll='ls -lG'
alias clone='hub clone'
alias code='cd $GOPATH/src/github.com/$GITHUB_USERNAME'
alias work='cd $GOPATH/src/bitbucket.org/$BITBUCKET_USERNAME'

#
# Bash completion
#

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#
# Create <folder> and cd into it
#

take() {
  [ "$1" ] && mkdir -p "$1" && cd "$1"
}

#
# junegunn/fzf
#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# rupa/z
#

[ -f `brew --prefix`/etc/profile.d/z.sh ] && source `brew --prefix`/etc/profile.d/z.sh

# prefer fzf
unalias z 2> /dev/null

z() {
  [ $# -gt 0  ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}
