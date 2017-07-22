" vim-arpeggio {{{
Arpeggio inoremap jk  <Esc>
Arpeggio inoremap fj  <Esc>
" }}}
" vimwiki {{{
" Fix the ft that conflict with vim-markdown
augroup filetypedetect
  au! BufRead,BufNewFile */vimwiki/*        set filetype=vimwiki
augroup END
" }}}
