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
set -gx GPG_TTY (tty)
set -gx VISUAL nvim
set -gx PAGER "less -R --use-color -Dd+r -Du+b"
set -gx MANPAGER 'nvim +Man!'
set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/.ripgreprc"
set -gx LS_COLORS "vivid generate snazzy"

# Go
if test -d $HOME/go/bin
    fish_add_path "$HOME/go/bin"
end

# OCaml
if test -e $HOME/.opam/opam-init/init.fish
    source $HOME/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
end

# cargo
if test -d $HOME/.cargo/bin
    fish_add_path "$HOME/.cargo/bin"
end

# zoxide
if type -q zoxide
    zoxide init fish | source
end

# mise
if type -q mise
    mise activate fish | source
end

# atuin
if type -q atuin
    set -gx ATUIN_NOBIND "true"
    atuin init fish | source

    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
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

# Interactive ripgrep
function rgi -d "Interactive ripgrep"
    command rg --json -C 2 $argv | delta
end

# Aliases
alias .. 'cd ..'
alias cat bat
alias cloc tokei
alias e nvim
alias flushdns 'sudo killall -HUP mDNSResponder'
alias gap 'git add . -p'
alias gb 'git branch -a'
alias gd 'git diff'
alias gl 'git ll'
# alias gp "git symbolic-ref --short HEAD 2> /dev/null | xargs -L1 git push origin"
alias gp 'git push'
alias gr 'cd $(git rev-parse --show-toplevel)'
alias gu 'git upgrade'
alias ll 'ls -la'
alias ls eza
alias rf 'rm -fr'
alias s 'git status'
alias sloc tokei
alias tree 'eza --tree'
alias vimdiff 'nvim -d'

# Nightfox Color Palette
# Style: carbonfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/carbonfox.fish
set -l foreground f2f4f8
set -l selection 2a2a2a
set -l comment 6e6f70
set -l red ee5396
set -l orange 3ddbd9
set -l yellow 08bdba
set -l green 25be6a
set -l purple be95ff
set -l cyan 33b1ff
set -l pink ff7eb6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
