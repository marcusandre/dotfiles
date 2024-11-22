function install_go_tools
    set tools \
        golang.org/x/tools/cmd/godoc@latest \
        golang.org/x/tools/cmd/goimports@latest \
        golang.org/x/tools/cmd/gonew@latest \
        github.com/kisielk/errcheck@latest \
        mvdan.cc/gofumpt@latest \
        honnef.co/go/tools/cmd/staticcheck@latest

    for tool in $tools
        go install -v $tool
    end
end
