function install_cargo_tools
    cargo install cargo-binstall

    set tools cargo-component usage-cli

    for tool in $tools
        cargo binstall $tool
    end
end