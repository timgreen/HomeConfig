" Vim script file
" Maintainer: Mikolaj Sitarz <sitarz@gmail.com>
" License: This file is distributed under Vim license
" Version: 0.1

" This Vim script allows: viewing, downloading, and displaying random position
" of "Best Vim Tips" from the page: http://rayninfo.co.uk/vimtips.html
"
" Usage:
"
" <Leader>dt (or :call DisplayVimTips()) - display "Best Vim Tips" in separate
" buffer (download it, if the file is not present)
"
" <Leader>rt (or :call DisplayRandomTip()) - display random position in
" vimtips.txt (download if necessary)
"
" <Leader>gt (or :call GetVimTips()) - download and parse "Best Vim Tips".
" File is saved in ~/.vim/vimtips.txt (~/vimfiles/vimtips.txt under windows)
"  

" variables  {{{
let s:tipsurl = "http://rayninfo.co.uk/vimtips.html"

if has("win32")
    let s:tipfile = expand("~/vimfiles/vimtips.txt")
else
    let s:tipfile = expand("~/.vim/vimtips.txt")
endif
"}}}

" functions {{{1


" s:gotoBuffer(name) - go to chosen buffer "{{{
function! s:gotoBuffer(name)
    if bufloaded(a:name)
        while expand("%") == ''
            wincmd w
        endwhile
        execute "buffer " . a:name
    else
        execute "split " . a:name
    endif
endfunction
"}}}

" s:download(url) "{{{
function! Download(url)
    if has("python")
    python << EOF
import vim, urllib
url = vim.eval("a:url")
u = urllib.urlopen(url)
vim.current.buffer.append(u.readlines())
u.close()
EOF
    else
        execute "Nread " . a:url
    endif
endfunction
"}}}

"{{{ GetVimTips() - get tips from the internet
function! GetVimTips()
    if filereadable(s:tipfile) == 1
        let srcfile = s:tipfile
        let bakfile = s:tipfile . ".bak"
        call rename(srcfile, bakfile)
    endif
    call s:gotoBuffer(s:tipfile)
    set noreadonly
    setlocal fenc=
    call Download(s:tipsurl)
    call search("__BEGIN__")
    normal dgg
    call search("__END__")
    normal dG
    %s/&lt;/</g
    write
    normal gg
    set readonly
endfunction
"}}}

"{{{ DisplayVimTips()
function! DisplayVimTips()
    if filereadable(s:tipfile) == 0
        call GetVimTips()
    else
        "execute "split " . s:tipfile
        call s:gotoBuffer(s:tipfile)
    endif
endfunction
"}}}

" DisplayRandomTip() "{{{
function! DisplayRandomTip()
    if !exists("*Random()")
        echoerr "Can not find random plugin"
    else
        call DisplayVimTips()
        let n = line("$")
        execute Random(1,n)
    endif
endfunction
"}}}

"1}}}

" menu"{{{
amenu &Plugin.&Vim\ Tips.&Display\ tips<Tab><Leader>dt :call DisplayVimTips()<CR>
amenu &Plugin.&Vim\ Tips.&Random\ tip<Tab><Leader>rt :call DisplayRandomTip()<CR>
amenu &Plugin.&Vim\ Tips.&Get\ tips\ (download)<Tab><Leader>gt :call GetVimTips()<CR>
"}}}
 
" mappings "{{{
map <Leader>dt :call DisplayVimTips()<CR>
map <Leader>rt :call DisplayRandomTip()<CR>
map <Leader>gt :call GetVimTips()<CR>
" }}}

" vim: foldmethod=marker shiftwidth=4
