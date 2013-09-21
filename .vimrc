" =================================================================
" Phong's phabulous .vimrc
" Original author - Thomas Schumm <phong@phong.org>
"
" Last modified: 2013-09-21: Thomas Schumm <phong@phong.org>
" =================================================================

source ~/.vim/vimrc_work_before.vim
source ~/.vim/vimrc_local_before.vim

set nocompatible                " Make it no like vi
syntax on

" === Interface behavior options ================================== " {{{
if &term == "konsole" || &term == "konsole-16color" || &term == "rxvt"
    " Fix titles if we don't have these set for some stupid reason
    set t_ts=]2;
    set t_fs=
endif
set nobackup                    " Don't create backup files
set history=100                 " Remember 100 lines of history
set viminfo='200,\"500,h
set wildmode=longest,list       " Behavior of tab key when hit first, second
set showmatch                   " Brief jump to matching parens
set matchtime=3                 " I said BRIEF
set ignorecase                  " make searching easier
set smartcase                   " unless we're cool
set showcmd                     " Show commands as you type them
" Dictionary, thesaurus to use for <C-X><C-K>,<C-T>
set dictionary+=/usr/dict/mobywords,/usr/dict/mobynames,/usr/dict/mobyplaces
if version >= 600
    set thesaurus+=/usr/dict/mobythesaurus
endif
"helptags ~/.vim/doc
"set iskeyword+=.,-             " Additional chars allowed in keywords
set ttimeoutlen=100             " Make it so that <ESC>O doesn't hang there
set laststatus=2                " Always show status line
set visualbell                  " STOP THE BEEPING
"set t_vb=                      " STOP THE FLASHING
au! BufRead * set helpheight=5  " Make the help window a certain size
" TODO: Fix so thsi works in python files and doesn't screw up diff mode
" and works in multiple files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe 'normal g`"zvzz' |
    \ endif

" ================================================================= " }}}

" === Editing options (how to treat files, editor behavior) ======= " {{{
set fileformats=unix,dos,mac    " By default, it doesn't see mac files
set fileencodings=fileencodings=ucs-bom,utf-8,default,cp1252,latin1
set backspace=2                 " Make backspaces work
set tabstop=8                   " <tab> stops at 8
set softtabstop=4               " behave as if we have tabs for backspaces
set shiftwidth=4                " (auto)indent width
set expandtab                   " We don't want tabs by default
set whichwrap=<,>,h,l,[,],b,s   " Allow cursor to wrap in more situations
set textwidth=78                " Wrap at 78 columns normally
" I like modelines, but they are a potential security hole, so none for root
if ($USER) == "root"
    set nomodeline
else
    set modeline
endif
if version >= 600
    set formatoptions+=2n       " Adds wrapping for lists, indented parag
    set nrformats=hex,alpha     " Make ^X and ^A work with more things
else
    set nrformats=hex           " Make ^X and ^A work with more things
endif

" === Folding, scrolling, editing interface, etc. =================
set showbreak=\\->              " make linebreaks obvious
set nowrap                      " By default, don't use the above option
set sidescroll=30               " Horozontally scroll by big chunks
set sidescrolloff=2             " always have context left/right vixible
set scrolloff=2                 " always have a line of context below/above
set background=dark             " Assumes black terminal background
set list                        " make some stuff visible, see listchars below
if version >= 600
    set listchars=precedes:<,extends:>,tab:>-,trail:~
    set virtualedit=all         " Move through space virtually
    syntax enable               " Turn on syntax highlighting
    color phong                 " Get my color settings
    " No idea why I can't set this in my colors file
    hi Pmenu ctermfg=13 ctermbg=8 cterm=NONE
    hi PmenuSel ctermfg=11 ctermbg=7 cterm=NONE
else
    set listchars=eol:\ ,extends:>,tab:>-
    syntax on
    so ~/.vim/colors/phong.vim  " This works in older versions of vim
    hi Pmenu ctermfg=13 ctermbg=8 cterm=NONE
    hi PmenuSel ctermfg=11 ctermbg=7 cterm=NONE
endif

set foldmethod=marker           " Default unless overried by a plugin
if &diff
    set foldopen=block,insert,mark,percent,quickfix,search,tag,undo
    set foldminlines=1
else
    set foldopen=block,hor,insert,mark,percent,quickfix,search,tag,undo,jump
    set foldminlines=2          " Small folds are just bothersome
endif
" ================================================================= " }}}

