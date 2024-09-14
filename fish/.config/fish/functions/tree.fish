function tree -d "List directory recursively as tree"
    if test -z $argv
        set argv .
    end
    pushd $argv
    eza --tree --all --git-ignore
    popd
end
