"""""""""""""""""""""""""""""""""""""""""{{{
" Author: Chi-Sheng Liu
"
" Sections:
"    -> General
"    -> Interface
"    -> Text_related
"    -> Syntax_related
"    -> Mappings
"    -> Commands
"    -> Helper_functions
"    -> Packages
"
"""""""""""""""""""""""""""""""""""""""""}}}

set encoding=utf-8
scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
"{{{

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
augroup my_cursor_jump
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END

" Auto read when a file is changed from outside
set autoread
augroup my_autoread
  autocmd!
  autocmd FocusGained,BufEnter * checktime
augroup END

" Make backspace functions normally
set backspace=indent,eol,start

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

" Text width
set textwidth=80
augroup my_textwidth
  autocmd!
  autocmd FileType text
        \ setlocal textwidth=78
  autocmd FileType html,json,qf,markdown
        \ setlocal textwidth=0
augroup END

" Status line
set laststatus=2

" Cmd height
set cmdheight=2

" Show what the current mode is
set showmode

" Show line number
set number
"set number relativenumber

"augroup my_numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"  let ftToIgnoreNumToggle = ['nerdtree', 'tagbar']
"  autocmd BufEnter,FocusGained,InsertLeave *
"        \ if index(ftToIgnoreNumToggle, &ft) < 0 | set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   *
"        \ if index(ftToIgnoreNumToggle, &ft) < 0 | set norelativenumber
"augroup END

" Show current position
set ruler

" Show command
set showcmd

" Cursorline
set cursorline

" Show searching result while still typing
set incsearch

" Sign
set signcolumn=yes

" Wildmenu
if has('wildmenu')
  set wildmenu
endif

" Color the column to keep code short
set colorcolumn=80
augroup my_colorcolumn
  autocmd!
  autocmd FileType text,html,json,qf,markdown
        \ setlocal colorcolumn=
augroup END

" Folding
set foldcolumn=3
set foldlevelstart=99
set foldtext=MyFoldText()
set viewoptions=cursor,folds,slash,unix
augroup my_folding
  autocmd!
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd Filetype c,cpp setlocal foldmethod=syntax
augroup END

" Terminal
augroup my_terminal
  autocmd!
  autocmd TerminalOpen,BufEnter * if &buftype == 'terminal' |
        \ setlocal nonumber |
        \ setlocal norelativenumber |
        \ setlocal foldcolumn=0 |
        \ setlocal signcolumn=no |
        \ setlocal colorcolumn= |
        \ endif
augroup END

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Text_related
""""""""""""""""""""""""""""""""""""""""
"{{{

" Indentation
set autoindent
set smartindent

" The size of tabs
set tabstop=2 shiftwidth=2
augroup my_tabwidth
  autocmd!
  autocmd FileType c,cpp,make,python,snippets,sh,verilog,go,asm
        \ setlocal tabstop=4 shiftwidth=4
augroup END

" Use spaces to replace tabs
set expandtab
augroup my_expandtab
  autocmd!
  autocmd FileType text,make,snippets setlocal noexpandtab list
augroup END

" Wrap lines
set wrap

" Do not show whitespace characters
set nolist

" Whitespace characters format when set list
set listchars=tab:\|_

" Trim trailing spaces before saving files
let ftToIgnoreTrim = ['text', 'markdown', 'snippets']
augroup my_trim_whitespaces
  autocmd!
  autocmd BufWritePre * if index(ftToIgnoreTrim, &ft) < 0 |
        \ :call <SID>trimTrailingWhitespaces()
augroup END

" Auto-indent files on save
augroup my_auto_indent
  autocmd!
  autocmd BufWritePre * if &ft ==# 'vim' | call Indent() | endif
augroup END

" Options for insert completion menu
"set completeopt=longest,menuone

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Syntax_related
""""""""""""""""""""""""""""""""""""""""
"{{{

" Always highlight TODO, FIXME, and XXX as Todo
augroup my_highlight_todo
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', '\<TODO\>\|\<FIXME\>\|\<XXX\>', -1)
augroup END

augroup my_syntax
  autocmd!

  " SageMath
  autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python

  " Match leading spaces in makefile as error
  autocmd FileType make syn match Error '\v^ +'

  " Highlight extra whitespaces and trailing whitespaces
  hi link ExtraWhitespace Error
  let ftToIgnoreHighlight = ['text', 'help', 'snippets']
  " Match trailing whitespace:
  autocmd Syntax * if index(ftToIgnoreHighlight, &ft) < 0 |
        \ syn match ExtraWhitespace /\s\+$/
  " Match spaces before a tab:
  autocmd Syntax * if index(ftToIgnoreHighlight, &ft) < 0 |
        \ syn match ExtraWhitespace / \+\ze\t/
  " Match tabs that are not at the start of a line:
  autocmd Syntax * if index(ftToIgnoreHighlight, &ft) < 0 |
        \ syn match ExtraWhitespace /[^\t]\zs\t\+/

augroup END

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

" Remap jump to paragraph to jump to method
map { [m
map } ]m

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

" Window swapping
nnoremap <C-w>H :call MarkWindowSwap()<CR><C-w>h:call DoWindowSwap()<CR>
nnoremap <C-w>J :call MarkWindowSwap()<CR><C-w>j:call DoWindowSwap()<CR>
nnoremap <C-w>K :call MarkWindowSwap()<CR><C-w>k:call DoWindowSwap()<CR>
nnoremap <C-w>L :call MarkWindowSwap()<CR><C-w>l:call DoWindowSwap()<CR>

" Tabpage
nnoremap <Leader>1 :1tabn<CR>
nnoremap <Leader>2 :2tabn<CR>
nnoremap <Leader>3 :3tabn<CR>
nnoremap <Leader>4 :4tabn<CR>
nnoremap <Leader>5 :5tabn<CR>
nnoremap <Leader>6 :6tabn<CR>
nnoremap <Leader>7 :7tabn<CR>
nnoremap <Leader>8 :8tabn<CR>
nnoremap <Leader>9 :9tabn<CR>
nnoremap <Leader>, :tabp<CR>
nnoremap <Leader>. :tabn<CR>

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
" => Commands
""""""""""""""""""""""""""""""""""""""""
"{{{

" Indent current buffer
command! -nargs=0 Indent :call Indent()

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

" Reference: https://stackoverflow.com/questions/15992163/how-to-tell-vim-to-auto-indent-before-saving
" Restore cursor position, window position, and last search after running a command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
  call Preserve('normal gg=G')
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
