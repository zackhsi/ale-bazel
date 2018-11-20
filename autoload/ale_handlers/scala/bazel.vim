function! ale_handlers#scala#bazel#Handle(buffer, lines) abort
    " Matches against lines like the following:
    "
    " path/to/file.scala:5: error: not found: type Args
    " path/to/file.scala:3: warning: Unused import
    let l:pattern = '^[^:]\+:\(\d\+\):\s*\(\([^:]\+\).*\)$'
    let l:output = []

    for l:line in a:lines
        " Look for error lines first.
        let l:match = matchlist(l:line, l:pattern)
        if !empty(l:match)
            call add(l:output, {
            \   'lnum': l:match[1] + 0,
            \   'text': l:match[2],
            \   'type': l:match[3] =~? 'error' ? 'E' : 'W',
            \})
        else
        endif
    endfor

    return l:output

endfunction
