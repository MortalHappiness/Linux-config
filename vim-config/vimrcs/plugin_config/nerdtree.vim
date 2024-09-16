""""""""""""""""""""""""""""""""""""""""
" Settings of the plugin 'preservim/nerdtree'
""""""""""""""""""""""""""""""""""""""""

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
