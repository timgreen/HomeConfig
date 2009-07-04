" Vim color file
" Maintainer:   Tim Green <iamtimgreen@gmail.com>
" Last Change:  2009 Api 20
" Version:      0.1
"
" A dark color scheme.

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "timgreen"

" Helper functions {{{
" returns an approximate grey index for the given grey level
fun s:grey_number(x)
    if &t_Co == 88
        if a:x < 23
            return 0
        elseif a:x < 69
            return 1
        elseif a:x < 103
            return 2
        elseif a:x < 127
            return 3
        elseif a:x < 150
            return 4
        elseif a:x < 173
            return 5
        elseif a:x < 196
            return 6
        elseif a:x < 219
            return 7
        elseif a:x < 243
            return 8
        else
            return 9
        endif
    else
        if a:x < 14
            return 0
        else
            let l:n = (a:x - 8) / 10
            let l:m = (a:x - 8) % 10
            if l:m < 5
                return l:n
            else
                return l:n + 1
            endif
        endif
    endif
endfun

" returns the actual grey level represented by the grey index
fun s:grey_level(n)
    if &t_Co == 88
        if a:n == 0
            return 0
        elseif a:n == 1
            return 46
        elseif a:n == 2
            return 92
        elseif a:n == 3
            return 115
        elseif a:n == 4
            return 139
        elseif a:n == 5
            return 162
        elseif a:n == 6
            return 185
        elseif a:n == 7
            return 208
        elseif a:n == 8
            return 231
        else
            return 255
        endif
    else
        if a:n == 0
            return 0
        else
            return 8 + (a:n * 10)
        endif
    endif
endfun

" returns the palette index for the given grey index
fun s:grey_color(n)
    if &t_Co == 88
        if a:n == 0
            return 16
        elseif a:n == 9
            return 79
        else
            return 79 + a:n
        endif
    else
        if a:n == 0
            return 16
        elseif a:n == 25
            return 231
        else
            return 231 + a:n
        endif
    endif
endfun

" returns an approximate color index for the given color level
fun s:rgb_number(x)
    if &t_Co == 88
        if a:x < 69
            return 0
        elseif a:x < 172
            return 1
        elseif a:x < 230
            return 2
        else
            return 3
        endif
    else
        if a:x < 75
            return 0
        else
            let l:n = (a:x - 55) / 40
            let l:m = (a:x - 55) % 40
            if l:m < 20
                return l:n
            else
                return l:n + 1
            endif
        endif
    endif
endfun

" returns the actual color level for the given color index
fun s:rgb_level(n)
    if &t_Co == 88
        if a:n == 0
            return 0
        elseif a:n == 1
            return 139
        elseif a:n == 2
            return 205
        else
            return 255
        endif
    else
        if a:n == 0
            return 0
        else
            return 55 + (a:n * 40)
        endif
    endif
endfun

" returns the palette index for the given R/G/B color indices
fun s:rgb_color(x, y, z)
    if &t_Co == 88
        return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
        return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun s:color(r, g, b)
    " get the closest grey
    let l:gx = s:grey_number(a:r)
    let l:gy = s:grey_number(a:g)
    let l:gz = s:grey_number(a:b)

    " get the closest color
    let l:x = s:rgb_number(a:r)
    let l:y = s:rgb_number(a:g)
    let l:z = s:rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
        " there are two possibilities
        let l:dgr = s:grey_level(l:gx) - a:r
        let l:dgg = s:grey_level(l:gy) - a:g
        let l:dgb = s:grey_level(l:gz) - a:b
        let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
        let l:dr = s:rgb_level(l:gx) - a:r
        let l:dg = s:rgb_level(l:gy) - a:g
        let l:db = s:rgb_level(l:gz) - a:b
        let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
        if l:dgrey < l:drgb
            " use the grey
            return s:grey_color(l:gx)
        else
            " use the color
            return s:rgb_color(l:x, l:y, l:z)
        endif
    else
        " only one possibility
        return s:rgb_color(l:x, l:y, l:z)
    endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun s:rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return s:color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun s:X(group, fg, bg, attr)
    if a:fg != ""
        exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . s:rgb(a:fg)
    endif
    if a:bg != ""
        exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . s:rgb(a:bg)
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
endfun
" }}}

hi Constant		term=underline ctermfg=LightGray                 guifg=White   gui=NONE
hi Identifier	term=underline ctermfg=DarkGray                  guifg=#00ffff
hi Ignore					   ctermfg=Black	                 guifg=bg
hi PreProc		term=underline ctermfg=LightBlue                 guifg=Wheat
hi Special		term=bold	   ctermfg=LightRed                  guifg=magenta
hi Statement	term=bold	   ctermfg=Yellow	                 guifg=#ffff00 gui=NONE
hi Type						   ctermfg=White  guifg=grey	gui=none
hi Error		term=reverse   ctermbg=Red	      ctermfg=White guibg=Red  guifg=White
hi Todo			term=standout  ctermbg=Yellow     ctermfg=Black guifg=Blue guibg=Yellow
"
hi Directory	term=bold	   ctermfg=LightCyan  guifg=Cyan
hi ErrorMsg		term=standout  ctermbg=DarkRed	  ctermfg=White guibg=Red guifg=White
hi ModeMsg		term=bold	   cterm=bold		  gui=bold
hi MoreMsg		term=bold	   ctermfg=LightGreen gui=bold		guifg=SeaGreen
hi NonText		term=bold	   ctermfg=Blue		  gui=bold		guifg=Blue
hi Question		term=standout  ctermfg=LightGreen gui=bold		guifg=Cyan
hi SpecialKey	term=bold	   ctermfg=LightBlue  guifg=Cyan
hi StatusLine	term=reverse,bold cterm=reverse   gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=#333333
hi Title		term=bold	   ctermfg=LightMagenta gui=bold	guifg=Pink
hi WarningMsg	term=standout  ctermfg=LightRed   guifg=Red
hi Visual		term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=darkgreen

"
call s:X("Normal"      , "87FF90", ""      , "")
" Fold
call s:X("Folded"      , "FFD700", "222222", "")
call s:X("FoldColumn"  , "D2B48C", "444444", "")
" LineNr
call s:X("LineNr"      , "FFAA90", "222222", "")
" Cursor
 "" Cursor
 "" CursorIM
call s:X("CursorLine"  , ""      , ""      , "underline")
call s:X("CursorColumn", ""      , "6C6C6C", "")
" Search
call s:X("Search"      , ""      , "FFFF95", "")
hi link IncSearch	Search
" Comment
call s:X("Comment"     , "87CEEB", ""      , "")

" UI
call s:X("TabLineFill" , "888888", "444444", "underline")
call s:X("TabLine"     , "888888", "444444", "underline")
call s:X("TabLineSel"  , "87FF90", "000000", "bold")
""  StatusLine
""  StatusLineNC

""  Directory
""  DiffAdd
""  DiffChange
""  DiffDelete
""  DiffText
""  ErrorMsg
""  VertSplit
""  SignColumn
""  MatchParen
""  ModeMsg
""  MoreMsg
""  NonText
""  Pmenu
""  PmenuSel
""  PmenuSbar
""  PmenuThumb
""  Question
""  SpecialKey
""  SpellBad
""  SpellCap
""  SpellLocal
""  SpellRare
""  Title
""  Visual
""  VisualNOS
""  WarningMsg
""  WildMenu

" Delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}


" vim: set fdl=0 fdm=marker:
