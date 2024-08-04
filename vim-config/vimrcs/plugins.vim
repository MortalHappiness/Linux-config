"""""""""""""""""""""""""""""""""""""""""{{{
" Author: Chi-Sheng Liu
"
" Sections:
"    -> Plugins
"    -> Plugin_configurations
"
"""""""""""""""""""""""""""""""""""""""""}}}

scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""
"{{{

" Install Vim-Plug if it has not been installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup my_plugin_vim_plug
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" Load plugins
call plug#begin('~/.vim/plugged')

" Move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

" A collection of language packs
Plug 'sheerun/vim-polyglot'

" Syntax packs
Plug 'pantharshit00/vim-prisma'

" A library plugin to create custom text objects
Plug 'kana/vim-textobj-user'
" The following are text objects implemented using 'kana/vim-textobj-user'
" Segment in variable names(snake case or camel case) (iv/av)
Plug 'Julian/vim-textobj-variable-segment'
" Comma-seperated text objects (i,/a,)
Plug 'sgur/vim-textobj-parameter'
" XML/HTML attributes (ix, ax)
Plug 'whatyouhide/vim-textobj-xmlattr'

" A set of operators to deal with surroundings
Plug 'machakann/vim-sandwich'

" Move lines up and down (and selections left and right)
Plug 'matze/vim-move'

" Zen-coding
Plug 'mattn/emmet-vim', {'for': ['html']}

" Comments (auto detect filetype, toggle comments in visual mode)
Plug 'preservim/nerdcommenter'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Browse directory hierachies
Plug 'preservim/nerdtree'

" Tag bar
Plug 'preservim/tagbar'

" Display indentation levels with vertical lines
Plug 'Yggdroot/indentLine'

" Use <Tab> to do insersion completion
Plug 'ervandew/supertab'

" The python snippet engine
let g:my_plugin_ultisnips_loaded = 0
if has('python3')
  Plug 'SirVer/ultisnips'
  let g:my_plugin_ultisnips_loaded = 1
endif

" Python folding
Plug 'tmhedberg/SimpylFold', {'for': ['python']}

" Fast Folding
Plug 'Konfekt/FastFold'

" Keep editing state (cursor position and folding)
Plug 'zhimsel/vim-stay'

" Show and deal with marks
Plug 'kshenoy/vim-signature'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Make vim as smart as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Beautiful status line
Plug 'vim-airline/vim-airline'

" Table alignment
Plug 'junegunn/vim-easy-align'

" Markdown table editor
Plug 'dhruvasagar/vim-table-mode'

" GitHub Copilot
Plug 'github/copilot.vim'

call plug#end()

"}}}
""""""""""""""""""""""""""""""""""""""""
" => Plugin_configurations
""""""""""""""""""""""""""""""""""""""""
"{{{

" => christoomey/vim-tmux-navigator
" Set shell to sh to make vim-tmux-navigator faster
if &shell =~# 'fish$'
  set shell=sh
endif


" => sheerun/vim-polyglot
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" => junegunn/vim-plug
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

colorscheme my-colorscheme

" => machakann/vim-sandwich
let g:sandwich_no_default_key_mappings = 1
nmap sa <Plug>(operator-sandwich-add)
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
vmap sa <Plug>(operator-sandwich-add)
" Turn off highlight for delete
call operator#sandwich#set('delete', 'all', 'highlight', 0)

" => mattn/emmet-vim
augroup my_plugin_emmet_vim
  autocmd!
  autocmd FileType html,php nmap <S-Tab> <plug>(emmet-expand-abbr)
  autocmd FileType html,php imap <S-Tab> <plug>(emmet-expand-abbr)
  autocmd FileType html,php vmap <S-Tab> <plug>(emmet-expand-abbr)
augroup END

" => preservim/nerdcommenter
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDDefaultAlign='left'
nmap <c-/> <plug>NERDCommenterToggle
vmap <c-/> <plug>NERDCommenterToggle
nmap <c-_> <plug>NERDCommenterToggle
vmap <c-_> <plug>NERDCommenterToggle
nmap <c-M> <plug>NERDCommenterToggle
vmap <c-M> <plug>NERDCommenterToggle

" => preservim/nerdtree
map <F7> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NEADTreeMouseMode=3
let g:NERDTreeMapOpenVSplit = 'v'
" let NERDTreeCustomOpenArgs={'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}
" Exit Vim if NERDTree is the only window left.
augroup my_plugin_nerdtree
  autocmd!
  " Start NERDTree and put the cursor back in the other window.
  autocmd VimEnter * NERDTree | wincmd p
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  autocmd WinEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif
  " Open the existing NERDTree on each new tab.
  autocmd BufWinEnter * silent NERDTreeMirror
augroup END

" => preservim/tagbar
nmap <F8> :TagbarToggle<CR>

" => ervandew/supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" => SirVer/ultisnips
if g:my_plugin_ultisnips_loaded
  let g:UltiSnipsExpandTrigger="<TAB>"
  let g:UltiSnipsJumpForwardTrigger="<TAB>"
  let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/myUltiSnips']
endif

" => Yggdroot/indentLine
let g:indentLine_char_list = ['⎸']
let g:indentLine_fileTypeExclude = ['json', 'markdown']
let g:indentLine_bufTypeExclude = ['help']
augroup my_plugin_indentLine
  autocmd!
  autocmd FileType json,markdown setlocal conceallevel=0
augroup END

" => zhimsel/vim-stay
augroup my_plugin_vim_stay
  autocmd!
  autocmd User BufStayLoadPost if &ft == 'vim' | set foldmethod=marker | endif
augroup END

" => masukomi/vim-markdown-folding
let g:markdown_fold_override_foldtext = 0

" => junegunn/vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" => kshenoy/vim-signature
hi SignatureMarkText cterm=bold ctermfg=201 ctermbg=NONE gui=bold guifg=#ff00ff guibg=NONE

" => junegunn/fzf.vim
source ~/.vim/vimrcs/plugin_config/fzf.vim

" => neoclide/coc.nvim
source ~/.vim/vimrcs/plugin_config/coc.vim

" => vim-airline/vim-airline
source ~/.vim/vimrcs/plugin_config/airline.vim
"}}}
