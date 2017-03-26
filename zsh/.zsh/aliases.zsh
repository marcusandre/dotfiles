# navigating
alias ..='cd ..'
alias ...='cd ../..'

# editors
alias e='$EDITOR'
alias es='vim -o'
alias ev='vim -O'

# git
alias gap='git add . -p'
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gr='cd $(git root)'
alias gs='git s'
alias gst='git st'

# go
alias gt='go test'
alias gtv='go test -v'

# tmux: attach to <name>
alias tma='tmux attach -d -t'

# tmux: create new session with <name> of current folder
alias tmn='tmux new -s $(basename $(pwd) | tr -d ".")'

# clipboard
alias copy='pbcopy'
alias paste='pbpaste'

# misc
alias ls='ls -GpF'
alias ll='ls -alGpF'
alias less='less -R'
alias clone='hub clone'
alias mp3='youtube-dl --prefer-avconv --extract-audio --audio-format mp3'
alias starthtml='curl -sSL https://git.io/vDcGT | vim -'
alias tea='vim ~/Desktop/Tea.md'

# directories
alias code='cd $PROJECTS'

# misc
alias path='echo -e ${PATH//:/\\n}'
