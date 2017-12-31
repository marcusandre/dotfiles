# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "rupa/z", use:z.sh
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

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

# Complete hidden files
setopt globdots

# Aliases
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

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# Create new folder an cd into
md() {
  mkdir -p "$1" && cd "$_"
}
