local err, toggleterm = pcall(require, 'toggleterm')

if not err then
    return
end

local leaderkey = require"config".options.leaderkey

toggleterm.setup{
	size = 20,
	open_mapping = [[<Leader>\]],
	direction = 'float',
	auto_scroll = true,
	float_opts = {
		border = 'single'
	}
}

