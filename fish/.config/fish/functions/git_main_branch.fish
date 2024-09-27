function git_main_branch
    if command git rev-parse --abbrev-ref HEAD >/dev/null 2>&1
        echo (command git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
    end
end
