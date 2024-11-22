if type -q hx
    set -gx EDITOR hx
    abbr -a e hx
else if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MANPAGER "nvim +Man!"
    abbr -a e nvim
    abbr -a eu "nvim --headless '+Lazy! sync' +qa"
else
    set -gx EDITOR vim
    abbr -a e vim
end
