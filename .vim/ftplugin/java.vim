compiler javac
call SetTabIndent(4)
call SetIMAP()
map <F5> :!java %<<CR>
map! <F5> <ESC>:!java %<<CR>
nnoremap <silent> <F8> :JavaBrowser<CR>
