" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" Fallback for primitive terminals that only supports 8 colors. It is assumed
" that these terminals support the bold attribute as either bold text or bright
" foregrounds.
" ============================================================================
let g:colors_name="fwiffo_8"

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
