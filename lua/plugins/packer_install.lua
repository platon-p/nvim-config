---@diagnostic disable: undefined-global
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'lervag/vimtex'
    use 'wbthomason/packer.nvim'

    use 'CRAG666/code_runner.nvim'

    use 'frabjous/knap'

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'plugins/gitsigns-nvim' end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugins/treesitter')
        end,
    }

    use 'nvim-treesitter/playground'

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- Colorscheme
    use 'morhetz/gruvbox'
    use 'sainnhe/everforest'
    use 'ayu-theme/ayu-vim'
    use 'doums/darcula'
    use 'ajmwagar/vim-deus'

    --kotlin
    -- use 'udalov/kotlin-vim'

    -- Utils
    -- prettier
    use {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production',
    }
    -- use 'github/copilot.vim'
    -- wakatime
    use 'wakatime/vim-wakatime'
    -- terminal
    use {
        's1n7ax/nvim-terminal',
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()
        end,
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

    -- icons
    use 'onsails/lspkind-nvim'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end,
    }

    -- use "luasnip/loaders/from_vscode"
    use {
        '/L3MON4D3/LuaSnip',
        config = function()
            require('plugins/snippets')
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
        },
        config = function()
            require('plugins/cmp')
        end
    }
end)
