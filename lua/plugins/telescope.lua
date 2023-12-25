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
			theme = 'dropdown',
			hidden = true
		},
		oldfiles = {
			theme = 'dropdown'
		},
		live_grep = {
			theme = 'dropdown'
		},
		marks = {
			theme = 'dropdown'
		}
	},
	extensions = {
		file_browser = {
			theme = 'dropdown',
			hijack_netrw = true
		}
	}
}

telescope.load_extension("file_browser")
