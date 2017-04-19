
#
# Environment
#

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# terminal
export TERM=xterm-256color
export CLICOLOR=1

# bash
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=100000
export HISTIGNORE="&:[ ]*:exit:ls:ls *:la:ll:bg:fg:clear:history"
export HISTSIZE=500000
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a"

shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend

# editor
export EDITOR=vim
export VISUAL=$EDITOR

# osx
export COPYFILE_DISABLE=1

# tools
export GREP_OPTIONS='--color=auto'

# misc
export GITHUB_USERNAME='marcusandre'

# dirs
export GOPATH=$HOME/go
export PROJECTS=$HOME/code
mkdir -p $GOPATH $PROJECTS

# paths
export PATH=$HOME/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH
export CDPATH=.:$PROJECTS:$GOPATH/src

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

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PROMPT_DIRTRIM=4

PS1="\n  \[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:"
PS1="$PS1\[\e[m\]\w\[\e[1;31m\]> \[\e[0m\]"

#
# Aliases
#

# navigating
alias ..='cd ..'
alias ...='cd ../..'

# editors
alias e='$EDITOR'
alias es='vim -o'
alias ev='vim -O'

# git
alias gap='git add . -p'
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gr='cd $(git root)'
alias gs='git s'
alias gst='git st'

# go
alias gt='go test'
alias gtv='go test -v'

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
alias ag='ag --hidden'
alias clone='hub clone'
alias mp3='youtube-dl --prefer-avconv --extract-audio --audio-format mp3'
alias starthtml='curl -sSL https://git.io/vDcGT | vim -'

# directories
alias code='cd $PROJECTS'

# misc
alias path='echo -e ${PATH//:/\\n}'

#
# tmux
#

[ -n "$TMUX" ] && export TERM=xterm-256color

#
# Create <folder> and cd into it
#

md() {
  [ "$1" ] && mkdir -p "$1" && cd "$1"
}

#
# Open chromeless Google Chrome website with given <url>
#

gco() {
  [ "$1" ] && open -n -a "Google Chrome" --args "--app=$1"
}

#
# junegunn/fzf
#
# $ brew install fzf && /usr/local/opt/fzf/install
#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

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
