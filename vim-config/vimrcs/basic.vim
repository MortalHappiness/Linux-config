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

" Use Vim settings instead of Vi settings
if &compatible
    set nocompatible
endif

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
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Auto read when a file is changed from outside
set autoread
autocmd FocusGained,BufEnter * checktime

" Make backspace functions normally
set backspace=indent,eol,start

" Encoding
set encoding=utf-8

" History
set history=50

" Do not use mouse
set mouse=""

" Session
set sessionoptions-=options
set sessionoptions+=curdir

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

" Status line
set laststatus=2

" Show what the current mode is
set showmode

" Show line number
set nu

" Show current position
set ruler

" Show command
set showcmd

" The height of the command bar
set cmdheight=1

" Show searching result while still typing
set incsearch

" Sign
set signcolumn=yes

" Folding
set foldcolumn=3
set foldtext=MyFoldText()
autocmd filetype vim setlocal foldmethod=marker
autocmd filetype c,cpp setlocal foldmethod=syntax
set viewoptions=cursor,folds,slash,unix

" Tabline
set showtabline=2
set tabline=%!MyTabLine()

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Text_related
""""""""""""""""""""""""""""""""""""""""
"{{{

autocmd FileType text setlocal textwidth=78

" Auto indentation
set autoindent

" Smart indentation
set smartindent

" Wrap lines
set wrap

" Use spaces to replace tabs
set expandtab
autocmd FileType text,make,snippets setlocal noexpandtab

" The size of tabs
set tabstop=4 shiftwidth=4
autocmd FileType html,css,scss,javascript,javascriptreact,typescript,json
    \ setlocal tabstop=2 shiftwidth=2

" Trim trailing spaces before saving files
let ftToIgnore = ['text', 'markdown', 'snippets']
autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 |
    \ :call <SID>trimTrailingWhitespaces()

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Syntax_related
""""""""""""""""""""""""""""""""""""""""
"{{{

" Identify python docstring as comments
autocmd FileType python syn region Comment start=/"""/ end=/"""/

" Let .tex files be recognized as filetype=tex
let g:tex_flavor = "latex"

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""
"{{{

let mapleader = ","

" Don't use Ex mode, use Q for formatting.
map Q gq

" Folding
nnoremap <Space> za
vnoremap <Space> zf

" Quickfix go to next error wrapped
nnoremap sj :call Wrapped_cn()<CR>

" Window swapping
nnoremap <C-w>H :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <C-w>J :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <C-w>K :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <C-w>L :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>

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
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
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

" Reference: https://vim.fandom.com/wiki/Customize_text_for_closed_folds
function MyFoldText()
    " clear fold from fillchars to set it up the way we want later
    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
    let l:numwidth = &numberwidth
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
        if buftype == ''
            " Extract tail of the filename
            let filename = fnamemodify(filename, ':t')
            if filename == ''
                let filename = '[No Name]'
            endif
            if getbufvar(bufnr, "&modified")
                let filename .= '[+]'
            endif
        elseif buftype == 'help'
            let filename = '[help] '.fnamemodify(filename, ':t')
        elseif buftype == 'terminal'
            let filename = '[Terminal]'
        elseif buftype == 'quickfix'
            let filename = '[quickfix]'
        else
            let filename = '['.filename.']'
        endif

        if (i == t)
            if getbufvar(bufnr, "&modified")
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
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
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

