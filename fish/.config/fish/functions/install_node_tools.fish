function install_node_tools
    set tools \
        typescript \
        typescript-language-server \
        vscode-langservers-extracted \
        knip

    for tool in $tools
        printf "Installing: %s" $tool
        npm install -g $tool
    end
end
