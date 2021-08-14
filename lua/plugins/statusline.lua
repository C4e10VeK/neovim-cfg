local theme = require'config'.options.theme

vim.g.lightline = {
    colorscheme = theme,
    active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
    component_function = { gitbranch = 'fugitive#head' },
}
