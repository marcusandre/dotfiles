# == ENVIRONMENT
if [[ -f $HOME/.private.zsh ]]; then
  source $HOME/.private.zsh
fi

# English with UTF8
export LANG=en_US.UTF-8
export LC_CTYPE=$LANG
export LC_COLLATE=C

# Path
export GOPATH="$HOME/go"
export RUSTPATH="$HOME/.cargo/bin"
export PATH=$HOME/bin:$GOPATH/bin:$RUSTPATH:$PATH

export EDITOR=vim

# == OPTIONS

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt GLOBDOTS # Complete hidden files

SAVEHIST=9000
HISTSIZE=9000
HISTFILE=~/.zsh_history

# == COMPLETION

setopt BASH_AUTO_LIST
# setopt COMPLETE_ALIASES
setopt NO_ALWAYS_LAST_PROMPT
setopt NO_AUTO_MENU

zmodload zsh/complist
autoload -Uz compinit && compinit

# == MISC

umask 002
bindkey -e

# == PROMPT (by Leah)
# http://chneukirchen.org/blog/archive/2017/02/a-time-proven-zsh-prompt.html

# gitpwd - print %~, limited to $NDIR segments, with inline git branch
NDIRS=2
gitpwd() {
  local -a segs splitprefix; local prefix branch
  segs=("${(Oas:/:)${(D)PWD}}")
  segs=("${(@)segs/(#b)(?(#c10))??*(?(#c5))/${(j:\u2026:)match}}")

  if gitprefix=$(git rev-parse --show-prefix 2>/dev/null); then
    splitprefix=("${(s:/:)gitprefix}")
    if ! branch=$(git symbolic-ref -q --short HEAD); then
      branch=$(git name-rev --name-only HEAD 2>/dev/null)
      [[ $branch = *\~* ]] || branch+="~0"    # distinguish detached HEAD
    fi
    if (( $#splitprefix > NDIRS )); then
      print -n "${segs[$#splitprefix]}@$branch "
    else
      segs[$#splitprefix]+=@$branch
    fi
  fi

  (( $#segs == NDIRS+1 )) && [[ $segs[-1] == "" ]] && print -n /
  print "${(j:/:)${(@Oa)segs[1,NDIRS]}}"
}

cnprompt6() {
  case "$TERM" in
    xterm*|rxvt*)
      precmd() { [[ -t 1 ]] && print -Pn "\e]0;%m: %~\a" }
      preexec() { [[ -t 1 ]] && print -n "\e]0;$HOST: ${(q)2//[$'\t\n\r']/ }\a" }
  esac
  setopt PROMPT_SUBST
  nbsp=$'\u00A0'
  PS1='%B%m${TENV:+ [$TENV]}%(?.. %??)%(1j. %j&.)%b $(gitpwd)%B%(!.%F{red}.%F{yellow})%#${SSH_CONNECTION:+%#}$nbsp%b%f'
  RPROMPT=''
}

cnprompt6

# == ALIASES

alias ..='cd ..'
alias ack=' rg'
alias ag=' rg'
alias d='dirs -v'
alias gba='git branches'
alias gd='git df'
alias gl='git l'
alias gll='git ll'
alias gp='git push'
alias gr='cd $(git root)'
alias gw='git dw'
alias k='cd $GOPATH/src/gitlab.com/khakibytes'
alias la=' ls -la'
alias ll=' ls -la'
alias rf='rm -fr'
alias rmds='find . -name ".DS_Store" -type f -delete'
alias s='git s'
alias ss='git status'
alias t='task'
alias w='timew'

# == FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# == HELPERS

# Create new folder an cd into
md() { mkdir -p "$1" && cd "$_" }

# Get external ip addr
extip() { curl ifconfig.me/ip }
