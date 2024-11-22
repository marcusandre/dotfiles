if status --is-interactive
    if type -q mise
        mise activate fish | source
    end
end
