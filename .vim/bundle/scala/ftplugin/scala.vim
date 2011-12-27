" Vim filetype plugin file
" Language:	Scala
" Maintainer:	Tim Green <iamtimgreen at gmail dot com>
" Last Change:  2011-12-28
" URL: https://github.com/timgreen/timgreenhomeconfig/blob/master/.vim/ftplugin/scala.vim

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

" Base on java plugin
call SetTabIndent(2)
call SetTextWidth(100)

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C

" For filename completion, prefer the .scala extension over the .class
" extension.
set suffixes+=.class

" Enable gf on import statements.  Convert . in the package
" name to / and append .scala to the name, then search the path.
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.scala
if exists("g:ftplugin_scala_source_path")
    let &l:path=g:ftplugin_scala_source_path . ',' . &l:path
endif

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal formatoptions-=t formatoptions+=croql

" Set 'comments' to format dashed lists in comments. Behaves just like C.
setlocal comments& comments^=sO:*\ -,mO:*\ \ ,exO:*/

setlocal commentstring=//%s

" Change the :browse e filter to primarily show Scala-related files.
if has("gui_win32")
    let  b:browsefilter="Scala Files (*.scala)\t*.scala\n" .
		\	"Java Files (*.java*)\t*.java*\n" .
		\	"Properties Files (*.prop*)\t*.prop*\n" .
		\	"Manifest Files (*.mf)\t*.mf\n" .
		\	"All Files (*.*)\t*.*\n"
endif

" Undo the stuff we changed.
let b:undo_ftplugin = "setlocal suffixes< suffixesadd<" .
		\     " formatoptions< comments< commentstring< path< includeexpr<" .
		\     " | unlet! b:browsefilter"

" Restore the saved compatibility options.
let &cpo = s:save_cpo
