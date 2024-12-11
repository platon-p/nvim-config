return {
    'neovim/nvim-lspconfig',
    lazy = false,
    keys = {
        { "gR", vim.lsp.buf.rename },
        { "<M-CR>", "<cmd>lua vim.lsp.buf.code_action()<cr>" }
    }
}
