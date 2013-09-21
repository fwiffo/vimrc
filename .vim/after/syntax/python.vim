" vim:ts=4:sw=4:noet:
" =================================================================
" python.vim - minor enhancements to vim's python highlighting
" Original author - Thomas Schumm <phong@phong.org>
"
" Last modified: 2003-11-17: Thomas Schumm <phong@phong.org>
" =================================================================
syn match pythonSpecialChars /[!%^&{}[\]()\*\-+=\\|~;:,.<>?\/]/
hi def link pythonSpecialChars mySpecialChars
