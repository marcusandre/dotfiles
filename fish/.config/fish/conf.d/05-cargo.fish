if status --is-interactive
    if test -f $HOME/.cargo/env.fish
        source "$HOME/.cargo/env.fish"
    end
end
