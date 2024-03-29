local CH = {
	options = {
		tabstop = 4,
		siftwidth = 4,
		smarttab = true,
		expandtab = true,
		number = true,
		encoding = 'utf-8',
		mouse = 'a',
		hidden = true,
		cmdheight = 2,
		updatetime = 300,
		swapfile = false,
		backup = false,
		writebackup = false,
		termguicolors = true,
		autosave = true,
		leaderkey = ' ',
		theme = 'gruvbox',
		mode = 'dark',
		lldbPath = '/usr/bin/lldb-vscode',
		cppdbgPath = '/hdd1/cpptools/extension/debugAdapters/OpenDebugAD7'
	},
	langServers = { 'rust_analyzer', 'clangd', 'cmake', 'lua_ls', 'hls' },
	keymaps = {
		telescope = {
			buffer = '<leader><space>',
			findfile = '<leader>sf',
			fuzzyfind = '<leader>sb',
			helptags = '<leader>sh',
			tags = '<leader>st',
			grepstring = '<leader>sd',
			livegrep = '<leader>sp',
			curbuffertag = '<leader>so',
			oldfiles = '<leader>?',
			filebrowser = '<leader>fe'
		},
		dap = {
			toggleBreakpoint = '<leader>b',
			stepOut = '<F12>',
			stepInto = '<F11>',
			stepOver = '<F10>',
			continue = '<F5>',
			up = '<leader>dk',
			down = '<leader>dj',
			disconnect = '<leader>d_',
			replOpen = '<leader>dr',
			setExceptionBreakpoints = '<leader>de',
			closeDapUi = '<leader>dq'
		},
		nvimTree = {
			treeToggle = '<C-n>',
			treeOpen = '<leader><C-n>',
			treeRefresh = '<leader>r',
			findFile = '<leader>n'
		},
		dashboard = {
			dashboard = '<leader>db',
			newFile = '<leader>fn',
			jumpMarks = '<leader>bm',
			sessionLoad = '<leader>l',
			sessionSave = '<leader>ss',
		},
		cmp = {
			tabComplete = '<Tab>',
			confirm = '<CR>',
			complete = '<C-space>',
			abort = '<Esc>',
			docsUp = '<C-b>',
			docsDown = '<C-f>'
		},
		lspconfig = {
			declaration = 'dD',
			definition = 'gd',
			hover = 'K',
			implementation = 'gi',
			signatureHelp = '<C-k>',
			addWorkspaceFolder = '<leader>wa',
			removeWorkspaceFolder = '<leader>wr',
			printFolders = '<leader>wl',
			typeDefinition = '<leader>D',
			rename = '<leader>rn',
			references = 'gr',
			codeAction = '<leader>ca',
			showLineDiagnostics = '<leader>e',
			gotoPrev = '[d',
			gotoNext = ']d',
			setLoclist = '<leader>q',
			lspDocumentSymbols = '<leader>so'
		},
		bufferline = {
			newBuffer = '<S-t>',
			newTab = '<C-t>b',
			close = '<S-x>',
			cycleNext = '<Tab>',
			cyclePrev = '<S-Tab>'
		},
		lazygit = {
			open = '<leader>gg'
		}
	},
	footerText = {
		'summonDestructor3000',
		'Chelovchik',
		'Chelovechik',
		'Chlenovechek',
		'Love neovim!',
		'Where is stack? PepeHands',
		'Смертень ты не прав',
		'Ahegao',
		'"Главное не дестабилизировать ситуацию в Emacsе." (c) CMRDTN.',
		'Где рпгшечка?',
		'Когда рпгшечка?',
		'"Выход есть только 1 и то только в окно peepoDown" (c) Chelovchik',
        '@FTHRD он все поля приватными делает, но для каждого пишет геттер. Это считается? VeryPog" (c) Gekmi',
		'нам в универе был F#. С тех пор они ещё не всё хорошо :)',
		'Они срут в Арче из коробки?',
		'вот это вот что такое полупрямое произведение групп я до октября'
	}
}

return CH
