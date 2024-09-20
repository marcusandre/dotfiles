function wttr --wraps='curl -s wttr.in' --wraps='curl -s wttr.in | grep -v Follow' --description 'alias wttr=curl -s wttr.in | grep -v Follow'
    curl -s "wttr.in/$argv" | grep -v Follow
end
