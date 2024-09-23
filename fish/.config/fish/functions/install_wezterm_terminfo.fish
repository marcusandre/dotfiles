function install_wezterm_terminfo
    set tempfile (mktemp)
    if curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo
        tic -x -o ~/.terminfo $tempfile
    end
    rm $tempfile
end
