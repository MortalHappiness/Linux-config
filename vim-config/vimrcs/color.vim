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

" SpecialKey
hi SpecialKey cterm=none ctermfg=197 ctermbg=none

" Sign
hi SignColumn cterm=none ctermfg=none ctermbg=none
hi SignatureMarkText cterm=bold ctermfg=201 ctermbg=none

" TabLine
hi TabLine cterm=none ctermfg=255 ctermbg=238
hi TabLineSel cterm=none ctermfg=17 ctermbg=190
hi TabLineSelModified cterm=none ctermfg=17 ctermbg=45
hi tablinefill cterm=none ctermfg=none ctermbg=none
hi tabnum cterm=bold ctermfg=231 ctermbg=232
hi tabnumsel cterm=bold ctermfg=232 ctermbg=46
hi tabnumselmodified cterm=bold ctermfg=231 ctermbg=55


" Color the column to keep code short
hi ColorColumn ctermbg=red
set colorcolumn=80
autocmd FileType text,html,json,qf
    \ setlocal colorcolumn=

