" vim: set ft=vim foldmethod=indent shiftwidth=2 st=2 ts=2:

function! s:RunAndEcho(cmd)
  exe a:cmd
  echo a:cmd
endfunction


function! TODOQFixToggle()
  if bufname("%") == ""
    cclose
    unlet w:qfix_win
  elseif exists("w:qfix_win")
    cclose
    unlet w:qfix_win
  else
    vimgrep /TODO\|FIXME/gj %
    let w:qfix_win=bufname("%")
    copen 10
  endif
endfunction
map  <F3> <ESC>:call TODOQFixToggle()<CR>
map! <F3> <ESC>:call TODOQFixToggle()<CR>

map tq :cclose<CR>

function! ToggleWrap()
  if &wrap
    call s:RunAndEcho('set nowrap')
  else
    call s:RunAndEcho('set wrap')
  endif
endfunction
map tw :call ToggleWrap()<CR>

function! ToggleCheckSpell()
  if &spell
    call s:RunAndEcho('set nospell')
  else
    call s:RunAndEcho('set spell')
  endif
endfunction
map ts :call ToggleCheckSpell()<CR>

function! ToggleCursorColumn()
  if &cursorcolumn
    call s:RunAndEcho('set nocursorcolumn')
  else
    call s:RunAndEcho('set cursorcolumn')
  endif
endfunction
map tc :call ToggleCursorColumn()<CR>

function! ToggleFoldColumn()
  if &foldcolumn
    call s:RunAndEcho('set foldcolumn=0')
  else
    call s:RunAndEcho('set foldcolumn=4')
  endif
endfunction
map tf :call ToggleFoldColumn()<CR>

function! ToggleRelativeNumber()
  if &relativenumber
    call s:RunAndEcho('set norelativenumber')
  else
    call s:RunAndEcho('set relativenumber')
  endif
endfunction
map tn :call ToggleRelativeNumber()<CR>

