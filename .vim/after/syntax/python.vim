" ============================================================================
" Author - Tom Schumm <phong@phong.org>
" A few enhancements to python's syntax highlighting
" ============================================================================
syn match pythonSpecialChars /[!%^&{}[\]()\*\-+=\\|~;:,.<>?\/]/
hi def link pythonSpecialChars mySpecialChars
