return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    auto_install = true,
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>gn",
        node_incremental = "+",
        node_decremental = "-",
      }
    },

  },
  config = function(_, opts)
    local configs = require 'nvim-treesitter.configs'
    configs.setup(opts)
  end
}
