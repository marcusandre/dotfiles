if type -q zed
    abbr -a e zed --wait
else if type -q nvim
    set -gx EDITOR nvim
    abbr -a e nvim
else if type -q hx
    set -gx EDITOR hx
    abbr -a e hx
end
