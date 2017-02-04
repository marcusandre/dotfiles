
#
# Environment
#

# path
export PATH=$HOME/bin:/usr/local/opt/go/libexec/bin:$PATH
export GOPATH=$HOME

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# terminal
export TERM=xterm-256color
export CLICOLOR=1

# editor
export EDITOR=vim
export VISUAL=$EDITOR

# git
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# osx
export COPYFILE_DISABLE=1

# misc
export GREP_OPTIONS='--color=auto'
export GITHUB_USERNAME='marcusandre'
export BITBUCKET_USERNAME='reizwerk'
export GITLAB_USERNAME='megges'

#
# Bash completion
#
# $ brew install bash-completion
#

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#
# Prompt
#

export PROMPT_COMMAND='echo -ne "\n  "; __git_ps1 "\[$(tput setaf 6)\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]" " "; echo -ne "\033]0;${PWD##*/}\007"'

#
# Aliases
#

# navigating
alias ..='cd ..'
alias ...='cd ../..'

# editors
alias e='$EDITOR'

# git
alias gap='git add . -p'
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gr='cd $(git root)'
alias gs='git s'
alias gst='git st'

# tmux: attach to <name>
alias tma='tmux attach -d -t'

# tmux: create new session with <name> of current folder
alias tmn='tmux new -s $(basename $(pwd) | tr -d ".")'

# clipboard
alias copy='pbcopy'
alias paste='pbpaste'

# misc
alias ls='ls -GpF'
alias ll='ls -alGpF'
alias less='less -R'
alias clone='hub clone'
alias mp3='youtube-dl --prefer-avconv --extract-audio --audio-format mp3'
alias starthtml='curl -L https://git.io/vDcGT | vim -'

# directories
alias code='cd $GOPATH/src/github.com/$GITHUB_USERNAME'
alias lab='cd $GOPATH/src/gitlab.com/$GITLAB_USERNAME'
alias work='cd $GOPATH/src/bitbucket.org/$BITBUCKET_USERNAME'

#
# Create <folder> and cd into it
#

md() {
  [ "$1" ] && mkdir -p "$1" && cd "$1"
}

#
# junegunn/fzf
#
# $ brew install fzf && /usr/local/opt/fzf/install
#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# rupa/z
#
# $ brew install z
#

[ -f `brew --prefix`/etc/profile.d/z.sh ] && source `brew --prefix`/etc/profile.d/z.sh

# make z fuzzy with fzf
unalias z 2> /dev/null

z() {
  [ $# -gt 0  ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}
