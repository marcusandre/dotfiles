# Editors
export EDITOR=vim
export VISUAL=vim

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History
export HISTSIZE=2500
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Others
export GITHUB_USERNAME='marcusandre'

# Go
export GOPATH=$HOME/go
export PROJECTS=$HOME/code

# Path
export PATH=$HOME/bin:$GOPATH/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH
