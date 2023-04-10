require("nprimo")

vim.cmd([[
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }
]])
