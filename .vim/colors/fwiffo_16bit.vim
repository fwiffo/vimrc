" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" Color scheme for rare terms (Konsole, Finalterm) that support 24-bit color
" TODO(fwiffo): This just uses 16-bit for now becasuse vim uses a 16-bit value
" for the ctermfg and ctermbg values
" ============================================================================
let g:colors_name="fwiffo_16bit"

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
