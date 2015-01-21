" =============================================================================
" Author - Tom Schumm <phong@phong.org>
" =============================================================================

set nocompatible                " Make it no like vi
syntax on

source ~/.vim/vimrc_work_before.vim

" === Terminal behavior fixes ===================================== " {{{

if &term == "konsole" || &term == "konsole-16color" || &term == "rxvt"
    " Fix titles if we don't have these set for some stupid reason
    set t_ts=]2;
    set t_fs=
endif

" Permits use of 16 colors on certain terminals via blink attribute
if &term == "cygwin" || &term == "putty" || &term == "rxvt"
    set t_Co=16
    set t_AF=[3%{7}%p1%&%d%{7}%p1%<%Pa%?%ga%t;1%;m
    set t_AB=[4%{7}%p1%&%d%{7}%p1%<%Pa%?%ga%t;5%;m
endif

" Actual xterm termcap only supports 8 colors, but most terms that call
" themselves xterm have at least 16 color support
if &term == "xterm"
    set t_Co=16
endif

" Konsole has a mostly undocumented way of specifying 24-bit colors, though we
" can only use (slightly less than) 16-bit in vim
if version >= 700 && (&term == "konsole" || &term == "konsole-16color")
    " The max value that seems can be passed as a ctermfg or ctermbg is 65534,
    " otherwise this would work.
    "
    " set t_Co=16777216
    " set t_AF=[38;2;%p1%{65536}%\/%d;%p1%{256}%\/%{255}%&%d;%p1%{255}%&%dm
    " set t_AB=[48;2;%p1%{65536}%\/%d;%p1%{256}%\/%{255}%&%d;%p1%{255}%&%dm

    " Color values are encoded as follows:
    "   Number in the range of 0-65534
    "   red = upper 5 bits * 255 / 31
    "   green = middle 6 bits * 255 / 63
    "   blue = lowest 5 bits * 255 / 31
    "
    " Vim won't store 65535 as a color number, so white is indicated as 65534 as
    " a special case

    set t_Co=65536
    set t_AB=[48;2;%p1%{2048}%\/%{255}%*%{31}%\/%d;%p1%{32}%\/%{63}%&%{255}%*%{63}%\/%d;%?%p1%{65534}%=%t%{255}%e%p1%{31}%&%{255}%*%{31}%\/%;%dm
    set t_AF=[38;2;%p1%{2048}%\/%{255}%*%{31}%\/%d;%p1%{32}%\/%{63}%&%{255}%*%{63}%\/%d;%?%p1%{65534}%=%t%{255}%e%p1%{31}%&%{255}%*%{31}%\/%;%dm
endif

" ================================================================= " }}}

" === Syntax highlighting and colors ============================== " {{{
syntax enable
set background=dark             " Assumes black terminal background
let g:jellybeans_background_color="None"
let g:jellybeans_background_color_256="None"
if has("gui_running")
    color jellybeans
    color fwiffo_addenda
elseif &t_Co >= 16777216
    color jellybeans
    color fwiffo_addenda
elseif &t_Co >= 65536
    color jellybeans
    color fwiffo_addenda
elseif &t_Co >= 256
    color jellybeans
    color fwiffo_addenda
elseif &t_Co >= 16
    color fwiffo_16
elseif &t_Co >=8
    color fwiffo_8
endif
" ================================================================= " }}}

" === Non-interface options ======================================= " {{{
set history=100                 " Remember 100 lines of history
set nobackup                    " Don't create backup files
set ttimeoutlen=100             " Make it so that <ESC>O doesn't hang there
set viminfo='200,<500,h         " Marks per file, lines per register, disable hlsearch on load

" Continue where we left off on last edit and open folds at cursor
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"zvzz
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" ================================================================= " }}}

" === Options for file contents and editing behavior ============== " {{{

set fileformats=unix,dos,mac    " By default, it doesn't see mac files
set fileencodings=fileencodings=ucs-bom,utf-8,default,cp1252,latin1
set formatoptions+=2n           " Adds wrapping for lists, indented paragraphs
set nrformats=hex,alpha         " Make ^X and ^A work with more things
set whichwrap=<,>,h,l,[,],b,s   " Allow cursor to wrap in more situations

set autoindent                  " Simple autoindent unless there is a plugin
set backspace=2                 " Make backspaces work
set expandtab                   " We don't want hard tabs by default
set shiftwidth=4                " (auto)indent width
set softtabstop=4               " Behave as if we have tabs for backspaces
set tabstop=8                   " Hard <tab> stops at 8
set textwidth=80                " Wrap at 78 columns normally
set colorcolumn=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100

" ================================================================= " }}}
"
" === Interface options =========================================== " {{{
set ignorecase                  " Make searching easier
set smartcase                   " Unless we're being specific

set list                        " Make some stuff visible, see listchars below
set listchars=trail:💩,tab:►-,extends:…,precedes:…
set showbreak=╰─►\              " Linebreak char+space when wrapping long lines
set nowrap                      " Down't wrap long lines by default

set laststatus=2                " Always show status line
set matchtime=3                 " I said BRIEF
set showcmd                     " Show commands as you type them
set showmatch                   " Brief jump to matching parens
set visualbell                  " STOP THE BEEPING
" set t_vb=                     " STOP THE FLASHING

" Turn on line numbers but only if there is space. Has to be called on several
" events to cover :split, etc.
fun! WinSizeAutoNumber()
    if winwidth(0) > 90
        set number
    else
        set nonumber
    endif
endfunction
call WinSizeAutoNumber()
au VimResized * call WinSizeAutoNumber()
au WinEnter * call WinSizeAutoNumber()
au WinLeave * call WinSizeAutoNumber()

set scrolloff=2                 " Always have a line of context below/above
set sidescroll=30               " Horozontally scroll by big chunks
set sidescrolloff=2             " Always have context left/right vixible

set virtualedit=all             " Move through space virtually
set wildmode=longest,list       " Behavior of tab key when hit first, second

au! BufRead * set helpheight=5  " Make the help window a certain size

set foldmethod=marker           " Default unless overried by a plugin
if &diff
    set foldopen=block,insert,mark,percent,quickfix,search,tag,undo
    set foldminlines=1
else
    set foldopen=block,hor,insert,mark,percent,quickfix,search,tag,undo,jump
    set foldminlines=2          " Small folds are just bothersome
endif
" ================================================================= " }}}

" === Options for status line and window title ==================== " {{{
function FileFlags()
    let l:flags = ""
    if &ff != "unix"
        let l:flags = l:flags."[".&ff."]"
    endif
    if &binary
        let l:flags = l:flags."[bin]"
    endif
    if !(&eol)
        let l:flags = l:flags."[noeol]"
    endif
    return l:flags
endfunction

set statusline=%.67f\ %m%1*%r%*%y%{FileFlags()}\ %=%<%3b\ 0x%02B\ %10(%l,%=%2(%c%V%)%)\ %P

let title_prefix = "⌨:"
let title_shell = " « " . $WINDOW_TITLE
set titlelen=0 title titlestring=%{title_prefix}%f%{title_shell}\ %m%r%y%{FileFlags()}\ //\ %P
" ================================================================= " }}}

" === Per-filetype options ======================================== " {{{
" These should be moved to their respective plugin files

" For TOhtml
let html_use_css = 1

" Options for syntax highlighting
let perl_want_scope_in_variables = 1
let perl_extended_vars = 1
let perl_string_as_statement = 1
let perl_no_sync_on_sub = 1
let perl_no_sync_on_global_var = 1
let python_highlight_all = 1

" For some reason these haven't been automatic...
autocmd BufRead,BufNewFile *.xhtml set ft=xhtml
autocmd BufRead,BufNewFile *.xml set ft=xml

filetype plugin indent on

" Most filetypes are one style
autocmd FileType perl,python,vim,sh,sql,c,cpp,htmlcheetah,html,xml,xhtml,javascript,css set sw=4 ts=8 sts=4 et fo-=t fo+=rn

" Go uses hard tabs
autocmd FileType go set sw=4 ts=4 sts=4 noet

" Certain Unix config files use hard tabs
autocmd FileType grub,fstab,xf86conf,conf set ts=8 sts=8 sw=8 ai noet

" Indent behaviors
autocmd FileType html,xml,xhtml set indentkeys=o,O
autocmd FileType css set indentkeys-=: cinkeys-=:
autocmd FileType c,cpp set cindent si ai
autocmd FileType css,javascript,perl set nocindent si ai
autocmd FileType python,vim,sql,sh,htmlcheetah,html,xml,xhtml set nocindent nosi ai
autocmd FileType python set indentkeys-=: indentkeys-=<:>

" Commentstrings for folds and such
autocmd FileType python,perl,sh     set commentstring=\ #\ %s
autocmd FileType htmlcheetah        set commentstring=##\ %s
autocmd FileType vim                set commentstring=\ \"\ %s
autocmd FileType c,cpp,javascript   set commentstring=\ /*\ %s\ */
autocmd FileType xhml,html,xhtml    set commentstring=\ <!--\ %s\ -->
autocmd FileType sql                set commentstring=\ --\ %s

" Comment re-wrapping mappings
autocmd FileType python,perl,sh     map g<C-J> ?^\s*[^ \t\#]<cr>jv/^\s*[^ \t\#]<cr>gq
autocmd FileType vim                map g<C-J> ?^\s*[^ \t\"]<cr>jv/^\s*[^ \t\"]<cr>gq
autocmd FileType c,cpp              map g<C-J> ?^\s*\/?[^ \t\/]<cr>jv/^\s*\/?[^ \t\/]<cr>gq

" ================================================================= " }}}

" === Mappings ==================================================== " {{{
" Make <Tab> complete keywords intelligently in insert mode
function! CleverTab()
    " Act like regular tab when preceeded by non-keywordish char
    if strpart(getline('.'), col('.')-2, 1) =~ '^[^@A-Za-z0-9._-]*$'
        return "\<Tab>"
    " Else do keyword completion
    else
        return "\<C-N>"
    endif
endfunction
" Use clever tab completion in insert mode
inoremap <Tab> <C-R>=CleverTab()<CR>

" A couple useful help mappings
" by default <f1> is just :h -- what a waste, better make it this, which
" navigates tags in help and is annoyingly also the telnet escape key (not
" that I use telnet, but still).
map <F1> <C-]>
" Try as I might, I can never remember that <c-t> is back in help
map <F2> <C-T>

noremap <silent> <F8> :set cursorline!<CR>:set cursorcolumn!<CR>
inoremap <silent> <F8> <C-O>:set cursorline!<CR><C-O>:set cursorcolumn!<CR>

" Set pastetoggle and paragraph reformatting to useful keys
set pastetoggle=<F9>
map <C-J> gqap
vmap <C-J> gq
map! <C-J> gqap

" Make page up and page down work expectedly
noremap <PageDown> <C-D><C-D>
noremap <PageUp> <C-U><C-U>
inoremap <PageDown> <C-D><C-D>
inoremap <PageUp> <C-U><C-U>

" These driev me nuts
map! <C-W> <esc><C-W>
map :W :w
map :: :<C-F>
map :S :s
map :D :d

" Make curly braces cooler
inoremap {<CR> {<ESC>o}<ESC>O

" Make qq and \\ be quick record and quick playback (@q is annoying to type)
map <Leader><Leader> @q

" Misc. useful mappings
map <Leader>= >iB
map <Leader>- <iB
map <silent> <Leader>f :filetype detect<cr>

" Copy/paste for xwin
map <Leader>c "+y
map <Leader>x "+x
map <Leader>v "+gP

" Split mappings
map <Leader>d :split ~/debug.txt<cr>
map <Leader>` :split 

" This BEAST of a regexp removes all trailing spaces that are not escaped with
" a backslash (i.e. are preceeded by an odd number of backslashes), though I
" really should extend it to not match inside multi-line strings.  It also does
" a retab.  There is also a g version that is less intense.
" TODO: make a version that fixes leading tabs properly
map <silent> <Leader>s :silent! %s/\v((\\)@<!\\(\\\\)*)@<!\s+$//<CR>``:retab<CR>
map <silent> <Leader>gs :silent! %s/\s\+$//<CR>``

" Make use of those arrow keys I've learned to not use
imap <Right> <Esc><C-w>l
imap <Left> <Esc><C-w>h
imap <Up> <Esc><C-w>k
imap <Down> <Esc><C-w>j
map <Right> <C-w>l
map <Left> <C-w>h
map <Up> <C-w>k
map <Down> <C-w>j
" ================================================================= " }}}

" === GUI/gvim config ============================================= " {{{
if has("gui_running")
    set columns=250
    set lines=60
    if has("x11")
        if has("gui_gtk2")
            set guifont=Ubuntu\ Mono\ 10
        else
            set guifont=-*-Ubuntu\ Mono-medium-r-semi\ condensed-*-*-180-*-*-m-*-*
        endif
    else
        set guifont=Ubuntu_Mono:h10:cDEFAULT
    endif
endif
" ================================================================= " }}}

source ~/.vim/vimrc_work_after.vim
