if type -q jj
    set -x JJ_CONFIG ~/.config/jj/config.toml
    jj util completion fish | source
end
