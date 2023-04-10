-- Ensure we got packer installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color theme
    use 'arcticicestudio/nord-vim'
    use 'rakr/vim-one'
    use 'ellisonleao/gruvbox.nvim'

    -- Telescope packages
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Git plugin
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- Commenter
    use 'preservim/nerdcommenter'

    -- Status line
    use 'itchyny/lightline.vim'

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        --tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Undotree
    use 'mbbill/undotree'

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Sartup dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    -- LSP stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- Project management
            {
                "ahmedkhalf/project.nvim",
                config = function()
                    require("project_nvim").setup {}
                end
            }
        }
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
