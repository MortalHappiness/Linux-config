"
" Settings of the plugins 'junegunn/fzf' and 'junegunn/fzf.vim'
"

" ========================================
" Global settings

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'left': '50%'}
let g:fzf_preview_window = ''
let g:fzf_buffers_jump = 1

" ========================================
" Mappings

" Files in current directory
nnoremap <Leader>f :Files<CR>

" Files in git repository (without files specified in .gitignore)
nnoremap <Leader>fg :GFiles<CR>

" Buffers
nnoremap <Leader>fb :Buffers<CR>

" Tags
nnoremap <Leader>t :BTags<CR>

" Snippets
inoremap <C-l> <C-r>=fzf#vim#snippets({'options': ['--layout=reverse']}, 0)<CR>
