" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

Plug 'vim-scripts/cmdline-completion'

Plug 'vim-scripts/SyntaxComplete'
" SyntaxComplete {{{
autocmd Filetype *
      \	if &omnifunc == "" |
      \		setlocal omnifunc=syntaxcomplete#Complete |
      \	endif
" }}}
Plug 'Shougo/neocomplete.vim'
" neocomplete {{{
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 0
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 2
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
  " <TAB>: completion.
  "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplete#sources#omni#input_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}
Plug 'artur-shaik/vim-javacomplete2'
" javacomplete2 {{{
  let g:JavaComplete_MavenRepositoryDisable = 1
  let g:JavaComplete_GradleRepositoryDisabled = 1
  let g:JavaComplete_JavaviDebug = 1
  let g:JavaComplete_ImportOrder = []
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  " TODO: figure out why call JCstart in autocmd will get vim stuck on startup.
  let g:JaveComplete_AutoStartServer = 0
  function JavacompleteStart(timer)
    " Cleanup legacy process, for some reason the java process has been left
    " over after vim terminated.
    call job_start(
          \['bash', '-c', 'pgrep -f -P 1 -- "java -Djava.system.class.loader=magicjar" | xargs -r -n 1 kill -9'],
          \{'out_io': 'null'}
          \)
    JCstart
  endfunction
  autocmd Filetype java call timer_start(100, 'JavacompleteStart')
" }}}
