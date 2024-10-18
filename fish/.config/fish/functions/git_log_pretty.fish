## Pretty git print in fish
set HASH "%C(always,yellow)%h%C(always,reset)"
set RELATIVE_TIME "%C(always,green)%ar%C(always,reset)"
set AUTHOR "%C(always,bold blue)%an%C(always,reset)"
set REFS "%C(always,red)%d%C(always,reset)"
set SUBJECT "%s"

set FORMAT "$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

function git_log_pretty
    git log --graph --pretty="tformat:$FORMAT" $argv |
        column -t -s '{' |
        less -XRS --quit-if-one-screen
end
