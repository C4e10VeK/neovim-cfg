local CH = {}

local setKeyMap = vim.api.nvim_set_keymap
local keyMapSettings = { noremap = true, silent = true }

-- telescope mapping
CH.telescope = function()
    setKeyMap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], keyMapSettings)
    setKeyMap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], keyMapSettings) 
end

-- dap mappings
setKeyMap('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', keyMapSettings)
setKeyMap('n', '<F12>', ':lua require"dap".step_out()<CR>', keyMapSettings)
setKeyMap('n', '<F11>', ':lua require"dap".step_into()<CR>', keyMapSettings)
setKeyMap('n', '<F10>', ':lua require"dap".step_over()<CR>', keyMapSettings)
setKeyMap('n', '<F5>', ':lua require"dap".continue()<CR>', keyMapSettings)
setKeyMap('n', '<leader>dk', ':lua require"dap".up()<CR>', keyMapSettings)
setKeyMap('n', '<leader>dj', ':lua require"dap".down()<CR>', keyMapSettings)
setKeyMap('n', '<leader>d_', ':lua require"dap".disconnect();require"dap".stop();require"dap".run_last()<CR>', keyMapSettings)
setKeyMap('n', '<leader>dr', ':lua require"dap".repl.open({}, "vsplit")<CR><C-w>l', keyMapSettings)
setKeyMap('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>', keyMapSettings)

-- nvim tree
CH.nvimtree = function()
    setKeyMap('n', '<C-n>', ':NvimTreeToggle<CR>', keyMapSettings)
    setKeyMap('n', '<leader><C-n>', ':NvimTreeOpen<CR>', keyMapSettings)
    setKeyMap('n', '<leader>r', ':NvimTreeRefresh<CR>', keyMapSettings)
    setKeyMap('n', '<leader>n', ':NvimTreeFindFile<CR>', keyMapSettings)
end

CH.dashboard = function()
    setKeyMap("n", '<leader>db', ":Dashboard<CR>", keyMapSettings)
    setKeyMap("n", '<leader>fn', ":DashboardNewFile<CR>", keyMapSettings)
    setKeyMap("n", '<leader>bm', ":DashboardJumpMarks<CR>", keyMapSettings)
    setKeyMap("n", '<leader>l', ":SessionLoad<CR>", keyMapSettings)
    setKeyMap("n", '<leader>s', ":SessionSave<CR>", keyMapSettings)
end

-- compe
setKeyMap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
setKeyMap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
setKeyMap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
setKeyMap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

setKeyMap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
setKeyMap('i', '<c-space>', 'compe#complete()', { expr = true })

return CH
