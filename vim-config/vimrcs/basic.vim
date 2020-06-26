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

" Folding
set foldcolumn=3
set foldtext=MyFoldText()
autocmd filetype vim setlocal foldmethod=marker
autocmd filetype c,cpp setlocal foldmethod=syntax
set viewoptions=cursor,folds,slash,unix

" Tabpages
set showtabline=2
"set tabline=%!MyTabLine()

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
autocmd FileType html,css,scss,javascript,javascriptreact,json
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

" Don't use Ex mode, use Q for formatting.
map Q gq

" Toggle relative number
nnoremap <F6> :call ToggleRelativeNumber()<CR>

" Folding
nnoremap <Space> za
vnoremap <Space> zf

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

function ToggleRelativeNumber()
    if &rnu
        set nornu
    else
        set rnu
    endif
endfunction

function MyTabLine()
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

