" File Name:   removeTrailingSpace.vim
"
" Author: 	   Sudipta Ghorui <sudipta05@gmail.com>
"
" Credits: 	   Bitan Kundu <bitan@alumnux.com>
"			   who always suggested me to do this manualy
"
" Last Modified: 05 May 2006
"
" Description: removes the trailing space from the file when user will save
" 			   any changes.
"              To force the time stamp to be not updated, use the command:
"              		:NOMODSP
"              To change it back, use
"              		:MODSP
"
" Things To Remember:  nothing

" Initialise the variables: {{{1
let s:searchString = '\s\+$'
let s:newString = ''

" Main Function: {{{1
function! FindAndChange()
	if exists('b:nomodsp') && b:nomodsp
		return
	end
	let pos = line('.').' | normal! '.virtcol('.').'|'
	0
	let searchPos = search(s:searchString)

    " Find and replace the trailing spaces  {{{1
	while searchPos > 0 && &modifiable
		exe 's/'.s:searchString.'/'.s:newString.'/e'
		call s:RemoveLastHistoryItem()
		let searchPos = search(s:searchString)
	endwhile

	exe pos
endfunction

" Call the function: {{{1
augroup LastModified
    au!
	au BufWritePre * :call FindAndChange()
augroup END

" Remove history: {{{1
function! <SID>RemoveLastHistoryItem()
  call histdel("/", -1)
  let @/ = histget("/", -1)
endfunction

" Modify the commands: {{{1
com! -nargs=0 NOMODSP :let b:nomodsp = 1
com! -nargs=1 MODSP   :let b:nomodsp = 0

" vim:ts=4:sw=4:noet fdm=marker
