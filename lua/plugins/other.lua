return {
    "wakatime/vim-wakatime",
    "David-Kunz/gen.nvim",
    "meain/vim-jsontogo",
    {
        "ray-x/lsp_signature.nvim",
        opts = {
            max_width = 50,
            max_height = 14,
            hint_enable = false,
        }
    },
    { "windwp/nvim-autopairs", opts = {} },
    { "folke/neoconf.nvim",    opts = {}, priority = 1000 },
    { "folke/lazydev.nvim",    opts = {} },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            scope = { enabled = false }
        }
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    }
}
