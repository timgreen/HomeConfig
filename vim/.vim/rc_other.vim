" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

Plug 'asins/vim-dict'
Plug 'godlygeek/tabular'
Plug 'timgreen/vim-re-edit-all'
let g:vim_re_edit_all_map_keys = 0
Plug 'tpope/vim-eunuch' " mainly for SudoWrite
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/FencView.vim'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/genutils'
Plug 'vim-scripts/libList.vim'
" git {{{
Plug 'vim-scripts/gitdiff.vim'
Plug 'airblade/vim-gitgutter'
" }}} git
Plug 'chip/vim-fat-finger' " Auto correct typo
function! SetFatFingers()
  iabbrev stirng string
  iabbrev Stirng String
  iabbrev funciton function
  iabbrev Funciton Function
  iabbrev questoin question
  iabbrev Questoin Question
endfunction
call OnPlugLoad('vim-fat-finger', 'call SetFatFingers()')
Plug 'tpope/vim-speeddating' " use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'junegunn/vim-peekaboo' " Peekaboo extends \" and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'sjl/splice.vim' " three-way merges
" Helper functions {{{
" Set default indent and tab
function! SetTabIndent(i)
  set linebreak
  exe "setlocal shiftwidth=" . a:i
  exe "setlocal tabstop=" . a:i
  exe "setlocal softtabstop=" . a:i
  exe "setlocal ts=" . a:i
  setlocal smarttab
  setlocal expandtab
  setlocal smartindent
  setlocal ai
  setlocal shiftround
endfunction
"call SetTabIndent(2)

function SetTextWidth(i)
  exe "set textwidth=" . a:i
  if &textwidth != 0
    setlocal colorcolumn=+0,+20,-20
  endif
endfunction
" }}} Helper functions
