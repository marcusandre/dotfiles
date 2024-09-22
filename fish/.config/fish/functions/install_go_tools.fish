function install-go-tools
    set tools \
        golang.org/x/tools/cmd/godoc@latest \
        golang.org/x/tools/cmd/goimports@latest \
        golang.org/x/tools/cmd/gonew@latest \
        golang.org/x/tools/go/analysis/passes/nilness/cmd/nilness@latest \
        github.com/kisielk/errcheck@latest \
        github.com/gordonklaus/ineffassign@latest \
        mvdan.cc/gofumpt@latest \
        honnef.co/go/tools/cmd/staticcheck@latest

    for tool in $tools
        go install -v $tool
    end
end
