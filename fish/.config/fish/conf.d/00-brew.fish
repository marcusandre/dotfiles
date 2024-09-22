if status --is-interactive
    if test -x /opt/homebrew/bin/brew
        set -gx HOMEBREW_NO_EMOJI 1
        set -gx HOMEBREW_NO_ANALYTICS 1
        /opt/homebrew/bin/brew shellenv | source
    end
end
