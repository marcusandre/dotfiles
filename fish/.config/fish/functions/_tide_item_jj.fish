function _tide_item_jj
    if not command -sq jj
        return 1
    end

    if not jj root --quiet &>/dev/null
        return 1
    end

    jj log --ignore-working-copy --no-graph --color always -r @ -T '
        surround(
            " (",
            ")",
            separate(
                " ",
                bookmarks.join(", "),
                coalesce(
                    surround(
                        "\"",
                        "\"",
                        if(
                            description.first_line().substr(0, 24).starts_with(description.first_line()),
                            description.first_line().substr(0, 24),
                            description.first_line().substr(0, 23) ++ "…"
                        )
                    ),
                    "(no description set)"
                ),
                change_id.shortest(),
                commit_id.shortest(),
                if(conflict, "(conflict)"),
                if(empty, "(empty)"),
                if(divergent, "(divergent)"),
                if(hidden, "(hidden)"),
            )
        )
    '
end
