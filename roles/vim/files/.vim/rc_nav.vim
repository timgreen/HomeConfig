" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

"" forcing use of tabs
nnoremap gf <C-w>gf
cab      e  tab drop

"" tab nav
map <Space>p :tabprevious<CR>
map <Space>n :tabnext<CR>
map <Space>h :tabprevious<CR>
map <Space>l :tabnext<CR>
map <Space>1 :tabfirst<CR>
map <Space>2 :tabnext 2<CR>
map <Space>3 :tabnext 3<CR>
map <Space>4 :tabnext 4<CR>
map <Space>5 :tabnext 5<CR>
map <Space>6 :tabnext 6<CR>
map <Space>7 :tabnext 7<CR>
map <Space>8 :tabnext 8<CR>
map <Space>9 :tabnext 9<CR>
map <Space>- :tabnext 10<CR>
map <Space>= :tabnext 11<CR>
let g:lasttab = 1
map <Space><Space> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

""
Plug 'scrooloose/nerdtree'
Plug 'wsdjeg/vim-fetch' " support vim path/to/file.ext:12:3
