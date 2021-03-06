" =================================================================
" Author - Tom Schumm <phong@phong.org>
" Old, all-encompaing color file
" =================================================================
let g:colors_name="phong"

" This lets you use bright backgrounds on some terminals that otherwise
" don't allow it (via the "blink" attribute). Doesn't work with the
" 'reverse' attribute, but could be made to do so (but is a waste of
" time because reverse is sorta redundant if you can explicitly specify
" a foreground and background)
if &term == "cygwin" || &term == "putty" || &term == "rxvt" " {{{
    set t_Co=16
    set t_AF=[3%{7}%p1%&%d%{7}%p1%<%Pa%?%ga%t;1%;m
    set t_AB=[4%{7}%p1%&%d%{7}%p1%<%Pa%?%ga%t;5%;m
endif " }}}

if &term == "xterm"
    set t_Co=16
endif

" Konsole has a mostly undocumented way of specifying 24-bit colors, though we
" can only use (slightly less than) 16-bit in vim
if version >= 700 && (&term == "konsole" || &term == "konsole-16color") " {{{
    " The max value that seems can be passed as a ctermfg or ctermbg is 65534,
    " otherwise this would work.
    "
    " set t_Co=16777216
    " set t_AF=[38;2;%p1%{65536}%\/%d;%p1%{256}%\/%{255}%&%d;%p1%{255}%&%dm
    " set t_AB=[48;2;%p1%{65536}%\/%d;%p1%{256}%\/%{255}%&%d;%p1%{255}%&%dm

    " Color values are encoded as follows:
    "   Number in the range of 0-65534
    "   red = upper 5 bits * 255 / 31
    "   green = middle 6 bits * 255 / 63
    "   blue = lowest 5 bits * 255 / 31
    "
    " Vim won't store 65535 as a color number, so white is indicated as 65534 as
    " a special case

    set t_Co=65536
    set t_AB=[48;2;%p1%{2048}%\/%{255}%*%{31}%\/%d;%p1%{32}%\/%{63}%&%{255}%*%{63}%\/%d;%?%p1%{65534}%=%t%{255}%e%p1%{31}%&%{255}%*%{31}%\/%;%dm
    set t_AF=[38;2;%p1%{2048}%\/%{255}%*%{31}%\/%d;%p1%{32}%\/%{63}%&%{255}%*%{63}%\/%d;%?%p1%{65534}%=%t%{255}%e%p1%{31}%&%{255}%*%{31}%\/%;%dm
endif " }}}

" ----------------------------------------------------------------------
" We have a color term or gui
" ----------------------------------------------------------------------
if &t_Co >= 8 || has("gui_running")
    set background=dark
    if version >= 600
        hi clear
        syntax enable
    else
        syntax on
    endif
    set nohlsearch
    " We have GUI {{{
    if has("gui_running")
        set guifont=Ubuntu_Mono:h10:cANSI
        set lines=100 columns=120
        hi Normal guifg=#bbbbbb guibg=#000000 gui=NONE
        if ($USER) == "root"
            hi StatusLine guifg=#ffffff guibg=#b21818 gui=NONE
            hi User1 guifg=#ff5454 guibg=#b21818 gui=NONE
        else
            hi StatusLine guifg=#ffffff guibg=#5454ff gui=NONE
            hi User1 guifg=#ff5454 guibg=#5454ff gui=NONE
        endif
        hi Comment guifg=#5454ff gui=NONE
        hi Constant guifg=#54ff54 gui=NONE
        hi Delimiter guifg=#18b2b2 gui=NONE
        hi DiffAdd guifg=#ffff54 guibg=#18b218 gui=NONE
        hi DiffChange guifg=#ffffff guibg=#1818b2 gui=NONE
        hi DiffDelete guifg=#686868 guibg=#1818b2 gui=NONE
        hi DiffText guifg=#ffffff guibg=#18b218 gui=NONE
        hi Directory guifg=#54ffff gui=NONE
        hi Error guifg=#ffffff guibg=#ff5454 gui=NONE
        hi ErrorMsg guifg=#ffffff guibg=#b21818 gui=NONE
        hi Exception guifg=#18b218 gui=NONE
        hi FoldColumn guifg=#ffff54 guibg=#1818b2 gui=NONE
        hi Folded guifg=#54ff54 guibg=#1818b2 gui=NONE
        hi Identifier guifg=#ffff54 gui=NONE
        hi Ignore guifg=#686868 gui=NONE
        hi IncSearch guifg=#000000 guibg=#ffffff gui=NONE
        hi LineNr guifg=#b21818 gui=NONE
        hi MatchParen guifg=#ffff54 guibg=#18b2b2 gui=NONE
        hi ModeMsg guifg=#ffff54 guibg=#b21818 gui=NONE
        hi MoreMsg guifg=#54ff54 gui=NONE
        hi NonText guifg=#54ff54 gui=NONE
        hi Operator guifg=#18b2b2 gui=NONE
        hi PreProc guifg=#18b218 gui=NONE
        hi Question guifg=#54ff54 gui=NONE
        hi Search guifg=#000000 guibg=#ffff54 gui=NONE
        hi Special guifg=#54ffff gui=NONE
        hi SpecialKey guifg=#686868 guibg=#000000 gui=NONE
        hi Statement guifg=#ffffff gui=NONE
        hi StatusLineNC guifg=#b2b2b2 guibg=#686868 gui=NONE
        hi StorageClass guifg=#ffff54 gui=NONE
        hi Title guifg=#ff54ff gui=NONE
        hi Todo guifg=#18b2b2 guibg=#ffff54 gui=NONE
        hi Type guifg=#54ffff gui=NONE
        hi Underlined guifg=#5454ff gui=NONE,underline
        hi VertSplit guifg=#b2b2b2 guibg=#686868 gui=NONE
        hi VisibleWS guifg=#686868 gui=NONE
        hi Visual guifg=#000000 guibg=#18b2b2 gui=NONE
        hi VisualNOS guifg=#000000 guibg=#18b218 gui=NONE
        hi WarningMsg guifg=#ffffff guibg=#b26818 gui=NONE
        hi WildMenu guifg=#000000 guibg=#ffff54 gui=NONE
        hi cssBraces guifg=#18b2b2 gui=NONE
        hi htmlBold guifg=#ffffff gui=NONE
        hi htmlItalic guifg=#18b2b2 gui=NONE
        hi mySpecialChars guifg=#18b2b2 gui=NONE
        hi perlConditionalOperator guifg=#18b2b2 gui=NONE
        hi phpSemiComma guifg=#18b2b2 gui=NONE
        hi Pmenu guifg=#ff54ff guibg=#686868 cterm=NONE

    " }}}

    " Terminal, 16-bit color mode {{{
    elseif &t_Co >= 65536
        hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
        if ($USER) == "root"
            hi StatusLine ctermfg=65534 ctermbg=45251 cterm=NONE
            hi User1 ctermfg=64170 ctermbg=45251 cterm=NONE
        else
            hi StatusLine ctermfg=65534 ctermbg=21183 cterm=NONE
            hi User1 ctermfg=64170 ctermbg=21183 cterm=NONE
        endif
        hi Comment ctermfg=21183 cterm=NONE
        hi Constant ctermfg=22506 cterm=NONE
        hi Delimiter ctermfg=7574 cterm=NONE
        hi DiffAdd ctermfg=65514 ctermbg=7555 cterm=NONE
        hi DiffChange ctermfg=65534 ctermbg=6358 cterm=NONE
        hi DiffDelete ctermfg=27469 ctermbg=6358 cterm=NONE
        hi DiffText ctermfg=65534 ctermbg=7555 cterm=NONE
        hi Directory ctermfg=22527 cterm=NONE
        hi Error ctermfg=65534 ctermbg=64170 cterm=NONE
        hi ErrorMsg ctermfg=65534 ctermbg=45251 cterm=NONE
        hi Exception ctermfg=7555 cterm=NONE
        hi FoldColumn ctermfg=65514 ctermbg=6358 cterm=NONE
        hi Folded ctermfg=22506 ctermbg=6358 cterm=NONE
        hi Identifier ctermfg=65514 cterm=NONE
        hi Ignore ctermfg=27469 cterm=NONE
        hi IncSearch ctermfg=0 ctermbg=65534 cterm=NONE
        hi LineNr ctermfg=45251 cterm=NONE
        hi MatchParen ctermfg=65514 ctermbg=7574 cterm=NONE
        hi ModeMsg ctermfg=65514 ctermbg=45251 cterm=NONE
        hi MoreMsg ctermfg=22506 cterm=NONE
        hi NonText ctermfg=22506 cterm=NONE
        hi Operator ctermfg=7574 cterm=NONE
        hi PreProc ctermfg=7555 cterm=NONE
        hi Question ctermfg=22506 cterm=NONE
        hi Search ctermfg=0 ctermbg=65514 cterm=NONE
        hi Special ctermfg=22527 cterm=NONE
        hi SpecialKey ctermfg=27469 ctermbg=0 cterm=NONE
        hi Statement ctermfg=65534 cterm=NONE
        hi StatusLineNC ctermfg=46486 ctermbg=27469 cterm=NONE
        hi StorageClass ctermfg=65514 cterm=NONE
        hi Title ctermfg=64191 cterm=NONE
        hi Todo ctermfg=7574 ctermbg=65514 cterm=NONE
        hi Type ctermfg=22527 cterm=NONE
        hi Underlined ctermfg=21183 cterm=NONE,underline
        hi VertSplit ctermfg=46486 ctermbg=27469 cterm=NONE
        hi VisibleWS ctermfg=27469 cterm=NONE
        hi Visual ctermfg=0 ctermbg=7574 cterm=NONE
        hi VisualNOS ctermfg=0 ctermbg=7555 cterm=NONE
        hi WarningMsg ctermfg=65534 ctermbg=45891 cterm=NONE
        hi WildMenu ctermfg=0 ctermbg=65514 cterm=NONE
        hi cssBraces ctermfg=7574 cterm=NONE
        hi htmlBold ctermfg=65534 cterm=NONE
        hi htmlItalic ctermfg=7574 cterm=NONE
        hi mySpecialChars ctermfg=7574 cterm=NONE
        hi perlConditionalOperator ctermfg=7574 cterm=NONE
        hi phpSemiComma ctermfg=7574 cterm=NONE
        hi Pmenu ctermfg=7574 ctermbg=27469 cterm=NONE

    " }}}

    " Terminal, 256 color mode {{{
    elseif &t_Co >= 256
        hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
        if ($USER) == "root"
            hi StatusLine ctermfg=15 ctermbg=1 cterm=NONE
            hi User1 ctermfg=9 ctermbg=1 cterm=NONE
        else
            hi StatusLine ctermfg=15 ctermbg=12 cterm=NONE
            hi User1 ctermfg=9 ctermbg=12 cterm=NONE
        endif
        hi Comment ctermfg=12 cterm=NONE
        hi Constant ctermfg=10 cterm=NONE
        hi Delimiter ctermfg=6 cterm=NONE
        hi DiffAdd ctermfg=11 ctermbg=2 cterm=NONE
        hi DiffChange ctermfg=15 ctermbg=4 cterm=NONE
        hi DiffDelete ctermfg=8 ctermbg=4 cterm=NONE
        hi DiffText ctermfg=15 ctermbg=2 cterm=NONE
        hi Directory ctermfg=14 cterm=NONE
        hi Error ctermfg=15 ctermbg=9 cterm=NONE
        hi ErrorMsg ctermfg=15 ctermbg=1 cterm=NONE
        hi Exception ctermfg=2 cterm=NONE
        hi FoldColumn ctermfg=11 ctermbg=4 cterm=NONE
        hi Folded ctermfg=10 ctermbg=4 cterm=NONE
        hi Identifier ctermfg=11 cterm=NONE
        hi Ignore ctermfg=8 cterm=NONE
        hi IncSearch ctermfg=0 ctermbg=15 cterm=NONE
        hi LineNr ctermfg=1 cterm=NONE
        hi MatchParen ctermfg=11 ctermbg=6 cterm=NONE
        hi ModeMsg ctermfg=11 ctermbg=1 cterm=NONE
        hi MoreMsg ctermfg=10 cterm=NONE
        hi NonText ctermfg=10 cterm=NONE
        hi Operator ctermfg=6 cterm=NONE
        hi PreProc ctermfg=2 cterm=NONE
        hi Question ctermfg=10 cterm=NONE
        hi Search ctermfg=0 ctermbg=11 cterm=NONE
        hi Special ctermfg=14 cterm=NONE
        hi SpecialKey ctermfg=8 ctermbg=0 cterm=NONE
        hi Statement ctermfg=15 cterm=NONE
        hi StatusLineNC ctermfg=7 ctermbg=8 cterm=NONE
        hi StorageClass ctermfg=11 cterm=NONE
        hi Title ctermfg=13 cterm=NONE
        hi Todo ctermfg=6 ctermbg=11 cterm=NONE
        hi Type ctermfg=14 cterm=NONE
        hi Underlined ctermfg=12 cterm=NONE,underline
        hi VertSplit ctermfg=7 ctermbg=8 cterm=NONE
        hi VisibleWS ctermfg=8 cterm=NONE
        hi Visual ctermfg=0 ctermbg=6 cterm=NONE
        hi VisualNOS ctermfg=0 ctermbg=2 cterm=NONE
        hi WarningMsg ctermfg=15 ctermbg=3 cterm=NONE
        hi WildMenu ctermfg=0 ctermbg=11 cterm=NONE
        hi cssBraces ctermfg=6 cterm=NONE
        hi htmlBold ctermfg=15 cterm=NONE
        hi htmlItalic ctermfg=6 cterm=NONE
        hi mySpecialChars ctermfg=6 cterm=NONE
        hi perlConditionalOperator ctermfg=6 cterm=NONE
        hi phpSemiComma ctermfg=6 cterm=NONE

    " }}}

    " Terminal, bright backgrounds are available {{{
    elseif &t_Co >= 16
        hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
        if ($USER) == "root"
            hi StatusLine ctermfg=15 ctermbg=1 cterm=NONE
            hi User1 ctermfg=9 ctermbg=1 cterm=NONE
        else
            hi StatusLine ctermfg=15 ctermbg=12 cterm=NONE
            hi User1 ctermfg=9 ctermbg=12 cterm=NONE
        endif
        hi Comment ctermfg=12 cterm=NONE
        hi Constant ctermfg=10 cterm=NONE
        hi Delimiter ctermfg=6 cterm=NONE
        hi DiffAdd ctermfg=11 ctermbg=2 cterm=NONE
        hi DiffChange ctermfg=15 ctermbg=4 cterm=NONE
        hi DiffDelete ctermfg=8 ctermbg=4 cterm=NONE
        hi DiffText ctermfg=15 ctermbg=2 cterm=NONE
        hi Directory ctermfg=14 cterm=NONE
        hi Error ctermfg=15 ctermbg=9 cterm=NONE
        hi ErrorMsg ctermfg=15 ctermbg=1 cterm=NONE
        hi Exception ctermfg=2 cterm=NONE
        hi FoldColumn ctermfg=11 ctermbg=4 cterm=NONE
        hi Folded ctermfg=10 ctermbg=4 cterm=NONE
        hi Identifier ctermfg=11 cterm=NONE
        hi Ignore ctermfg=8 cterm=NONE
        hi IncSearch ctermfg=0 ctermbg=15 cterm=NONE
        hi LineNr ctermfg=1 cterm=NONE
        hi MatchParen ctermfg=11 ctermbg=6 cterm=NONE
        hi ModeMsg ctermfg=11 ctermbg=1 cterm=NONE
        hi MoreMsg ctermfg=10 cterm=NONE
        hi NonText ctermfg=10 cterm=NONE
        hi Operator ctermfg=6 cterm=NONE
        hi PreProc ctermfg=2 cterm=NONE
        hi Question ctermfg=10 cterm=NONE
        hi Search ctermfg=0 ctermbg=11 cterm=NONE
        hi Special ctermfg=14 cterm=NONE
        hi SpecialKey ctermfg=8 ctermbg=0 cterm=NONE
        hi Statement ctermfg=15 cterm=NONE
        hi StatusLineNC ctermfg=7 ctermbg=8 cterm=NONE
        hi StorageClass ctermfg=11 cterm=NONE
        hi Title ctermfg=13 cterm=NONE
        hi Todo ctermfg=6 ctermbg=11 cterm=NONE
        hi Type ctermfg=14 cterm=NONE
        hi Underlined ctermfg=12 cterm=NONE,underline
        hi VertSplit ctermfg=7 ctermbg=8 cterm=NONE
        hi VisibleWS ctermfg=8 cterm=NONE
        hi Visual ctermfg=0 ctermbg=6 cterm=NONE
        hi VisualNOS ctermfg=0 ctermbg=2 cterm=NONE
        hi WarningMsg ctermfg=15 ctermbg=3 cterm=NONE
        hi WildMenu ctermfg=0 ctermbg=11 cterm=NONE
        hi cssBraces ctermfg=6 cterm=NONE
        hi htmlBold ctermfg=15 cterm=NONE
        hi htmlItalic ctermfg=6 cterm=NONE
        hi mySpecialChars ctermfg=6 cterm=NONE
        hi perlConditionalOperator ctermfg=6 cterm=NONE
        hi phpSemiComma ctermfg=6 cterm=NONE
        hi Pmenu ctermfg=13 ctermbg=8 cterm=NONE

    " }}}

    " Bright backgrounds are not available {{{
    " Bright foregrounds must be specified as 'bold'
    else
        hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
        if ($USER) == "root"
            hi StatusLine ctermfg=7 ctermbg=1 cterm=NONE,bold
            hi User1 ctermfg=1 ctermbg=1 cterm=NONE,bold
        else
            hi StatusLine ctermfg=7 ctermbg=4 cterm=NONE,bold
            hi User1 ctermfg=1 ctermbg=4 cterm=NONE,bold
        endif
        hi Comment ctermfg=4 cterm=NONE,bold
        hi Constant ctermfg=2 cterm=NONE,bold
        hi Delimiter ctermfg=6 cterm=NONE
        hi DiffAdd ctermfg=3 ctermbg=2 cterm=NONE,bold
        hi DiffChange ctermfg=7 ctermbg=4 cterm=NONE,bold
        hi DiffDelete ctermfg=0 ctermbg=4 cterm=NONE,bold
        hi DiffText ctermfg=7 ctermbg=2 cterm=NONE,bold
        hi Directory ctermfg=6 cterm=NONE,bold
        hi Error ctermfg=7 ctermbg=1 cterm=NONE,bold
        hi ErrorMsg ctermfg=7 ctermbg=1 cterm=NONE,bold
        hi Exception ctermfg=2 cterm=NONE
        hi FoldColumn ctermfg=3 ctermbg=4 cterm=NONE,bold
        hi Folded ctermfg=2 ctermbg=4 cterm=NONE,bold
        hi Identifier ctermfg=3 cterm=NONE,bold
        hi Ignore ctermfg=0 cterm=NONE,bold
        hi IncSearch ctermfg=0 ctermbg=7 cterm=NONE
        hi LineNr ctermfg=1 cterm=NONE
        hi MatchParen ctermfg=3 ctermbg=6 cterm=NONE,bold
        hi ModeMsg ctermfg=3 ctermbg=1 cterm=NONE,bold
        hi MoreMsg ctermfg=2 cterm=NONE,bold
        hi NonText ctermfg=2 cterm=NONE,bold
        hi Operator ctermfg=6 cterm=NONE
        hi PreProc ctermfg=2 cterm=NONE
        hi Question ctermfg=2 cterm=NONE,bold
        hi Search ctermfg=0 ctermbg=3 cterm=NONE
        hi Special ctermfg=6 cterm=NONE,bold
        hi SpecialKey ctermfg=0 ctermbg=0 cterm=NONE,bold
        hi Statement ctermfg=7 cterm=NONE,bold
        hi StatusLineNC ctermfg=0 ctermbg=7 cterm=NONE,bold
        hi StorageClass ctermfg=3 cterm=NONE,bold
        hi Title ctermfg=5 cterm=NONE,bold
        hi Todo ctermfg=6 ctermbg=7 cterm=NONE,bold
        hi Type ctermfg=6 cterm=NONE,bold
        hi Underlined ctermfg=4 cterm=NONE,underline,bold
        hi VertSplit ctermfg=0 ctermbg=7 cterm=NONE,bold
        hi VisibleWS ctermfg=0 cterm=NONE,bold
        hi Visual ctermfg=0 ctermbg=6 cterm=NONE
        hi VisualNOS ctermfg=0 ctermbg=2 cterm=NONE
        hi WarningMsg ctermfg=7 ctermbg=3 cterm=NONE,bold
        hi WildMenu ctermfg=0 ctermbg=3 cterm=NONE
        hi cssBraces ctermfg=6 cterm=NONE
        hi htmlBold ctermfg=7 cterm=NONE,bold
        hi htmlItalic ctermfg=6 cterm=NONE
        hi mySpecialChars ctermfg=6 cterm=NONE
        hi perlConditionalOperator ctermfg=6 cterm=NONE
        hi phpSemiComma ctermfg=6 cterm=NONE
        hi Pmenu ctermfg=13 ctermbg=8 cterm=NONE

    " }}}

    endif
endif

