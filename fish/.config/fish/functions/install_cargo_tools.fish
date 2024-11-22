function install_cargo_tools
    if type -q cargo
        set tools \
            cargo-update \
            diffedit3

        cargo install cargo-binstall

        for tool in $tools
            cargo binstall $tool -y
        end

        cargo install-update -a
        rustup component add rust-analyzer
    else
        echo "Please install rustup"
    end
end
