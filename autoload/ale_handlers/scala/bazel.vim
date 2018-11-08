function! ale_handlers#scala#bazel#Handle(buffer, lines) abort
  echom 'ale-bazel handling buffer ' . a:buffer . ' and lines ' . string(a:lines)
  return []
endfunction
