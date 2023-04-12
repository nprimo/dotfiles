require("nprimo")

vim.g['lightline'] = {
    colorscheme = 'rosepine',
    active = {
        left = { { 'mode', 'paste' },
            { 'gitbranch', 'readonly', 'relativepath', 'modified' } }
    },
    component_function = {
        gitbranch = 'FugitiveHead'
    },
}
