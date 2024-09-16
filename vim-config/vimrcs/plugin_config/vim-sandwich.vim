""""""""""""""""""""""""""""""""""""""""
" Settings of the plugin 'machakann/vim-sandwich'
""""""""""""""""""""""""""""""""""""""""

let g:sandwich_no_default_key_mappings = 1
nmap sa <Plug>(operator-sandwich-add)
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
vmap sa <Plug>(operator-sandwich-add)
" Turn off highlight for delete
call operator#sandwich#set('delete', 'all', 'highlight', 0)
