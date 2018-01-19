" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

" Config netrw
let g:netrw_keepdir = 0
"" absolute width of netrw window
let g:netrw_winsize = -28
"" tree-view
let g:netrw_liststyle = 3
"" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
""
autocmd FileType netrw setl bufhidden=delete
