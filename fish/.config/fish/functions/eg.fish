function eg -d "Skim through lines and open them in $EDITOR"
    sk -m --ansi -i -c 'rg --line-number  "{}"' | awk -F':' '{print "+"$2, $1}' | xargs -r $EDITOR
end
