function ef -d "Skim through files and open them in $EDITOR"
    rg --files | sk --preview="bat {} --color=always" | xargs -r $EDITOR
end
