return {
    'lewis6991/gitsigns.nvim',
    version = 'v0.8.0',
    opts = {
        signs = {
            add = {
                hl = "GitSignsAdd",
                text = "+",
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn",
            },
            change = {
                hl = "GitSignsChange",
                text = "~",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = "x",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = "↑",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
        },
    }
}
