function! ale_handlers#scala#bazel#Handle(buffer, lines) abort
    " Matches against lines like the following:
    "
    " path/to/file.scala:5: error: not found: type Args
    " path/to/file.scala:3: warning: Unused import
    let l:pattern = '^[^:]\+:\(\d\+\):\s*\(\([^:]\+\).*\)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'text': l:match[2],
        \   'type': l:match[3] =~? 'error' ? 'E' : 'W',
        \})
    endfor

    return l:output

endfunction
