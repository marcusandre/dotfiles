set fish_greeting

# Path
fish_add_path "$HOME/bin"

# Env
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER "less -R --use-color -Dd+r -Du+b"
set -gx LS_COLORS "vivid generate dracula"

# Go
set -gx GOPATH $HOME/golang
set -gx GOROOT $(brew --prefix go)/libexec

# prompt
starship init fish | source

# cargo
fish_add_path "$HOME/.cargo/bin"

# zoxide
zoxide init fish | source

# rtx
rtx activate fish | source

function md -d "Create a directory and set CWD"
    command mkdir -p $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'
                return
            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

# Aliases
alias .. 'cd ..'
# alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Dracula || echo GitHub)"
alias cat="bat --theme=tokyonight_moon"
alias cloc='tokei'
alias e nvim
alias flushdns 'sudo killall -HUP mDNSResponder'
alias gap 'git add . -p'
alias gb 'git branch -a'
alias gd 'git diff'
alias gl 'git ll'
alias gp "git symbolic-ref --short HEAD 2> /dev/null | xargs -L1 git push origin"
alias gr 'cd $(git root)'
alias gu 'git upgrade'
alias lg 'lazygit'
alias ll 'ls -la'
alias ls exa
alias rf 'rm -fr'
alias s 'git s'
alias sloc='tokei'
alias ss 'git status'
alias tree 'exa --tree'
alias vim='nvim'
alias vimdiff='nvim -d'

# walk
function lk
  set loc (walk $argv); and cd $loc;
end
