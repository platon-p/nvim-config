return {
    "wakatime/vim-wakatime",
    { "windwp/nvim-autopairs", opts = {} },
    { "folke/neoconf.nvim",    opts = {}, priority = 1000 },
    { "folke/lazydev.nvim",    opts = {} },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = {'nvim-tree/nvim-web-devicons'},
        opts = {},
    },
}
