" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

au BufWritePost *
      \	if &filetype == "" |
      \   filetype detect  |
      \	endif

Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim.
" vim-polyglot {{{
  "" markdown
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_math = 1
" }}}
Plug 'editorconfig/editorconfig-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tomtom/tcomment_vim'
" Markdown
Plug 'SidOfc/mkdx' " some nice extra's for working with markdown documents
" {{{ mkdx
  let g:mkdx#settings = {}
  let g:mkdx#settings.tokens = { 'list': '*' }
  let g:mkdx#settings.checkbox = { 'toggles': [' ', 'x'], 'update_tree': 0 }
  let g:mkdx#settings.tokens = { 'strike': '~~' }
  let g:mkdx#settings.highlight = { 'enable': 1 }
  let g:mkdx#settings.fold = { 'enable': 1 }
  " Open TOC using fzf instead of quickfix window {{{
  " https://github.com/SidOfc/mkdx#open-toc-using-fzf-instead-of-quickfix-window
  fun! s:MkdxGoToHeader(header)
    " given a line: '  84: # Header'
    " this will match the number 84 and move the cursor to the start of that line
    call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
  endfun

  fun! s:MkdxFormatHeader(key, val)
    let text = get(a:val, 'text', '')
    let lnum = get(a:val, 'lnum', '')

    " if the text is empty or no lnum is present, return the empty string
    if (empty(text) || empty(lnum)) | return text | endif

    " We can't jump to it if we dont know the line number so that must be present in the outpt line.
    " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
    return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
  endfun

  fun! s:MkdxFzfQuickfixHeaders()
    " passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
    " this allows you to create a 'source' for fzf.
    " first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
    " then, we strip out any remaining empty headers.
    let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')

    " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
    " supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
    call fzf#run(fzf#wrap(
          \ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
          \ ))
  endfun

  " finally, map it -- in this case, I mapped it to overwrite the default action for toggling quickfix (<PREFIX>I)
  nnoremap <silent> <Leader>I :call <SID>MkdxFzfQuickfixHeaders()<Cr>
  " }}}
" }}}
Plug 'jxnblk/vim-mdx-js'
Plug 'dpelle/vim-LanguageTool', {
  \ 'do': 'brew install languagetool' }
" LanguageTool {{{
  let g:languagetool_jar='/home/linuxbrew/.linuxbrew/Cellar/languagetool/4.0/libexec/languagetool-commandline.jar'
" }}}
" Typescript
Plug 'Quramy/tsuquyomi', {
  \ 'do': 'npm -g install typescript',
  \ 'for': ['typescript'] }
" tsuquyomi {{{
  let g:tsuquyomi_single_quote_import = 1
  let g:tsuquyomi_completion_detail = 1
  let g:tsuquyomi_definition_split = 3 " tabedit
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" }}}
Plug 'peitalin/vim-jsx-typescript'
Plug 'alunny/pegjs-vim'

" Misc {{{
Plug 'arthurxavierx/vim-caser'
" }}}
