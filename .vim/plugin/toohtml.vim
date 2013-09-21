" Vim plugin for converting a syntax highlighted file to HTML.
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last Change: 2003 Apr 06

" Don't do this when:
" - when 'compatible' is set
" - this plugin was already loaded
" - user commands are not available.
if !&cp && !exists(":TOOhtml") && has("user_commands")
  command -range=% TOOhtml :call Convert3HTML(<line1>, <line2>)

  func Convert3HTML(line1, line2)
    if a:line2 >= a:line1
      let g:html_start_line = a:line1
      let g:html_end_line = a:line2
    else
      let g:html_start_line = a:line2
      let g:html_end_line = a:line1
    endif

    runtime syntax/3html.vim

    unlet g:html_start_line
    unlet g:html_end_line
  endfunc

endif
