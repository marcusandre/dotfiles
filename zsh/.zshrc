export ZSH=~/.zsh

eval "$(~/Developer/homebrew/bin/brew shellenv)"

# == ENVIRONMENT
if [[ -f /Users/mzui5of/.zsh_private ]]; then
  source /Users/mzui5of/.zsh_private
fi

# == PATH
export GOPATH=$HOME/golang
export GOROOT=$(brew --prefix go)/libexec

CHUNKS=(
  $HOME/bin
  $GOPATH/bin
  $GOROOT/bin
  /usr/local/bin
  /usr/local/sbin
  $PATH
)

CHUNKS_STR=${(j.:.)${:-${^CHUNKS}}}
export PATH=$CHUNKS_STR

# == EDITOR
export EDITOR=nvim

# == OPTIONS

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

SAVEHIST=9000
HISTSIZE=9000
HISTFILE=~/.zsh_history

# == COMPLETION

setopt GLOBDOTS # Complete hidden files
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load and run compinit
autoload -U compinit
compinit -i

# == Keyboard

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
  # PS1='%B%m${TENV:+ [$TENV]}%(?.. %??)%(1j. %j&.)%b $(gitpwd)%B%(!.%F{red}.%F{yellow})%#${SSH_CONNECTION:+%#}$nbsp%b%f'
  PS1=' %F{cyan}λ%f${TENV:+ [$TENV]}%(?.. %??)%(1j. %j&.)%b $(gitpwd)%B%(!.%F{red}.%F{yellow})%#${SSH_CONNECTION:+%#}$nbsp%b%f'
  RPROMPT=''
}

cnprompt6

# == ALIASES

alias ..='cd ..'
alias e='nvim'
alias flushdns='sudo killall -HUP mDNSResponder'
alias gap='git add . -p'
alias gb='git branch -a'
alias gd='git diff'
alias gl='git ll'
alias gp="git symbolic-ref --short HEAD 2> /dev/null | xargs -L1 git push origin"
alias gr='cd $(git root)'
alias gu='git upgrade'
alias la=' ls -laG'
alias ld=' ls -ladG'
alias ll=' ls -laG'
alias nd='cat package.json | jq ".dependencies"'
alias ns='cat package.json | jq ".scripts"'
alias rf='rm -fr'
alias rmds='find . -name ".DS_Store" -type f -delete'
alias s='git s'
alias ss='git status'
alias wl='wget -c -q --show-progress'

# == HELPERS

# Create new folder and cd into
md() { mkdir -p "$1" && cd "$_" }

# Get external ip addr
extip() { curl ifconfig.me/ip }

# Safety copies
dl3() { youtube-dl --output "%(title)s.%(ext)s" -x --audio-format mp3 --prefer-ffmpeg "$1" }

# starship
eval "$(starship init zsh)"

# init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# init z
[ -f $(brew --prefix)/etc/profile.d/z.sh ] && . $(brew --prefix)/etc/profile.d/z.sh
