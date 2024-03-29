local noerr, _ = pcall(require, 'packerInit')
local packer

if noerr then
    packer = require'packer'
else
    return
end

local use = packer.use
return packer.startup(function ()
    use { 'wbthomason/packer.nvim' }

    use { 'nvim-lua/popup.nvim' }

    use { 'nvim-lua/plenary.nvim' }

	use {
		'karb94/neoscroll.nvim',
		config = function ()
			require'neoscroll'.setup()
		end
	}

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }, { "nvim-telescope/telescope-file-browser.nvim" } },
        config = function()
            require'plugins.telescope'
            require'mappings'.telescope()
        end
    }

	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function ()
			require'plugins.toggleterm'
		end
	}

    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require'plugins.gitsigns'
        end
    }

	use {
		'kdheepak/lazygit.nvim',
		config = function()
			require'mappings'.nlazygit()
		end
	}

    --use {
    --    'kyazdani42/nvim-tree.lua',
    --    requires = 'kyazdani42/nvim-web-devicons',
    --    config = function ()
    --        require'plugins.nvimtree'
    --        require'mappings'.nvimtree()
    --    end
    --}

    use {
        'windwp/nvim-autopairs',
        config = function()
            require'plugins.autopairs'
        end
    }
    use { 'Mofiqul/dracula.nvim', as = 'dracula' }

	use { 'ful1e5/onedark.nvim', as = 'onedark' }

	use { "ellisonleao/gruvbox.nvim" }

    use {
        'glepnir/galaxyline.nvim',
        config = function ()
            require'plugins.galaxyline'
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'plugins.treesitter'
        end
    }

    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require'plugins.bufferline'
			require'mappings'.bufferline()
        end
    }

    use {
        'glepnir/dashboard-nvim',
        config = function()
            require'plugins.dashboard'
            require'mappings'.dashboard()
        end
    }

    use {
        'onsails/lspkind-nvim',
        config = function()
            require'plugins.lspkind'
        end
    }

    use {
        'andweeb/presence.nvim',
        config = function()
            require'plugins.presence'
        end
    }

	--use {
	--	"Pocco81/AutoSave.nvim",
	--	config = function ()
	--		require'plugins.autosave'
	--	end
	--}

    use { 'neovim/nvim-lsp' }

	use {
        'neovim/nvim-lspconfig',
        config = function()
            require'plugins.lspconfig'
        end
    }

	use {
		'hrsh7th/nvim-cmp',
		requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip' },
		config = function()
			require'plugins.nvimcmp'
		end
	}

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            require'plugins.dap'
            require'plugins.dapui'
            require'mappings'.dap()
        end
    }
end)
