" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

"" Colorscheme 256
set background=dark
" Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
" " gruvbox {{{
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_strings = 1
" let g:gruvbox_italicize_comments = 1
" " }}}
Plug 'rakr/vim-one'
  let g:one_allow_italics = 1
call OnPlugLoad('vim-one', 'colorscheme one')

" UI
set concealcursor=n  " The cursor line concealed text is not hidden
set conceallevel=2
set cursorcolumn
set cursorline
set foldcolumn=4     " fold column width
set lazyredraw       " do not redraw while running macros
set matchtime=5      " how many tenths of a second to blink matching brackets for
set nowrap
set number           " turn on line numbers
set report=0         " tell us when anything is changed via :...
set ruler
set scrolloff=10     " Keep 5 lines (top/bottom) for scope
set shortmess=atToOI " shortens messages
set showcmd          " show the command being typed
set showmatch        " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the size
set ttyfast

" Wild
"set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore these
set wildmenu " turn on command line completion
set wildmode=full " turn on wild menu with full match

Plug 'itchyny/lightline.vim'
" lightline config {{{
  set laststatus=2
  set noshowmode
  let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['filename', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'], ['filetype']]
  \ },
  \ 'component_expand': {
  \   'linter_warnings': 'LightlineLinterWarnings',
  \   'linter_errors': 'LightlineLinterErrors',
  \   'linter_ok': 'LightlineLinterOK'
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error'
  \ },
  \ }

  function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
  endfunction

  function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
  endfunction

  function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    let l:linters_count = len(ale#linter#Get(&filetype))
    " Only show ✓ if there is enabled linter for this filetype.
    return l:linters_count != 0 && l:counts.total == 0 ? '✓ ' : ''
  endfunction

  autocmd User ALELint call s:MaybeUpdateLightline()

  " Update and show lightline but only if it's visible (e.g., not in Goyo)
  function! s:MaybeUpdateLightline()
    if exists('#lightline')
      call lightline#update()
    end
  endfunction
  set showtabline=2  " Show tabline
  set guioptions-=e  " Don't use GUI tabline
  let g:lightline.tabline = {
    \   'left': [ ['tabs'] ],
    \   'right': [ ['close'] ]
    \ }
" }}} lightline config

Plug 'Yggdroot/indentLine'
" indentline {{{
  let g:indentLine_enabled = 1
  let g:indentLine_char = '│'
  let g:indentLine_setConceal = 0
" }}}

Plug 'w0rp/ale'
" ALE {{{
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = get(g:, 'ale_fixers', {})
  let g:ale_fixers.javascript = ['prettier']
  let g:ale_fixers.typescript = ['prettier']
  let g:ale_fixers.json = ['prettier']
  let g:ale_fixers.css = ['prettier']
  let g:ale_fixers.java = ['google_java_format']
  let prettier_options = '--config=' . expand('~/.prettierrc.yml')
  let g:ale_javascript_prettier_options = prettier_options
  let g:ale_typescript_prettier_options = prettier_options
  let g:ale_json_prettier_options = prettier_options
  let g:ale_css_prettier_options = prettier_options
  let g:ale_pattern_options = {
  \  '.*/node_modules/.*': {'ale_enabled': 0},
  \  '.*/build/.*': {'ale_enabled': 0},
  \}
  " remark
  function! ALEFixerRemark(buffer)
    return {
    \   'command': 'remark',
    \}
  endfunction
  function! ALEConfigRemarkFixer()
    call ale#fix#registry#Add('remark', 'ALEFixerRemark', ['markdown'], 'Fix Markdown files with remark.')
    let g:ale_fixers = get(g:, 'ale_fixers', {})
    let g:ale_fixers.markdown = ['remark']
  endfunction
  call OnPlugLoad('ale', 'call ALEConfigRemarkFixer()')
" }}}

Plug 'ryanoasis/vim-devicons'
" vim-devicons {{{
  function! DevIconsFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  function! DevIconsFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction
  if !exists('g:lightline.component_function')
    let g:lightline.component_function = {}
  endif
  let g:lightline.component_function.filetype = 'DevIconsFiletype'
  let g:lightline.component_function.fileformat = 'DevIconsFileformat'
" }}}

Plug 'mhinz/vim-startify'
" vim-startify {{{
  let g:startify_enable_unsafe = 1
" }}}
