" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" Tweaks on top of third-party schemes
" ============================================================================
let g:colors_name="fwiffo_addenda"

hi ColorColumn ctermbg=234
hi NonText ctermbg=233
hi LineNr ctermbg=233
hi Todo ctermfg=172
hi StatusLineNC ctermfg=243 ctermbg=236
hi SpecialKey ctermbg=233 ctermfg=239
if ($USER) == "root"
    hi StatusLine ctermbg=167 cterm=NONE
    hi User1 ctermfg=1 ctermbg=167 cterm=NONE
else
    hi StatusLine ctermbg=60 ctermfg=222 cterm=NONE
    hi User1 ctermfg=1 ctermbg=60 ctermfg=222 cterm=NONE
endif
