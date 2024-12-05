if type -q zed
    set -gx EDITOR zed --wait
    abbr -a e zed --wait
else if type -q nvim
    set -gx EDITOR nvim
    abbr -a e nvim
end
