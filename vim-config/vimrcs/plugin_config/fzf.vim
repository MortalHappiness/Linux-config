nnoremap <Leader>f :FZF<CR>
"nnoremap <Leader>b :call fzf#run({})<CR>
"nnoremap <Leader>t :BTags<CR>
"nnoremap <Leader>s :Snippets<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'left': '50%'}
