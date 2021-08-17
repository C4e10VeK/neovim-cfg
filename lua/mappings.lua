local CH = {}

local setKeyMap = vim.api.nvim_set_keymap
local keyMapSettings = { noremap = true, silent = true }

-- telescope mapping
CH.telescope = function()
   	local keys = require'config'.keymaps.telescope

	setKeyMap('n', keys.buffer, [[<cmd>lua require('telescope.builtin').buffers()<CR>]], keyMapSettings)
   	setKeyMap('n', keys.findfile, [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], keyMapSettings)
   	setKeyMap('n', keys.fuzzyfind, [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], keyMapSettings)
   	setKeyMap('n', keys.helptags, [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], keyMapSettings)
   	setKeyMap('n', keys.tags, [[<cmd>lua require('telescope.builtin').tags()<CR>]], keyMapSettings)
    setKeyMap('n', keys.grepstring, [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], keyMapSettings)
    setKeyMap('n', keys.livegrep, [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], keyMapSettings)
    setKeyMap('n', keys.curbuffertag, [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], keyMapSettings)
    setKeyMap('n', keys.oldfiles, [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], keyMapSettings) 
end

-- dap mappings
CH.dap = function()
    local dapKeys = require'config'.keymaps.dap

    setKeyMap('n', dapKeys.toggleBreakpoint, ':lua require"dap".toggle_breakpoint()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.stepOut, ':lua require"dap".step_out()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.stepInto, ':lua require"dap".step_into()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.stepOver, ':lua require"dap".step_over()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.continue, ':lua require"dap".continue()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.up, ':lua require"dap".up()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.down, ':lua require"dap".down()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.disconnect, ':lua require"dap".disconnect();require"dap".stop();require"dap".run_last()<CR>', keyMapSettings)
    setKeyMap('n', dapKeys.replOpen, ':lua require"dap".repl.open({}, "vsplit")<CR><C-w>l', keyMapSettings)
    setKeyMap('n', dapKeys.setExceptionBreakpoints, ':lua require"dap".set_exception_breakpoints({"all"})<CR>', keyMapSettings)
end

-- nvim tree
CH.nvimtree = function()
    local keys = require'config'.keymaps.nvimTree

    setKeyMap('n', keys.treeToggle, ':NvimTreeToggle<CR>', keyMapSettings)
    setKeyMap('n', keys.treeOpen, ':NvimTreeOpen<CR>', keyMapSettings)
    setKeyMap('n', keys.treeRefresh, ':NvimTreeRefresh<CR>', keyMapSettings)
    setKeyMap('n', keys.findFile, ':NvimTreeFindFile<CR>', keyMapSettings)
end

CH.dashboard = function()
    local keys = require'config'.keymaps.dashboard

    setKeyMap("n", keys.dashboard, ":Dashboard<CR>", keyMapSettings)
    setKeyMap("n", keys.newFile, ":DashboardNewFile<CR>", keyMapSettings)
    setKeyMap("n", keys.jumpMarks, ":DashboardJumpMarks<CR>", keyMapSettings)
    setKeyMap("n", keys.sessionLoad, ":SessionLoad<CR>", keyMapSettings)
    setKeyMap("n", keys.sessionSave, ":SessionSave<CR>", keyMapSettings)
end

CH.bufferline = function()
	local keys = require'config'.keymaps.bufferline

	setKeyMap("n", keys.newBuffer, ":enew<CR>", keyMapSettings)
    setKeyMap("n", keys.newTab, ":tabnew<CR>", keyMapSettings)
    setKeyMap("n", keys.close, ":bd!<CR>", keyMapSettings)

	setKeyMap('n', keys.cycleNext, ':BufferLineCycleNext<CR>', keyMapSettings)
	setKeyMap('n', keys.cyclePrev, ':BufferLineCyclePrev<CR>', keyMapSettings)
end

-- compe
CH.compe = function()
    local  compeKeys = require'config'.keymaps.compe
    setKeyMap('i', compeKeys.tabComplete, 'v:lua.tab_complete()', { expr = true })
    setKeyMap('s', compeKeys.tabComplete, 'v:lua.tab_complete()', { expr = true })
    setKeyMap('i', compeKeys.sTabComplete, 'v:lua.s_tab_complete()', { expr = true })
    setKeyMap('s', compeKeys.sTabComplete, 'v:lua.s_tab_complete()', { expr = true })

    setKeyMap('i', compeKeys.confirm, 'compe#confirm("<cr>")', { expr = true })
    setKeyMap('i', compeKeys.complete, 'compe#complete()', { expr = true })
end

return CH
