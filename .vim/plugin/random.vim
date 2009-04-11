" Vim script file
" Maintainer: Mikolaj Sitarz <sitarz@gmail.com>
" License: This file is distributed under Vim license
"
" Implementation of congruential pseudo-random numbers generator

" script variables"{{{
let s:intmax =  2147483647
let s:rmod = 16807
let s:first_use = 1
let s:seed = 1
"}}}

" s:initialize() - initialize generator"{{{
function! s:initialize() 
    let s:first_use = 0
    let s:seed = localtime()
    let n = 1
    while n < 15
        call s:srand()
        let n = n + 1
    endwhile
endfunction
"}}}
 
" s:srand() - return random between intmin and intmax "{{{
function! s:srand()
    let s:seed = s:seed * s:rmod
    return s:seed
endfunction
"}}}

" s:abs(n) - return absolute value of n "{{{
function! s:abs(n)
    if a:n < 0
        return -a:n
    else
        return a:n
    endif
endfunction
"}}}
 
" s:urand(nrange) - return random number between 0 and nrange "{{{
function! s:urand(nrange)
    let rnd = s:abs(s:srand())
    while rnd > a:nrange
        let rnd = s:abs(s:srand())
    endwhile
    return rnd
endfunction
"}}}

" Random(lower,upooer) - return pseudo-random number from the given range"{{{
" (including both limits)
"
function! Random(lower,upper)
    if s:first_use == 1
        call s:initialize()
    endif
    let delta = (a:upper - a:lower + 1)
    let rest = s:intmax % delta
    let nrange = s:intmax - rest
    let rnd = s:urand(nrange)
    let drange = nrange / delta
    return (rnd / drange) + a:lower
endfunction
 "}}}
 
" vim: foldmethod=marker shiftwidth=4
