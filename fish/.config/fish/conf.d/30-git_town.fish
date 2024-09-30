if type -q git-town
    git-town completions fish | source

    abbr -a gu "git town sync"
    abbr -a gk "git town hack"
    abbr -a gpr "git town propose"
end
