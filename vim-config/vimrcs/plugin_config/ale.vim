"
" Settings of the plugin 'dense-analysis/ale'
"

" ========================================

nmap sn <Plug>(ale_next_wrap)
nmap sN <Plug>(ale_previous_wrap)
let g:ale_echo_msg_format = '[%linter%][%severity%] %code: %%s'
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \'c': ['gcc'],
    \'cpp': ['gcc'],
    \'javascript': ['eslint'],
    \'javascriptreact': ['eslint'],
    \'python': ['pycodestyle'],
    \'typescript': ['tsserver', 'eslint'],
    \'typescriptreact': ['tsserver', 'eslint'],
    \'vim': ['vint'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'c': ['clang-format'],
    \'cpp': ['clang-format'],
    \'css': ['prettier'],
    \'html': ['prettier'],
    \'javascript': ['prettier', 'eslint'],
    \'javascriptreact': ['prettier', 'eslint'],
    \'json': ['prettier'],
    \'markdown': ['prettier'],
    \'python': ['autopep8'],
    \'scss': ['prettier'],
    \'snippets': ['remove_trailing_lines'],
    \'typescript': ['prettier', 'eslint'],
    \'typescriptreact': ['prettier', 'eslint'],
    \'vim': ['remove_trailing_lines', 'trim_whitespace'],
    \'sh': ['remove_trailing_lines', 'trim_whitespace'],
    \'yaml': ['prettier'],
\}
"let g:ale_disable_lsp = 1
