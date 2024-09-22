function git_root
    git rev-parse --git-dir | path dirname
end
