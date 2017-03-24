
#
# Environment
#

# locale
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# terminal
set -x TERM xterm-256color
set -x CLICOLOR 1

# bash
set -x HISTCONTROL "erasedups:ignoreboth"
set -x HISTFILESIZE 100000
set -x HISTIGNORE "&:[ ]*:exit:ls:ls *:la:ll:bg:fg:clear:history"
set -x HISTSIZE 500000
set -x HISTTIMEFORMAT "%F %T "
set -x PROMPT_COMMAND "history -a"

# editor
set -x EDITOR vim
set -x VISUAL $EDITOR

# osx
set -x COPYFILE_DISABLE 1

# tools
set -x GREP_OPTIONS '--color=auto'

# misc
set -x GITHUB_USERNAME 'marcusandre'
set -x BITBUCKET_USERNAME 'reizwerk'

# dirs
set -x GOPATH $HOME/go
set -x PROJECTS $HOME/code
mkdir -p $GOPATH $PROJECTS

# paths
set -x PATH $HOME/bin /usr/local/opt/go/libexec/bin $GOPATH/bin $PATH

#
# Aliases
#

# navigating
alias ..='cd ..'
alias ...='cd ../..'

# editing
if type -q vim
  alias es='vim -o'
  alias ev='vim -O'
end

# git
if type -q git
  alias gap='git add . -p'
  alias gb='git branch'
  alias gba='git branches'
  alias gd='git diff'
  alias gds='git ds'
  alias gl='git ll'
  alias gp='git push'
  alias gr='cd (git root)'
  alias gs='git s'
  alias gst='git st'
end

# go
if type -q go
  alias gt='go test'
  alias gtv='go test -v'
end

# tmux
if type -q tmux
  alias tma='tmux attach -d -t'
  alias tmn='tmux new -s (basename (pwd) | tr -d ".")'
end

# Hide greetings
if set --query fish_greeting
  set --erase fish_greeting
end

#
# FZF
#

if type -q fzf
  fzf_key_bindings
end

#
# Prompt
#

set -g __fish_git_prompt_show_informative_status 'yes'
set -g __fish_git_prompt_char_stateseparator     ''
set -g __fish_git_prompt_char_cleanstate         ''
set -g __fish_git_prompt_char_upstream_ahead     ' ⬈'
set -g __fish_git_prompt_char_upstream_behind    ' ⬋'
set -g __fish_git_prompt_char_dirtystate         ' *'
set -g __fish_git_prompt_char_stagedstate        ' ·'
set -g __fish_git_prompt_char_untrackedfiles     ' %'

function fish_prompt
  printf '\n  λ '
  printf '%s' (prompt_pwd)
  set_color $fish_color_cwd
  printf '%s ' (__fish_git_prompt)
  set_color normal
  printf '> '
end
