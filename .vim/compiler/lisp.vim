" Vim compiler file
" Compiler:	lisp
" Maintainer:	Tim Green
" Last Change:	2005 Feb 22

if exists("current_compiler")
  finish
endif
let current_compiler = "lisp"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" A workable errorformat for Clisp
CompilerSet errorformat=%A%[A-Z]%#\ in\ %.%#%l\ %c\ %.%#,%Z%m

" default make
CompilerSet makeprg=clisp\ -c\ %
