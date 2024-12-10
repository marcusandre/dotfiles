if status --is-interactive
    if type -q git
        abbr -a gap "git add -p"
        abbr -a gd "git diff"
        abbr -a gl "~/bin/git-log"
        abbr -a gov "git overwrite"
        abbr -a gp "git push"
        abbr -a gr "cd (git root)"
        abbr -a gs "git status --short"
    end
end
