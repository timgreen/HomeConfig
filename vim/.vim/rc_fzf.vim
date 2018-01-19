" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" fzf {{{
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_buffers_jump = 1
  let g:fzf_layout = { 'right': '40%' }

  function! Fzf_git_sink(line)
    let parts = split(a:line, '|')
    exec 'tabedit' parts[0]
  endfunction

  command! -bang FzfGit call fzf#run({
        \ 'source': 'COLUMNS=1000 git diff --stat --relative --color HEAD',
        \ 'sink': function('Fzf_git_sink'),
        \ 'options': '--ansi --multi --reverse --header="Opened files in git client:" --preview="echo {} | cut -d\"|\" -f 1 | xargs git diff --color HEAD"',
        \ 'down': '30%'
        \})
  command! -bang FzfGit1 call fzf#run({
        \ 'source': 'COLUMNS=1000 git diff --stat --relative --color HEAD^',
        \ 'sink': function('Fzf_git_sink'),
        \ 'options': '--ansi --multi --reverse --header="Changed files in last git commit:" --preview="echo {} | cut -d\"|\" -f 1 | xargs git diff --color HEAD^"',
        \ 'down': '30%'
        \})
  map <Space>b :FzfBuffers<CR>
  map <Space>w :FzfWindows<CR>
  map <Space>: :FzfCommands!<CR>
  map <Space>H :FzfHelptags<CR>
" }}}
