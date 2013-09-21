" Decho.vim:   Debugging support for VimL
" Last Change: December 28, 2000
" Maintainer:  Charles E. Campbell, Jr. PhD <cec@NgrOyphSon.gPsfAc.nMasa.gov>
" Version:     1.00
"
" Usage:
"   Decho "a string"
"   call Decho("another string")
"

" ---------------------------------------------------------------------

" Decho: this splits the screen and writes messages to a small
"        window (5 lines) on the bottom of the screen
fu! Decho(...)

 " As needed, form/switch-to DBG buffer
 if !exists("s:decho")
  bot 5new DBG
  let s:decho=1
 else
  exe "norm \<c-w>b"
 endif

 " Build Message
 let i  = 1
 let msg= ""
 while i <= a:0
  exe "let msg=msg.a:".i
  if i < a:0
   let msg=msg." "
  endif
  let i=i+1
 endwhile

 " Write Message to DBG buffer
 let res=append("$",msg)
 set nomod

 " Return to original window
 exe "norm \<c-w>p"
endfunc

com! -nargs=+ -complete=expression Decho call Decho(<args>)
