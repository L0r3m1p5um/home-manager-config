# Various nushell utility functions. Generally these should not require
# any additional dependencies.

# Maps the values of a record to another value based on the provided closure
export def map-values [
    closure # Closure to apply to each record value.
] {
    let input = $in
    let keys = ($input | columns)
    $keys | each {|key| {key: $key, value: ($input | get $key)}}
}

# Converts a record to a list of keys and values
export def entries [] {
    let input = $in
    let keys = ($input | columns)
    $keys | each {|key| {key: $key, value: ($input | get $key)}}
}

export def from-entries [] {
    $in | reduce --fold {} {|it, acc| $acc | insert $it.key $it.value}
}


# Conditionally updates a value in a list
export def update-if [
    predicate,  # Closure to check a condition. Should return a boolean
    update      # Closure to apply to the item if the predicate matches
] {
    each {|it| if (do $predicate $it) { do $update $it} else { $it }}
}

export def upsert-if [
    predicate,
    field,
    replacement
] {
    update-if $predicate {upsert $field $replacement}
}

export def file-extension [] {
    path split
    | last # filename
    | str substring 1.. # strip the first character so that hidden files like .gitignore don't have their name as the extension
    | if ($in | str contains '.') {
        $in | split row '.' | last
    } else {
        ""
    }
}

export def concat [] {
    reduce -f [] {|it, acc| $acc | append $it }
}

# splits a list into a list of lists of a given size. The last list may be smaller than the chunk size
export def chunks [ size ] {
    $in | reduce -f [[]] {|it, acc|
        if ($acc | last | length) > ($size - 1) {
            $acc | append [[$it]]
        } else {
            let last = ($acc | last)
            ($acc | drop 1) | append [($last | append $it)]
        }
    }
}