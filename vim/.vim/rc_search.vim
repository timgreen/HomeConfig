" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

set hlsearch
set ignorecase       " case insensitive by default
set mousehide        " Hide the mouse when typing text
set smartcase        " if there are caps, go case-sensitive
map th :nohlsearch<CR>:Mark<CR>

Plug 'henrik/vim-indexed-search'
Plug 'haya14busa/vim-asterisk' | Plug 'inside/vim-search-pulse'
let g:indexed_search_mappings = 0
let g:vim_search_pulse_disable_auto_mappings = 1
nmap *  <Plug>(asterisk-z*)<Plug>Pulse
nmap #  <Plug>(asterisk-z#)<Plug>Pulse
nmap g* <Plug>(asterisk-gz*)<Plug>Pulse
nmap g# <Plug>(asterisk-gz#)<Plug>Pulse
nmap n n<Plug>Pulse
nmap N N<Plug>Pulse
" Pulses cursor line on first match
" when doing search with / or ?
cmap <silent> <expr> <enter> search_pulse#PulseFirst()
augroup Pulse
  autocmd! User PostPulse
  autocmd  User PostPulse ShowSearchIndex
augroup END

Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 0
let g:clever_f_chars_match_any_signs = ';'
" Disable https://github.com/rhysd/clever-f.vim/issues/11
" nmap <Esc> <Plug>(clever-f-reset)

Plug 'vim-scripts/Mark--Karkat'
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
set viminfo+=!

Plug 'rking/ag.vim'
let g:ackprg="ag --nocolor --nogroup --column"

Plug 'dyng/ctrlsf.vim'
