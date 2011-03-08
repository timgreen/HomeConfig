compiler g++
map! <F5> <ESC>:w<CR><ESC>:! /mnt/ram/%:t:r<CR>
map! <F7> <ESC>:w<CR><ESC>:! g++ % -O2 -o /mnt/ram/%:t:r<CR>
map! <F4> <ESC>:! gdb /mnt/ram/%:t:r<CR>
map  <F5> <ESC>:w<CR><ESC>:! /mnt/ram/%:t:r<CR>
map  <F7> <ESC>:w<CR><ESC>:! g++ % -O2 -o /mnt/ram/%:t:r<CR>
map  <F4> <ESC>:! gdb /mnt/ram/%:t:r<CR>
call SetTabIndent(2)
call SetTextWidth(80)
call SetIMAP()
