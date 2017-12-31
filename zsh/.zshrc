# == ENVIRONMENT

# Environment setup
export GOPATH=$HOME/go
export PATH=$HOME/bin:$GOPATH/bin:$PATH

# History settings
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

SAVEHIST=9000
HISTSIZE=9000
HISTFILE=~/.zsh_history

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

# Complete hidden files
setopt globdots

# == ALIASES

alias ..='cd ..'
alias ack='rg'
alias ag='rg'
alias gba='git branches'
alias gd='git df'
alias gl='git l'
alias gll='git ll'
alias gp='git push'
alias gr='git root'
alias gs='git s'
alias gst='git status'
alias la='ls -la'
alias ll='ls -la'
alias rf='rm -fr'
alias rmds='find . -name ".DS_Store" -type f -delete'
alias vgs='vagrant global-status'
alias vsp='vagrant suspend'
alias vup='vagrant up'

# == FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# == HELPERS

# Create new folder an cd into
md() {
  mkdir -p "$1" && cd "$_"
}
