local err, bufferline = pcall(require, 'bufferline')
local fn = vim.fn

if not err then
    return
end

bufferline.setup{
    options = {
        diagnostics = 'nvim_lsp',
		separator_style = 'slant',
        offsets = {{
            filetype = 'NvimTree',
			text = '',
            --text = function()
            --    return fn.getcwd()
            --end,
			padding = 1,
            highlight = 'Directory',
            text_align = 'right'
        }}
    }
}
