# Set path env
typeset -U path
path=(/usr/local/bin /usr/local/sbin $path[@])

# Set env
export EDITOR="nvim"
export LC_ALL="en_US.UTF-8"
export TERM="screen-256color"

# Enable vim keys
bindkey -v

# Enable auto-cd
setopt AUTO_CD

# Enable use of pushd and popd
setopt autopushd
setopt pushdsilent
setopt pushdignoredups
setopt pushdtohome

# Enable command completion
autoload -U compinit && compinit -i

# Enable prompt system
autoload -U promptinit && promptinit

# Enable globbing
setopt extended_glob

# Autocompletion with arrow-key driven interface
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# Autocompletion of command line switches for aliases
setopt completealiases

# Preventing duplicate lines in history
setopt HIST_IGNORE_DUPS

# Keep background jobs running
setopt NO_HUP
