" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" Color scheme for more modern 256-color terminals
" ============================================================================
let g:colors_name="fwiffo_256"

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
hi LineNr ctermfg=242 ctermbg=233 cterm=NONE
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
