function serve --wraps='python3 -m http.server' --description 'alias serve=python3 -m http.server'
    python3 -m http.server $argv
end
