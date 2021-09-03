local noerr, dap = pcall(require, 'dap')
local noerr2, dapvscode = pcall(require, 'dap.ext.vscode')
local fn = vim.fn

if not (noerr or noerr2) then
    return
end

fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

local function initAdapters()
	dap.adapters.lldb = {
		type = 'executable',
		command = '/usr/bin/lldb-vscode', -- adjust as needed
		name = "lldb"
	}

	dap.adapters.cppdbg = {
    	type = 'executable',
    	command = '/hdd1/cpptools/extension/debugAdapters/OpenDebugAD7'
	}
end

local function inintLangsConfig()
	dap.configurations.cpp = {
    	{
        	name = "Launch GDB",
        	type = "cppdbg",
     	   request = "launch",
        	program = function()
            	return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        	end,
        	cwd = function()
            	return vim.fn.input('Path to current work dir: ', vim.fn.getcwd() .. '/', 'dir')
        	end,
        	stopOnEntry = false,
			MIMode = 'gdb',
			miDebuggerPath = '/usr/bin/gdb',
        	setupCommands = {{
            	description = 'Enable pretty-printing for gdb',
            	text = '-enable-pretty-printing',
            	ignoreFaillures = true
        	}},
    	},
    	{
        	name = 'Attach to server: 1234',
        	type = 'cppdbg',
        	request = 'launch',
        	MIMode = 'gdb',
        	miDebuggerServerAddress = 'localhost:1234',
        	miDebuggerPath = '/usr/bin/gdb',
        	cwd = '${fileDirname}',
        	stopOnEntry = false,
        	program = function()
            	return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        	end,
        	setupCommands = {{
            	description = 'Enable pretty-printing for gdb',
            	text = '-enable-pretty-printing',
            	ignoreFaillures = true
        	}},
    	},
		{
			name = '(LLDB) launch',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    		end,
			cwd = function()
            	return vim.fn.input('Path to current work dir: ', vim.fn.getcwd() .. '/', 'dir')
        	end,
			stopOnEntry = false,
			args = {},
			runInTerminal = false,
			setupCommands = {{
            	description = 'Enable pretty-printing for lldb',
            	text = '-enable-pretty-printing',
            	ignoreFaillures = true
        	}},
		}
	}

	dap.configurations.c = dap.configurations.cpp;

	dap.configurations.rust = {
		{
			name = '(LLDB) launch',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    		end,
			cwd = function()
            	return vim.fn.input('Path to current work dir: ', vim.fn.getcwd() .. '/', 'dir')
        	end,
			stopOnEntry = false,
			args = {},
			runInTerminal = false,	
		}
	}
end

initAdapters()
inintLangsConfig()

dapvscode.load_launchjs()
