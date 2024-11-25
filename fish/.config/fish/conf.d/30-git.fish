if status --is-interactive
    if type -q git
        abbr -a gd "git diff"
        abbr -a gp "git push"
        abbr -a gs "git status --short"
        abbr -a gl "git log --oneline --graph --decorate --branches"
    end
end
