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
		leaderkey = ' ',
		theme = 'dracula'
	},
	langServers = { 'clangd', 'cmake' },
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
			oldfiles = '<leader>?'
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
			setExceptionBreakpoints = '<leader>de'
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
		compe = {
			tabComplete = '<Tab>',
			sTabComplete = '<S-Tab>',
			confirm = '<CR>',
			complete = '<C-space>'
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
		'Love neoivm!',
		'Where is stack? PepeHands',
		'Смертень ты не прав',
		'Ahegao',
		'"Главное не дестабилизировать ситуацию в Emacsе." (c) CMRDTN.',
		'Где рпгшечка?',
		'Когда рпгшечка?',
		'"Выход есть только 1 и то только в окно peepoDown" (c) Chelovchik',
        '""@FTHRD он все поля приватными делает, но для каждого пишет геттер. Это считается? VeryPog" (c) Gekmi'
	}
}

return CH
