" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" A few enhancements to perl's syntax highlighting
" ============================================================================
syn match perlSpecialChars /[!%^&\*\-+=\\|~;:,.<>?\/]/
syn match perlSpecialChars /[ \t\r\n\'\"]\@<=x[ \t\r\n0-9]\@=/
syn keyword perlTodo TODO: TBD: FIXME: XXX: contained
hi def link perlSpecialChars Operator
