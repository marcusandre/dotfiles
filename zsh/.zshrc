# Load configuration
ZSHDIR="${HOME}/.zsh"
source ${ZSHDIR}/env.zsh
source ${ZSHDIR}/aliases.zsh

# Load and init compsys
autoload -U compinit
compinit -i

# Set input correction
setopt correct_all
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias tree='nocorrect tree'
alias vim='nocorrect vim'

# Map modifiers
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward

# Handle directories
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# Colors
autoload colors; colors;

# z
[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
