def "nu-complete just" [] {
    (^just --dump --unstaqble --dump-format json | from json).recipes 
        | transpose recipe data 
        | flatten 
        | where {|row| $row.private == false } 
        | select recipe doc parameters 
        | rename value description
}

export extern "just" [
    ...recipe: string@"nu-complete just", 
]