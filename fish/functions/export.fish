# Locale
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Editor
set -x EDITOR "vim"

# Go
set -x GOPATH $HOME/.golang
set -x GOBIN $GOPATH/bin

# Ruby
set -x RUBY_GC_HEAP_INIT_SLOTS 600000
set -x RUBY_GC_HEAP_FREE_SLOTS 600000
set -x RUBY_GC_HEAP_GROWTH_FACTOR 1.25
set -x RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

# rbenv
set RBENV_BIN $HOME/.rbenv/bin
set RBENV_SHIMS $HOME/.rbenv/shims

if type rbenv >/dev/null
  rbenv rehash >/dev/null ^&1
end

# boot2docker
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH $HOME/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1

# grep(1)
setenv -x GREP_OPTIONS "--color=auto"

# $PATH
set -x PATH /usr/local/bin /usr/local/sbin $PATH
set -x PATH "$HOME/bin" "$GOBIN" $RBENV_BIN $RBENV_SHIMS $PATH
