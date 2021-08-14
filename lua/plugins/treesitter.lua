local noerr, treesitter = pcall(require, 'nvim-treesitter.configs')

if not noerr then
    return
end

treesitter.setup{
    highlight = {
        enable = true,
        use_languagetree = true
    },
    ensure_installed = { 'lua', 'c', 'cpp'}
}