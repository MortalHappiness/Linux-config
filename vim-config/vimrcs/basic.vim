"""""""""""""""""""""""""""""""""""""""""{{{
" Author: Chi-Sheng Liu
"
" Sections:
"    -> General
"    -> Interface
"    -> Text_related
"    -> Syntax_related
"    -> Mappings
"    -> Helper_functions
"    -> Packages
"
"""""""""""""""""""""""""""""""""""""""""}}}


""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
"{{{

" Define augroups and clear autocmds
source ~/.vim/vimrcs/augroups.vim

" Use Vim settings instead of Vi settings
if &compatible
    set nocompatible
endif

set hidden

" Turn off modeline for security
set modelines=0
set nomodeline

" Enable filetype plugins
filetype plugin on
filetype indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd my_file BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Auto read when a file is changed from outside
set autoread
autocmd my_file FocusGained,BufEnter * checktime

" Make backspace functions normally
set backspace=indent,eol,start

" Encoding
set encoding=utf-8

" History
set history=50

" Use mouse
if has('mouse')
  set mouse=a
endif

" Copy to system clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
endif

" Session
set sessionoptions-=options
set sessionoptions+=curdir

" Updatetime
set updatetime=300

" Fix alt key shortcut on gnome terminal
" Reference: https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Interface
""""""""""""""""""""""""""""""""""""""""
"{{{

" Syntax highlighting
syntax enable

" Number of colors
set t_Co=256

" Background
set background=light

" Text width
set textwidth=80
autocmd my_text_width FileType text
    \ setlocal textwidth=78
autocmd my_text_width FileType html,json,qf,markdown
    \ setlocal textwidth=0

" Status line
set laststatus=2

" Cmd height
set cmdheight=2

" Show what the current mode is
set showmode

" Show line number
set number relativenumber

"autocmd my_numbertoggle BufEnter,FocusGained,InsertLeave * set relativenumber
"autocmd my_numbertoggle BufLeave,FocusLost,InsertEnter   * set norelativenumber
let ftToIgnoreNumToggle = ['nerdtree', 'tagbar']
autocmd my_numbertoggle BufEnter,FocusGained,InsertLeave *
    \ if index(ftToIgnoreNumToggle, &ft) < 0 | set relativenumber
autocmd my_numbertoggle BufLeave,FocusLost,InsertEnter   *
    \ if index(ftToIgnoreNumToggle, &ft) < 0 | set norelativenumber

" Show current position
set ruler

" Show command
set showcmd

" Show searching result while still typing
set incsearch

" Sign
set signcolumn=yes

" Folding
set foldcolumn=3
set foldlevelstart=99
set foldtext=MyFoldText()
autocmd my_folding Filetype vim setlocal foldmethod=marker
autocmd my_folding Filetype c,cpp setlocal foldmethod=syntax
set viewoptions=cursor,folds,slash,unix

" Tabline
set showtabline=2
set tabline=%!MyTabLine()

" Terminal
autocmd my_terminal TerminalOpen,BufEnter * if &buftype == 'terminal' |
  \ setlocal nonumber |
  \ setlocal norelativenumber |
  \ setlocal foldcolumn=0 |
  \ setlocal signcolumn=no |
  \ setlocal colorcolumn= |
  \ endif

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Text_related
""""""""""""""""""""""""""""""""""""""""
"{{{

" Auto indentation
set autoindent

" Smart indentation
set smartindent

" Wrap lines
set wrap

" Do not show whitespace characters
set nolist

" Whitespace characters format when set list
set listchars=tab:\|_

" Use spaces to replace tabs
set expandtab
autocmd my_indent FileType text,make,snippets setlocal noexpandtab

" The size of tabs
set tabstop=2 shiftwidth=2
autocmd my_indent FileType c,cpp,make,python,snippets,sh,verilog,go,asm
    \ setlocal tabstop=4 shiftwidth=4

" Trim trailing spaces before saving files
let ftToIgnoreTrim = ['text', 'markdown', 'snippets']
autocmd my_file BufWritePre * if index(ftToIgnoreTrim, &ft) < 0 |
    \ :call <SID>trimTrailingWhitespaces()

