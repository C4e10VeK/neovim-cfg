local noerr, gitsigns = pcall(require, 'gitsigns')

if not noerr then
    return
end

gitsigns.setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    --keymaps = {
    --    -- Default keymap options
    --    noremap = true,

    --    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    --    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    --    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    --    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    --    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    --    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    --    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    --    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    --    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    --    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    --    -- Text objects
    --    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    --    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    --},
	on_attach = function(buffer)
		local function map(mode, lhs, rhs, opts)
	        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        	vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
    	end

		 -- Navigation
    	map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
	    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

	    -- Actions
    	map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    	map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    	map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    	map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    	map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    	map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    	map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    	map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    	map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    	map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    	map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    	map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    	map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    	-- Text object
    	map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    	map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end,
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    current_line_blame = false,
    current_line_blame_opts = {
		delay = 1000,
		virt_text_pos = 'eol'
	},
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    diff_opts = {
		internal = true;
	},  -- If luajit is present
}
