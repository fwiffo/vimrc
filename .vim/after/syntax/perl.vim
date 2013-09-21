" vim:ts=4:sw=4:noet:
" =================================================================
" perl.vim - minor enhancements to vim's perl highlighting
" Original author - Thomas Schumm <phong@phong.org>
"
" Last modified: 2003-11-17: Thomas Schumm <phong@phong.org>
" =================================================================
syn match perlSpecialChars /[!%^&\*\-+=\\|~;:,.<>?\/]/
syn match perlSpecialChars /[ \t\r\n\'\"]\@<=x[ \t\r\n0-9]\@=/
syn keyword perlTodo TODO: TBD: FIXME: XXX: contained
hi def link perlSpecialChars mySpecialChars
