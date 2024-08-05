---@diagnostic disable: undefined-global
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- complete window and complete providers
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-path',         -- source for system paths
            'hrsh7th/cmp-emoji',        -- emoji
            'hrsh7th/cmp-nvim-lua',     -- nvim lua api
            'saadparwaiz1/cmp_luasnip', -- snippets
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
        config = function()
            require('plugins/cmp')
        end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- installer
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('plugins/lsp-installer')
        end
    }

    -- use "luasnip/loaders/from_vscode"
    use {
        '/L3MON4D3/LuaSnip',
        config = function()
            require('plugins/snippets')
        end
    }

    -- syntax parser
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require 'plugins/treesitter' end
    }

    -- auto closing tags and parentheses
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- prettier
    use {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production',
    }

    -- icons in complete window
    use 'onsails/lspkind-nvim'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end,
    }

    -- tabs on top
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
    }

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function() require'plugins/nvim-tree' end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    -- git diff signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'plugins/gitsigns-nvim' end,
        tag = 'v0.8.0'
    }
    -- Colorscheme
    use 'morhetz/gruvbox'
    use 'sainnhe/everforest'
    use 'ayu-theme/ayu-vim'
    use 'doums/darcula'
    use 'ajmwagar/vim-deus'

    use 'frabjous/knap'
    use 'lervag/vimtex'

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    -- use 'github/copilot.vim'
    use 'CRAG666/code_runner.nvim'
    use 'wakatime/vim-wakatime'
end)