" Options for insert completion menu
set completeopt=longest,menuone

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Syntax_related
""""""""""""""""""""""""""""""""""""""""
"{{{

" Identify python docstring as comments
autocmd my_syntax FileType python syn region Comment start=/"""/ end=/"""/

" SageMath
autocmd my_syntax BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python

" Match leading spaces in makefile as error
autocmd my_syntax FileType make syn match Error '\v^ +'

" Highlight extra whitespaces and trailing whitespaces
hi link ExtraWhitespace Error
let ftToIgnoreHighlight = ['text', 'help', 'snippets']
" Match trailing whitespace:
autocmd my_syntax Syntax * if index(ftToIgnoreHighlight, &ft) < 0 |
    \ syn match ExtraWhitespace /\s\+$/
" Match spaces before a tab:
autocmd my_syntax Syntax * if index(ftToIgnoreHighlight, &ft) < 0 |
    \ syn match ExtraWhitespace / \+\ze\t/
" Match tabs that are not at the start of a line:
autocmd my_syntax Syntax * if index(ftToIgnoreHighlight, &ft) < 0 |
    \ syn match ExtraWhitespace /[^\t]\zs\t\+/

" Let .tex files be recognized as filetype=tex
let g:tex_flavor = 'latex'

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""
"{{{

let mapleader = ','

map s <Nop>

" Edit vimrcs
nnoremap <Leader>v :tabe ~/.vim/vimrcs<CR>

" Sourcing vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Sourcing current file
nnoremap <Leader>ss :source %<CR>

" Edit Snippets
nnoremap <Leader>es :tabe ~/.vim/myUltiSnips<CR>

" Don't use Ex mode, use Q for formatting.
map Q gq

" Toggle relative number
nnoremap <Leader>r :set relativenumber!<CR>

" Toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>

" Use <CR> to accept currently selected popup menu entry
" inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
" Keep showing the completion menu when further typing
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Open omni completion menu or move down the menu
inoremap <expr> <A-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Insert current filename at cursor position
inoremap <C-f> <C-r>=expand("%:t")<CR>

" Folding
nnoremap <Space> za
vnoremap <Space> zf

" Quickfix go to next error wrapped
nnoremap sj :call Wrapped_cn()<CR>
nnoremap sk :call Wrapped_cp()<CR>

" Window swapping
nnoremap <C-w>H :call MarkWindowSwap()<CR><C-w>h:call DoWindowSwap()<CR>
nnoremap <C-w>J :call MarkWindowSwap()<CR><C-w>j:call DoWindowSwap()<CR>
nnoremap <C-w>K :call MarkWindowSwap()<CR><C-w>k:call DoWindowSwap()<CR>
nnoremap <C-w>L :call MarkWindowSwap()<CR><C-w>l:call DoWindowSwap()<CR>

" Tabpage
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>, gT
nnoremap <Leader>. gt

" Execute macro over visual selection range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Open a new tab containing all highlight group
nnoremap <F9> :so $VIMRUNTIME/syntax/hitest.vim<CR><C-w>T

" Identify the syntax highlighting group used at the cursor
" Reference: https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Helper_functions
""""""""""""""""""""""""""""""""""""""""
"{{{

function! <SID>trimTrailingWhitespaces()
  let l:l_num = 1
  for l:line in getline(1, '$')
    call setline(l:l_num, substitute(line, '\s\+$', '', 'e'))
    let l:l_num += 1
  endfor
endfunction

function! ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" In quickfix mode, cn command is used to go to next error.
" This function will go to first error when bottom is hit.
function Wrapped_cn()
    try
        cn
    catch
        cfirst
    endtry
endfunction

function Wrapped_cp()
    try
        cp
    catch
        clast
    endtry
endfunction

" Reference: https://vim.fandom.com/wiki/Customize_text_for_closed_folds
function MyFoldText()
    " clear fold from fillchars to set it up the way we want later
    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
    let l:foldtext = ' '.(v:foldend-v:foldstart+1).
                     \' lines folded'.v:folddashes.'|'
    let l:endofline = (&textwidth>0 ? &textwidth : 80)
    let l:linetext = strpart(
                     \getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
    let l:align = l:endofline-strlen(l:linetext)
    setlocal fillchars+=fold:-
    return printf('%s%*s', l:linetext, l:align, l:foldtext)
endfunction

" References:
" https://vim.fandom.com/wiki/Show_tab_number_in_your_tab_line
" https://stackoverflow.com/questions/5927952/whats-the-implementation-of-vims-default-tabline-function
function MyTabLine()
    let s = ''
    let t = tabpagenr()
    for i in range(1, tabpagenr('$'))
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let wn = tabpagewinnr(i, '$')
        let bufnr = buflist[winnr - 1]
        let filename = bufname(bufnr)
        let buftype = getbufvar(bufnr, '&buftype')

        " Normal buffer
        if buftype ==# ''
            " Extract tail of the filename
            let filename = fnamemodify(filename, ':t')
            if filename ==# ''
                let filename = '[No Name]'
            endif
            if getbufvar(bufnr, '&modified')
                let filename .= '[+]'
            endif
        elseif buftype ==# 'help'
            let filename = '[help] '.fnamemodify(filename, ':t')
        elseif buftype ==# 'terminal'
            let filename = '[Terminal]'
        elseif buftype ==# 'quickfix'
            let filename = '[quickfix]'
        else
            let filename = '['.filename.']'
        endif

        if (i == t)
            if getbufvar(bufnr, '&modified')
                let s .= '%#TabNumSelModified# '.i.' '
                let s .= '%#TabLineSelModified#'
            else
                let s .= '%#TabNumSel# '.i.' '
                let s .= '%#TabLineSel#'
            endif
        else
            let s .= '%#TabNum# '.i.' '
            let s .= '%#TabLine#'
        endif
        let s .= ' '.filename.' '
    endfor
    let s .= '%#TabLineFill#%='
    return s
endfunction

" Window swapping
" Reference: https://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim/4903681#4903681
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( '%' )
    exec g:markedWinNum . 'wincmd w'
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( '%' )
    "Hide and open so that we aren't prompted and keep history
    exec 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exec curNum . 'wincmd w'
    "Hide and open so that we aren't prompted and keep history
    exec 'hide buf' markedBuf
endfunction

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Packages
""""""""""""""""""""""""""""""""""""""""
"{{{

" matchit: makes the % command work better
" e.g. HTML tags, if/else/endif
if has('syntax') && has('eval')
    packadd! matchit
endif

"}}}
