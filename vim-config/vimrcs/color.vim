""""""""""""""""""""""""""""""""""""""""
" Overwrite the some colors of the colorscheme
""""""""""""""""""""""""""""""""""""""""

" Cursorline
hi CursorLine cterm=none ctermfg=none ctermbg=236
hi CursorLineNr cterm=bold ctermfg=226 ctermbg=236
set cursorline

" Folding
hi Folded cterm=bold ctermfg=232 ctermbg=228
hi FoldColumn cterm=bold ctermfg=46 ctermbg=none

" Comment
hi Comment cterm=none ctermfg=67 ctermbg=none

" Todo
hi Todo cterm=bold ctermfg=none ctermbg=red

" Sign
hi SignColumn cterm=none ctermfg=none ctermbg=none
hi SignatureMarkText cterm=bold ctermfg=201 ctermbg=none

" TabLine
hi TabLine cterm=none ctermfg=none ctermbg=236
hi TabLineSel cterm=none ctermfg=232 ctermbg=207
hi TabLineFill cterm=none ctermfg=none ctermbg=none

" Color the column to keep code short
hi ColorColumn ctermbg=red
set colorcolumn=80
autocmd FileType text,html
    \ setlocal colorcolumn=