" function ListSyn()
"     let id = 1
"     let name = synIDattr(id, "name")
"     while name != ""
"         exe "normal! A" . name . "\n\e"
"         let id = id + 1
"         let name = synIDattr(id, "name")
"     endwhile
" endfunction

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
let dotpos = stridx($HOSTNAME, '.')
if dotpos <= 0
    let shorthost = $HOSTNAME
else
    let shorthost = strpart($HOSTNAME, 0, dotpos)
endif
let title_front = "|VIM|" . $USER . "@" . shorthost . "|"
unlet dotpos shorthost

"set ruler                       " Show col,row % on status line
set statusline=%.47f\ %m%1*%r%*%y%{FileFlags()}\ %=%<%3b\ 0x%02B\ %10(%l,%=%2(%c%V%)%)\ %P
set titlelen=0 title titlestring=%{title_front}%f\ %m%r%y%{FileFlags()}\ //\ %P
" ================================================================= " }}}

" === Per-filetype options ======================================== " {{{
" These should be moved to their respective plugin files

" For TOhtml
let html_use_css = 1
let use_xhtml = 1

" Options for syntax highlighting
let perl_want_scope_in_variables = 1
let perl_extended_vars = 1
let perl_string_as_statement = 1
let perl_no_sync_on_sub = 1
let perl_no_sync_on_global_var = 1
let python_highlight_all = 1

" For some reason these haven't been automatic...
autocmd BufRead *.xhtml set ft=xhtml
autocmd BufRead *.xml set ft=xml

filetype plugin indent on

" Some controls over syntax highlighting and whatnot Some configurations that
" vary depending on filetype, I wish I had the will power to unify these into
" a single style
autocmd FileType perl,python,vim,sh,c,cpp,htmlcheetah,javascript,css set sw=4 ts=8 sts=4 et ai
autocmd FileType go set sw=4 ts=4 sts=4 noet ai
autocmd FileType c,cpp set si
autocmd FileType grub,fstab,xf86conf set tw=0 ts=8 sts=8 sw=8 ai noet
autocmd FileType conf set tw=0 ts=8 sts=8 sw=8 ai et
autocmd FileType xhtml,html,xml set sw=4 ts=8 sts=4 noai tw=0 indentkeys=o,O
autocmd FileType htmlcheetah,sql set tw=0

" Commentstrings for folds and such
autocmd FileType python,perl,sh      set commentstring=\ #\ %s
autocmd FileType htmlcheetah         set commentstring=##\ %s
autocmd FileType vim                 set commentstring=\ \"\ %s
autocmd FileType c,cpp,javascript    set commentstring=\ /*\ %s\ */
autocmd FileType xhml,html,xhtml     set commentstring=\ <!--\ %s\ -->
autocmd FileType sql                 set commentstring=\ --\ %s

" Comment re-wrapping mappings
autocmd FileType python,perl,sh      map g<C-J> ?^\s*[^ \t\#]<cr>jv/^\s*[^ \t\#]<cr>gq
autocmd FileType vim                 map g<C-J> ?^\s*[^ \t\"]<cr>jv/^\s*[^ \t\"]<cr>gq
autocmd FileType c,cpp               map g<C-J> ?^\s*\/?[^ \t\/]<cr>jv/^\s*\/?[^ \t\/]<cr>gq
" Auto formatting options
autocmd FileType c,cpp,perl,python,vim,sh set fo-=t fo+=rqn

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

" Make curly braces cooler
inoremap {<CR> {<ESC>o}<ESC>O
" inoremap {<Space> {<Space><Space>}<ESC>hi

" Make qq and \\ be quick record and quick playback (@q is annoying to type)
map <Leader><Leader> @q

" Misc. useful mappings
map <Leader>= >iB
map <Leader>- <iB

function GetSyntaxName(line, col)
    let l:synid = synID(a:line, a:col, 1)
    let l:name = synIDattr(l:synid, "name")
    let l:transname = synIDattr(synIDtrans(l:synid), "name")

    if l:name == ""
        let l:name = "[NONE]"
    endif
    if l:transname == ""
        let l:transname = "Normal"
    endif

    return l:name . "/" . l:transname
endfunction

" map <Leader>h :echo "syntax = " . GetSyntaxName(line("."), col("."))<cr>
map <silent> <Leader>f :filetype detect<cr>
map <Leader>tab :%s/CREATE TABLE \(`\?\w\+`\?\) (/drop table if exists \1;\rCREATE TABLE \1 (/<cr>
map <Leader>old :%s/ timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP/ timestamp/g<cr>:%s/ DEFAULT CHARSET=.\+;/;/g<cr>

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

source ~/.vim/vimrc_work_after.vim
source ~/.vim/vimrc_local_after.vim

