" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

set nocompatible " explicitly get out of vi-compatible mode
let mapleader = ","
filetype plugin indent on
if !exists("syntax_on")
  syntax on
endif

" Color {{{
set t_Co=256
if (has("termguicolors"))
  set termguicolors
  set t_8b=[48;2;%lu;%lu;%lum
  set t_8f=[38;2;%lu;%lu;%lum
endif
"" disable Background Color Erase (BCE) {{{
if &term =~ '256color'
  set t_ut=
endif
"" }}}
"" italics {{{
set t_ZH=[3m
set t_ZR=[23m
"" }}}
" }}} Color
" indent {{{
set autoindent
set smartindent
set cindent
" }}} indent
" autochdir {{{
" always switch to the current directory of the file you are editing
" see http://vim.wikia.com/wiki/Change_to_the_directory_of_the_current_file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
" }}} autochdir
" undo {{{
" Maintain undo history between sessions
let undodir = expand($HOME . '/.vim/undodir')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
set undofile
let &undodir = undodir
set undolevels=1000
set undoreload=10000
" }}} undo
" forcing use hjkl {{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}
" Have the indent commands re-highlight the last visual selection {{{
" to make multiple indentations easier
vnoremap > >gv
vnoremap < <gv
" }}}
" modeline {{{
set modeline
set modelines=5
" }}}
" Misc {{{
set mouse=
set noswapfile
set switchbuf+=usetab,newtab " launch files in new tab in quickfix list
" }}} Misc
" map nop {{{
map  <F1> <Nop>
map! <F1> <Nop>
"" disable delete in mac
imap [3~ <Nop>
" }}}
