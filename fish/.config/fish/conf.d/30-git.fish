if status --is-interactive
    if type -q git
        abbr -a gd "git diff"
        abbr -a gl "git log --oneline --graph --decorate --branches"
        abbr -a gp "git push"
        abbr -a gr "cd (git root)"
        abbr -a gs "git status --short"
    end
end
