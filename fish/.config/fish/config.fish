#
# Environment
#

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x EDITOR vim
set -x VISUAL $EDITOR

set -x GITHUB_USERNAME 'marcusandre'

set -gx GOPATH $HOME/go
set -gx PROJECTS $HOME/code
set -gx PATH $HOME/bin /usr/local/opt/go/libexec/bin $GOPATH/bin $PATH

#
# Aliases
#

# navigating
alias .. "cd .."
alias ... "cd ../.."

# fs
alias ls "ls -GpF"
alias ll "ls -alGpF"

# editors
alias e $EDITOR
alias es "vim -o"
alias ev "vim -O"

# git
alias gap "git add . -p"
alias gb "git branch"
alias gba "git branches"
alias gd "git diff"
alias gdc "git diff --cached"
alias gdf "git diff --name-only"
alias gds "git ds"
alias gl "git ll"
alias gp "git push"
alias gr "cd (git root)"
alias gs "git s"
alias gst "git st"

# fzf
alias fa "locate / | fzf --height 50%"
alias fp "locate $PROJECTS | fzf --height 50%"

# go
alias gt "go test"
alias gtv "go test -v"

# npm
alias nb "npm run build"
alias nc "npm run coverage"
alias ns "npm run start"
alias nt "npm run test"

# tmux: attach to <name>
alias tma "tmux attach -d -t"

# tmux: create new session with <name> of current folder
alias tmn "tmux new -s (basename (pwd) | tr -d ".")"

# directories
alias code "cd $PROJECTS"

# misc
alias ag "ag --hidden"
alias clone "hub clone"

# mkdir and cd to it
function md
  mkdir -p $argv; cd $argv
end

# create a new html document
function starthtml
  curl -sSL https://git.io/vDcGT | vim -
end

# find file print path
function ff
  find . -xdev -name $argv
end
