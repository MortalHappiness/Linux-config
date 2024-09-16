""""""""""""""""""""""""""""""""""""""""
" Settings of the plugins that can be set even if the plugin is not loaded
""""""""""""""""""""""""""""""""""""""""

" => sheerun/vim-polyglot
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" => ervandew/supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" => SirVer/ultisnips
if g:my_plugin_ultisnips_loaded
  let g:UltiSnipsExpandTrigger="<TAB>"
  let g:UltiSnipsJumpForwardTrigger="<TAB>"
  let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/myUltiSnips']
endif

" => kshenoy/vim-signature
hi SignatureMarkText cterm=bold ctermfg=201 ctermbg=NONE gui=bold guifg=#ff00ff guibg=NONE

" => junegunn/vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" => preservim/tagbar
nmap <F8> :TagbarToggle<CR>

" => preservim/nerdcommenter
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDDefaultAlign='left'
nmap <c-/> <plug>NERDCommenterToggle
vmap <c-/> <plug>NERDCommenterToggle
nmap <c-_> <plug>NERDCommenterToggle
vmap <c-_> <plug>NERDCommenterToggle
nmap <c-M> <plug>NERDCommenterToggle
vmap <c-M> <plug>NERDCommenterToggle

" => zhimsel/vim-stay
augroup my_plugin_vim_stay
  autocmd!
  autocmd User BufStayLoadPost if &ft == 'vim' | set foldmethod=marker | endif
augroup END

" => Yggdroot/indentLine
let g:indentLine_char_list = ['⎸']
let g:indentLine_fileTypeExclude = ['json', 'markdown']
let g:indentLine_bufTypeExclude = ['help']
augroup my_plugin_indentLine
  autocmd!
  autocmd FileType json,markdown setlocal conceallevel=0
augroup END

" => mattn/emmet-vim
augroup my_plugin_emmet_vim
  autocmd!
  autocmd FileType html nmap <Tab> <plug>(emmet-expand-abbr)
  autocmd FileType html imap <Tab> <plug>(emmet-expand-abbr)
  autocmd FileType html vmap <Tab> <plug>(emmet-expand-abbr)
augroup END
