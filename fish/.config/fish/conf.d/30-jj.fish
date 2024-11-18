if type -q jj
    set -gx JJ_CONFIG "$HOME/.config/jj/config.toml"
    jj util completion fish | source
end
