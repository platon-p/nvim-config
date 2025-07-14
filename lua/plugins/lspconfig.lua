return {
  'neovim/nvim-lspconfig',
  lazy = false,
  keys = {
    { "gR",              vim.lsp.buf.rename },
    { "<leader><Space>", vim.lsp.buf.code_action }
  },
}
