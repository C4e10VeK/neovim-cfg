local err, telescope = pcall(require, 'telescope')
local setKeyMap = vim.api.nvim_set_keymap

if not err then
    return
end

telescope.setup{
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}
