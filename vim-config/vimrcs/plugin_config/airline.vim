""""""""""""""""""""""""""""""""""""""""
" Settings of the plugin 'vim-airline/vim-airline'
""""""""""""""""""""""""""""""""""""""""

" ========================================
" Basic setting {{{

let g:airline_highlighting_cache = 1

"}}}
" ========================================
" Symbols and separators {{{

let g:airline_left_sep= ''
let g:airline_right_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols_ascii = 1
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = ' '

"}}}
" ========================================
" Parts {{{

" mode that will not be shorten when window size changes
function Parts_my_mode()
  return get(w:, 'airline_current_mode', '')
endfunction

function Parts_my_readonly()
  " only consider regular buffers (e.g. ones that represent actual files,
  " but not special ones like e.g. NERDTree)
  if !empty(&buftype) || airline#util#ignore_buf(bufname('%'))
    return ''
  endif
  if &readonly && !filereadable(bufname('%'))
    return '[Permission Denied]'
  else
    return &readonly ? '[readonly]' : ''
  endif
endfunction

call airline#parts#define('my_mode', {
      \ 'function': 'Parts_my_mode',
      \ 'accent': 'bold',
      \ })

call airline#parts#define('my_readonly', {
      \ 'function': 'Parts_my_readonly',
      \ 'accent': 'red',
      \ })

"}}}
" ========================================
" Sections {{{

function! AirlineInit()
  let spc = ' '
  let g:airline_section_a = airline#section#create_left([
        \'my_mode', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
  let g:airline_section_b = '%{fnamemodify(getcwd(), ":p:~")}'
  if exists('+autochdir') && &autochdir == 1
    let g:airline_section_c = airline#section#create(['%<', 'path', spc, 'my_readonly'])
  else
    let g:airline_section_c = airline#section#create(['%<', 'file', spc, 'my_readonly', 'coc_status'])
  endif
  let g:airline_section_x = airline#section#create_right(['vista', 'gutentags', 'grepper', 'filetype'])
  let g:airline_section_y = airline#section#create_right(['ffenc'])
  if airline#util#winwidth() > 79
    let g:airline_section_z = airline#section#create(['%3p%%'.spc, 'linenr', 'maxlinenr', spc.':%3v'])
  else
    let g:airline_section_z = airline#section#create(['%3p%%'.spc, 'linenr',  ':%3v'])
  endif
  let g:airline_section_error = airline#section#create(['ale_error_count', 'coc_error_count'])
  let g:airline_section_warning = airline#section#create(['ale_warning_count', 'whitespace', 'coc_warning_count'])
endfunction
augroup my_plugin_airline
  autocmd!
  autocmd User AirlineAfterInit call AirlineInit()
augroup END

"}}}
" ========================================
" Airline extensions {{{

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'Error: '
let airline#extensions#ale#warning_symbol = 'Warning: '
let airline#extensions#ale#show_line_numbers = 0
let airline#extensions#coc#error_symbol = 'Error: '
let airline#extensions#coc#warning_symbol = 'Warning: '

"}}}
