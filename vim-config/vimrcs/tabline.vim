""""""""""""""""""""""""""""""""""""""""
" TabLine Settings
""""""""""""""""""""""""""""""""""""""""

set showtabline=2
set tabline=%!MyTabLine()

" References:
" https://vim.fandom.com/wiki/Show_tab_number_in_your_tab_line
" https://stackoverflow.com/questions/5927952/whats-the-implementation-of-vims-default-tabline-function
function MyTabLine()
  let s = ''
  let t = tabpagenr()
  for i in range(1, tabpagenr('$'))
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let wn = tabpagewinnr(i, '$')
    let bufnr = buflist[winnr - 1]
    let filename = bufname(bufnr)
    let buftype = getbufvar(bufnr, '&buftype')

    " Normal buffer
    if buftype ==# ''
      " Extract tail of the filename
      let filename = fnamemodify(filename, ':t')
      if filename ==# ''
        let filename = '[No Name]'
      endif
      if getbufvar(bufnr, '&modified')
        let filename .= '[+]'
      endif
    elseif buftype ==# 'help'
      let filename = '[help] '.fnamemodify(filename, ':t')
    elseif buftype ==# 'terminal'
      let filename = '[Terminal]'
    elseif buftype ==# 'quickfix'
      let filename = '[quickfix]'
    else
      let filename = '['.filename.']'
    endif

    if (i == t)
      if getbufvar(bufnr, '&modified')
        let s .= '%#TabNumSelModified# '.i.' '
        let s .= '%#TabLineSelModified#'
      else
        let s .= '%#TabNumSel# '.i.' '
        let s .= '%#TabLineSel#'
      endif
    else
      let s .= '%#TabNum# '.i.' '
      let s .= '%#TabLine#'
    endif
    let s .= ' '.filename.' '
  endfor
  let s .= '%#TabLineFill#%='
  return s
endfunction

hi TabLine cterm=NONE ctermfg=255 ctermbg=238
hi TabLineSel cterm=NONE ctermfg=17 ctermbg=190
hi TabLineSelModified cterm=NONE ctermfg=17 ctermbg=45
hi TabLineFill cterm=none ctermfg=none ctermbg=none
hi TabNum cterm=bold ctermfg=231 ctermbg=232
hi TabNumSel cterm=bold ctermfg=232 ctermbg=46
hi TabNumSelModified cterm=bold ctermfg=231 ctermbg=55
