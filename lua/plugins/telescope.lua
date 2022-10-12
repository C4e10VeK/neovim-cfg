local err, telescope = pcall(require, 'telescope')

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
	pickers = {
		find_files = {
			theme = "ivy",
			hidden = true
		}
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true
		}
	}
}

telescope.load_extension("file_browser")
