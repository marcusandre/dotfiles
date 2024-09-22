function git_main_branch
    if command git rev-parse --abbrev-ref HEAD >/dev/null 2>&1
        set branch (command git rev-parse --abbrev-ref HEAD)
        switch $branch
            case master
                echo master
            case main
                echo main
            case "*"
                echo $branch
        end
    end
end
