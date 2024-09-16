""""""""""""""""""""""""""""""""""""""""
" Author: Chi-Sheng Liu
""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8

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
autocmd! User after_vim_plug

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
autocmd User after_vim_plug source ~/.vim/vimrcs/plugin_config/vim-sandwich.vim

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
autocmd User after_vim_plug source ~/.vim/vimrcs/plugin_config/nerdtree.vim

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
autocmd User after_vim_plug source ~/.vim/vimrcs/plugin_config/fzf.vim

" Make vim as smart as VSCode
if executable('node')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  autocmd User after_vim_plug source ~/.vim/vimrcs/plugin_config/coc.vim
endif

" Beautiful status line
Plug 'vim-airline/vim-airline'
autocmd User after_vim_plug source ~/.vim/vimrcs/plugin_config/airline.vim

" Table alignment
Plug 'junegunn/vim-easy-align'

" Markdown table editor
Plug 'dhruvasagar/vim-table-mode'

" GitHub Copilot
if executable('node')
  Plug 'github/copilot.vim'
endif

call plug#end()
doautocmd User after_vim_plug

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

source ~/.vim/vimrcs/plugin_config/config.vim
