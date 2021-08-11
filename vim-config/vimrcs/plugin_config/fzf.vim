"
" Settings of the plugins 'junegunn/fzf' and 'junegunn/fzf.vim'
"

" ========================================
" Global settings

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

if has('popupwin')
  let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.6}}
else
  let g:fzf_layout = {'left': '50%'}
endif

let g:fzf_preview_window = ''
let g:fzf_buffers_jump = 1

" ========================================
" Mappings

" Files in current directory
nnoremap <Leader>f :Files<CR>

" Files in git repository (without files specified in .gitignore)
nnoremap <Leader>g :GFiles<CR>

" Buffers
nnoremap <Leader>b :Buffers<CR>

" Tags
nnoremap <Leader>t :BTags<CR>

" Snippets
inoremap <C-l> <C-r>=fzf#vim#snippets({'options': ['--layout=reverse']}, 0)<CR>
