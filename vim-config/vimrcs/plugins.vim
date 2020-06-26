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

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Zen-coding
Plug 'mattn/emmet-vim', {'for': ['html']}

" Comments (auto detect filetype, toggle comments in visual mode)
Plug 'preservim/nerdcommenter'

" Browse directory hierachies
Plug 'preservim/nerdtree'

" Use <Tab> to do insersion completion
Plug 'ervandew/supertab'

" Easy modify surrondings in pairs
Plug 'tpope/vim-surround'

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

" Session manager
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Asynchronous Lint Engine (Syntax checking)
Plug 'dense-analysis/ale'

" Colorscheme
Plug 'reewr/vim-monokai-phoenix'

call plug#end()

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Plugin_configurations
""""""""""""""""""""""""""""""""""""""""
"{{{

" => mattn/emmet-vim
autocmd FileType html nmap <S-Tab> <plug>(emmet-expand-abbr)
autocmd FileType html imap <S-Tab> <plug>(emmet-expand-abbr)
autocmd FileType html vmap <S-Tab> <plug>(emmet-expand-abbr)

" => preservim/nerdcommenter
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

" => xolox/vim-session
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_command_aliases = 1

" => reewr/vim-monokai-phoenix
colorscheme monokai-phoenix

"}}}

