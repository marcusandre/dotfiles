# Prefix Path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH
fi

# History settings
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%d/%m/%Y %H:%M:%S "
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTIGNORE="ls:ls *:la:cd:cd -:pwd:exit:date:clear:* --help:* -h"
export MANPAGER="less -X"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export LC_ALL="en_US.UTF-8"

# Shell settings
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -s nocaseglob

# notify of background job completion
set -o notify

# skip this stupid mail check
unset MAILCHECK

# default umask
umask 0022

# Input settings
set completion-ignore-case on
set show-all-if-ambiguous on

# Misc settings
complete -cf sudo
export PAGER=less
export TERM=xterm-256color

# Hail to the Vim, Baby
export EDITOR=vim

# Homebrew Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Call the prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# Call the aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Call the extras
if [ -f ~/.extras ]; then
  source ~/.extras
fi

# Init z
if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
  . $(brew --prefix)/etc/profile.d/z.sh
fi

# Setup Go
export GOROOT=$HOME/.go
export GOPATH=$HOME/.golang
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Init rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# Setup boot2docker
if hash boot2docker 2>/dev/null; then
  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1
fi
