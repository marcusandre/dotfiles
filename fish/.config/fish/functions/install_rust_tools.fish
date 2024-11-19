function install_rust_tools
    if type -q cargo
        set tools \
            cargo-update \
            diffedit3

        cargo install cargo-binstall -y

        for tool in $tools
            cargo binstall $tool -y
        end

        cargo install-update -a
    else
        echo "Please install rustup"
    end
end
