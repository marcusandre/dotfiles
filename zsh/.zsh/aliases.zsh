#
# Aliases
#

# navigating
alias ..='cd ..'
alias ...='cd ../..'

# fs
alias ls='ls -GpF'
alias ll='ls -alGpF'
alias t='tree -I "vendor|node_modules"'

# editors
alias e='vim'
alias es='vim -o'
alias ev='vim -O'

# git
alias gap='git add . -p'
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdf='git diff --name-only'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gr='cd $(git root)'
alias gs='git s'
alias gst='git st'

# searching
alias ack='rg'
alias ag='rg'

# fzf
alias fa='locate / | fzf --height 50%'
alias fp='locate $PROJECTS | fzf --height 50%'

# go
alias gt='go test'
alias gtv='go test -v'

# npm
alias nb='npm run build'
alias nc='npm run coverage'
alias ns='npm run start'
alias nt='npm run test'

# misc
alias fingerprint="ssh-keygen -E md5 -lf"
alias randomkey="xxd -g 2 -l 64 -p /dev/random | tr -d '\n'"
alias starthtml="curl https://gist.githubusercontent.com/marcusandre/7c0ac2481fa269ae5fa712f6c9be37ff/raw/c43d39c95e701f835db346f771aabe6ef198b874/index.html"

# create dir and cd
function md() {
  mkdir -p "$1" && cd "$1"
}
