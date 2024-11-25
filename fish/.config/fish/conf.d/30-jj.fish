if status --is-interactive
    if type -q jj
        abbr -a jd "jj diff"
        
        set -gx JJ_CONFIG "$HOME/.config/jj/config.toml"
        jj util completion fish | source
    end
end
