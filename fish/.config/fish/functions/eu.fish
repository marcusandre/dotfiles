function eu --wraps='nvim --headless "+Lazy! sync" +qa' --description 'alias eu=nvim --headless "+Lazy! sync" +qa'
    nvim --headless "+Lazy! sync" +qa $argv
end
