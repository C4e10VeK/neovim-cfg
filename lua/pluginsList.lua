local noerr, _ = pcall(require, 'packerInit')
local packer

if noerr then
    packer = require'packer'
else
    return
end

local use = packer.use
return packer.startup(function ()
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/popup.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
        config = function()
            require'plugins.telescope'
            require'mappings'.telescope()
        end
    }

    use {
        'lewis6991/gitsigns.nvim', 
        requires = { 'nvim-lua/plenary.nvim' }, 
        config = function() 
            require'plugins.gitsigns' 
        end
    }

    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require'plugins.autopairs'
            require'mappings'.nvimtree()
        end
    }
    use { 'dracula/vim', as = 'dracula'}

    use {
        'itchyny/lightline.vim',
        config = function() 
            require'plugins.statusline'
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

    use 'cdelledonne/vim-cmake'

    use { 'neovim/nvim-lsp' }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'plugins.lspconfig'
        end
    }

    use {
        'hrsh7th/nvim-compe',
        config = function()
            require'plugins.compe'
            require'mappings'.compe()
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
