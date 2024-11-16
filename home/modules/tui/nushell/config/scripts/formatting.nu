use extensions.nu

export def sort-yaml [--in-place (-i), ...filenames] {
    let input = $in
    if (($filenames | length) == 0) {
        $in | each {|it| yq -P 'sort_keys(..)'}
    } else if $in_place {
        $filenames | each {|it| yq -P -i 'sort_keys(..)' $it}
    } else {
        $filenames | each {|it| yq -P 'sort_keys(..)' $it}
    }
}

alias sort-yaml = yq -P 'sort_keys(..)'

export def format-files [...filenames] {
    for file in ($filenames | concat) {
        let formatter = $env.FILE_FORMATTERS | get -i ($file | file-extension);
        if ($formatter != null) {
            do $formatter file
        }
    }
}