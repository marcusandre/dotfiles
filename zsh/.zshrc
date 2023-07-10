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
