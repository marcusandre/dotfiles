if type -q fzf
    fzf --fish | source

    if command -sq bat
        set -gx FZF_CTRL_T_OPTS "--ansi --preview 'bat -f -p --line-range :300 {}'"
    else
        set -gx FZF_CTRL_T_OPTS "--preview 'cat {}'"
    end
end
