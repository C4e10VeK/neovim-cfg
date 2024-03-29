local noerr, dapui = pcall(require, 'dapui')

if not noerr then
    return
end

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
	layouts = {
    	{
    	    -- You can change the order of elements in the sidebar
    	    elements = {
    	        -- Provide as ID strings or tables with "id" and "size" keys
    	        {
    	            id = "scopes",
    	            size = 0.25, -- Can be float or integer > 1
    	        },
    	        { id = "breakpoints", size = 0.25 },
    	        { id = "stacks", size = 0.25 },
    	        { id = "watches", size = 00.25 },
    	    },
    	    size = 40,
    	    position = "left", -- Can be "left" or "right"
    	},
    	{
    	    elements = { "repl" },
    	    size = 10,
    	    position = "bottom", -- Can be "bottom" or "top"
    	},
	},
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        mappings = {
            close = { "<leader>q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})
