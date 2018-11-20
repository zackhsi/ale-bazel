function! ale_handlers#scala#bazel#Handle(buffer, lines) abort
    " Matches against lines like the following:
    "
    " path/to/file.scala:5: error: not found: type Args
    " path/to/file.scala:3: warning: Unused import
    let l:pattern = '^[^:]\+:\(\d\+\):\s*\(\([^:]\+\).*\)$'
    let l:column_pattern = '^ *\^'
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
            " Look for column markers like '   ^' second.
            " The column index will be set according to how long the line is.
            let l:column_match = matchstr(l:line, l:column_pattern)
            if !empty(l:column_match) && !empty(l:output)
                let l:output[-1].col = len(l:column_match)
            endif


        endif
    endfor

    return l:output

endfunction
