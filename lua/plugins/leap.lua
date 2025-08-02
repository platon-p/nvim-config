return {
  "ggandor/leap.nvim",
  opts = {},
  lazy = false,
  keys = {
    { "ga", function() require('leap.treesitter').select() end, mode = {"n", "x", "o"}}
  },
  config = function(cfg)
    local leap = require('leap')
    leap.setup(cfg)
    leap.create_default_mappings()
  end
}
