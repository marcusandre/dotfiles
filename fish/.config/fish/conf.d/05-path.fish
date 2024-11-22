if status --is-interactive
    if test -f $HOME/.cargo/env.fish
        fish_add_path -mg "$HOME/bin"
    end
end
