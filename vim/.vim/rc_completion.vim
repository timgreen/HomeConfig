" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

Plug 'vim-scripts/cmdline-completion'

Plug 'vim-scripts/SyntaxComplete'
" SyntaxComplete {{{
autocmd Filetype *
      \	if &omnifunc == "" |
      \		setlocal omnifunc=syntaxcomplete#Complete |
      \	endif
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
Plug 'maralla/completor.vim', { 'do': 'make js' } " `make js` for ternjs
" {{
  inoremap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
  inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
  inoremap <expr> <cr> pumvisible() ? '<C-y><cr>' : '<cr>'

  Plug 'maralla/completor-typescript'
  let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  let g:completor_java_omni_trigger = '[^. \t0-9]\.\w*'
" }}}
