" Vim compiler file
" Compiler:	g++
" Maintainer:	Tim Green
" Last Change:	2005 Feb 22

if exists("current_compiler")
  finish
endif
let current_compiler = "g++"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" A workable errorformat for Borland C
CompilerSet errorformat=%f:%l:\%m

" default make
CompilerSet makeprg=g++\ -o\ /mnt/ram/%:t:r\ -g\ %\ -Wall
