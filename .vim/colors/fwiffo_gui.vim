" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" Color scheme gui/gvim
" ============================================================================
let g:colors_name="fwiffo_gui"

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
