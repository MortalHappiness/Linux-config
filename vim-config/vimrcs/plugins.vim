"""""""""""""""""""""""""""""""""""""""""{{{
" Author: Chi-Sheng Liu
"
" Sections:
"    -> Helper_functions
"    -> Plugins
"    -> Plugin_configurations
"
"""""""""""""""""""""""""""""""""""""""""}}}


""""""""""""""""""""""""""""""""""""""""
" => Helper_functions
""""""""""""""""""""""""""""""""""""""""
"{{{

" Conditional activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""
"{{{

" Install Vim-Plug if it has not been installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'reewr/vim-monokai-phoenix'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Zen-coding
Plug 'mattn/emmet-vim', {'for': ['html']}

" Comments (auto detect filetype, toggle comments in visual mode)
Plug 'preservim/nerdcommenter'

" Browse directory hierachies
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}

" Use <Tab> to do insersion completion
Plug 'ervandew/supertab'

" The python snippet engine
Plug 'SirVer/ultisnips'

" Display indentation levels with vertical lines
Plug 'Yggdroot/indentLine'

" Python folding
Plug 'tmhedberg/SimpylFold', {'for': ['python']}

" Markdown folding
Plug 'masukomi/vim-markdown-folding', {'for': ['markdown']}

" Fast Folding
Plug 'Konfekt/FastFold'

" Keep editing state (cursor position and folding)
Plug 'zhimsel/vim-stay'

" Show and deal with marks
Plug 'kshenoy/vim-signature'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Asynchronous Lint Engine (Syntax checking)
Plug 'dense-analysis/ale'

" Beautiful status line
Plug 'vim-airline/vim-airline'

call plug#end()

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Plugin_configurations
""""""""""""""""""""""""""""""""""""""""
"{{{

" => reewr/vim-monokai-phoenix
colorscheme monokai-phoenix

" => mattn/emmet-vim
autocmd FileType html nmap <S-Tab> <plug>(emmet-expand-abbr)
autocmd FileType html imap <S-Tab> <plug>(emmet-expand-abbr)
autocmd FileType html vmap <S-Tab> <plug>(emmet-expand-abbr)

" => preservim/nerdcommenter
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDDefaultAlign="left"
nmap <c-p> <plug>NERDCommenterToggle
vmap <c-p> <plug>NERDCommenterToggle

" => preservim/nerdtree
map <F7> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeCustomOpenArgs={'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1
    \ && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" => ervandew/supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" => SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/myUltiSnips']

" => Yggdroot/indentLine
let g:indentLine_char_list = ['⎸']
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_bufTypeExclude = ['help']

" => zhimsel/vim-stay
autocmd User BufStayLoadPost if &ft == 'vim' | set foldmethod=marker | endif

" => masukomi/vim-markdown-folding
let g:markdown_fold_override_foldtext = 0

" => junegunn/fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>s :Snippets<CR>
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'left': '50%'}
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \}

" => dense-analysis/ale
nmap sn <Plug>(ale_next_wrap)
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \'c': ['gcc'],
    \'cpp': ['gcc'],
    \'javascript': ['eslint'],
    \'javascriptreact': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'c': [],
    \'cpp': [],
    \'javascript': ['prettier', 'eslint'],
    \'javascriptreact': ['prettier', 'eslint'],
    \'json': ['prettier'],
\}

" => vim-airline/vim-airline
source ~/.vim/vimrcs/plugin_airline.vim

"}}}

