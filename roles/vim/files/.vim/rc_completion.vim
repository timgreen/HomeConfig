" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

Plug 'vim-scripts/cmdline-completion'

Plug 'vim-scripts/SyntaxComplete'
" SyntaxComplete {{{
autocmd Filetype *
      \	if &omnifunc == "" |
      \		setlocal omnifunc=syntaxcomplete#Complete |
      \	endif
" }}}
