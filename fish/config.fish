if not status is-interactive
    return 0
end

set fish_greeting

# Path
fish_add_path "$HOME/bin"

if status --is-interactive
  if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
  end

  if test -x /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
  end
end

# Env
set -gx EDITOR nvim
set -gx BROWSER chromium
set -gx VISUAL nvim
set -gx PAGER "less -R --use-color -Dd+r -Du+b"
set -gx MANPAGER 'nvim +Man!'
set -gx NVIM_LISTEN_ADDRESS "/tmp/nvimsocket"
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/.ripgreprc"
# set -gx LS_COLORS "vivid generate catppuccin-macchiato"

# Vi mode
set -g fish_key_bindings fish_vi_key_bindings
set fish_vi_force_cursor 1
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# Go
set -gx GOPATH $HOME/golang
set -gx GOROOT $(brew --prefix go)/libexec

# OCaml
if test -e $HOME/.opam/opam-init/init.fish
  source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

# cargo
if test -d $HOME/.cargo/bin
  fish_add_path "$HOME/.cargo/bin"
end

# zoxide
if type -q zoxide
  zoxide init fish | source
end

# rtx
if type -q rtx
  rtx activate fish | source
end

# prompt
if type -q starship
  starship init fish | source
end

# Create a directory and set CWD
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
alias cat bat
alias cloc 'tokei'
alias e nvim
alias b 'NVIM_APPNAME=beta nvim'
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
alias ls eza
alias rf 'rm -fr'
alias s 'git s'
alias sloc 'tokei'
alias ss 'git status'
alias tree 'eza --tree'
alias vimdiff 'nvim -d'

# walk
function lk
  set loc (walk $argv); and cd $loc;
end

fish_config theme choose "tokyonight_moon"
