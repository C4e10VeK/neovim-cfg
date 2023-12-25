local err, toggleterm = pcall(require, 'toggleterm')

if not err then
    return
end

toggleterm.setup{
	size = 20,
	open_mapping = [[<c-\>]],
	direction = 'float',
	auto_scroll = true,
	float_opts = {
		border = 'single'
	}
}

-- toggleterm.setup()

