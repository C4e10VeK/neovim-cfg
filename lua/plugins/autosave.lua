local noerr, autosave = pcall(require, 'autosave')

if not noerr then
	return
end

package.path = package.path .. ';../config.lua'
local enabled = require'config'.options.autosave

autosave.setup{
	enabled = enabled,
	execution_message = {
		message = function () return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")) end,
		dim = 0.18,
		cleaning_interval = 1250
	},
	events = {"InsertLeave", "TextChanged"},
	conditions = function (buf)
		local fn = vim.fn
		local utils = require('auto-save.utils.data')

		if fn.getbufvar(buf, "&modifiable") == 1 or utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true
		end
		return false
	end,
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 135
}

