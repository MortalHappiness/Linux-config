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
" => Plugins
""""""""""""""""""""""""""""""""""""""""
"{{{

" Install Vim-Plug if it has not been installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd my_plugin VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'reewr/vim-monokai-phoenix'

" A set of operators to deal with surroundings
Plug 'machakann/vim-sandwich'

" Move lines up and down (and selections left and right)
Plug 'matze/vim-move'

" A library plugin to create custom text objects
Plug 'kana/vim-textobj-user'
" The following are text objects implemented using 'kana/vim-textobj-user'
" Segment in variable names(snake case or camel case) (iv/av)
Plug 'Julian/vim-textobj-variable-segment'
" Comma-seperated text objects (i,/a,)
Plug 'sgur/vim-textobj-parameter'
" XML/HTML attributes (ix, ax)
Plug 'whatyouhide/vim-textobj-xmlattr'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Zen-coding
Plug 'mattn/emmet-vim', {'for': ['html', 'php']}

" Comments (auto detect filetype, toggle comments in visual mode)
Plug 'preservim/nerdcommenter'

" Browse directory hierachies
Plug 'preservim/nerdtree'

" Tag bar
Plug 'preservim/tagbar'

" Use <Tab> to do insersion completion
Plug 'ervandew/supertab'

" The python snippet engine
Plug 'SirVer/ultisnips'

" Display indentation levels with vertical lines
Plug 'Yggdroot/indentLine'

" Python folding
Plug 'tmhedberg/SimpylFold', {'for': ['python']}

" Markdown folding
"Plug 'masukomi/vim-markdown-folding', {'for': ['markdown']}

" mdx syntax highlighting
Plug 'jxnblk/vim-mdx-js', {'for': ['markdown.mdx']}

" Solidity syntax highlighting
Plug 'tomlion/vim-solidity', {'for': ['solidity']}

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
"Plug 'dense-analysis/ale'

" View and search LSP symbols and tags
"Plug 'liuchengxu/vista.vim'

" Make vim as smart as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Beautiful status line
Plug 'vim-airline/vim-airline'

call plug#end()

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Plugin_configurations
""""""""""""""""""""""""""""""""""""""""
"{{{

" => junegunn/vim-plug
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>

" => reewr/vim-monokai-phoenix
colorscheme monokai-phoenix

" => machakann/vim-sandwich
let g:sandwich_no_default_key_mappings = 1
nmap sa <Plug>(operator-sandwich-add)
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
vmap sa <Plug>(operator-sandwich-add)
" Turn off highlight for delete
call operator#sandwich#set('delete', 'all', 'highlight', 0)

" => mattn/emmet-vim
autocmd my_plugin FileType html,php nmap <S-Tab> <plug>(emmet-expand-abbr)
autocmd my_plugin FileType html,php imap <S-Tab> <plug>(emmet-expand-abbr)
autocmd my_plugin FileType html,php vmap <S-Tab> <plug>(emmet-expand-abbr)

" => preservim/nerdcommenter
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDDefaultAlign='left'
nmap <c-p> <plug>NERDCommenterToggle
vmap <c-p> <plug>NERDCommenterToggle

" => preservim/nerdtree
map <F7> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NEADTreeMouseMode=3
" let NERDTreeCustomOpenArgs={'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}
" Exit Vim if NERDTree is the only window left.
autocmd my_plugin WinEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd my_plugin BufWinEnter * silent NERDTreeMirror

" => preservim/tagbar
nmap <F8> :TagbarToggle<CR>

" => ervandew/supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" => SirVer/ultisnips
"inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>"
inoremap <expr> <C-J> "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>"
xnoremap <C-J> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
snoremap <C-J> <Esc>:call UltiSnips#ExpandSnippet()<CR>
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/myUltiSnips']

" => Yggdroot/indentLine
scriptencoding utf-8
let g:indentLine_char_list = ['⎸']
scriptencoding
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_bufTypeExclude = ['help']

" => zhimsel/vim-stay
autocmd my_plugin User BufStayLoadPost if &ft == 'vim' | set foldmethod=marker | endif

" => masukomi/vim-markdown-folding
let g:markdown_fold_override_foldtext = 0

" => junegunn/fzf.vim
source ~/.vim/vimrcs/plugin_config/fzf.vim

" => dense-analysis/ale
"source ~/.vim/vimrcs/plugin_config/ale.vim

" => liuchengxu/vista.vim
"nnoremap <F8> :Vista!!<CR>
"let g:vista_sidebar_width = 35
"let g:vista_fold_toggle_icons = ['▼', '▶']
"let g:vista_icon_indent = ['└ ', '│ ']
"let g:vista_echo_cursor = 0
"let g:vista_fzf_preview = ['right:50%']
"let g:vista#renderer#enable_icon = 0

" => neoclide/coc.nvim
source ~/.vim/vimrcs/plugin_config/coc.vim

" => vim-airline/vim-airline
source ~/.vim/vimrcs/plugin_config/airline.vim

"}}}
