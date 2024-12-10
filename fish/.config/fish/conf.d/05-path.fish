if status --is-interactive
    if test -d $HOME/bin
        fish_add_path -mg "$HOME/bin"
    end
end
