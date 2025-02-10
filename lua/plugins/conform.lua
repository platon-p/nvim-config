return {
  'stevearc/conform.nvim',
  lazy = false,
  cmd = { "ConformInfo" },
  keys = {
    {
      "gf",
      function()
        require("conform").format({ async = true, timeout_ms = 200 })
      end,
    }
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      python = { 'isort', 'black' },
      asm = { "asmfmt" },
      go = { "goimports", lsp_format = "first" },
      typst = { "typstfmt" },
      sh = { "shfmt" },
      typescriptreact = { "prettier", lsp_format = "first" },
      js = { "prettier" },
      ts = { "prettier" },
    },
    default_format_opts = {
      lsp_format = "prefer"
    },
  },
}
