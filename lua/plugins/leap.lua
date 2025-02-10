return {
  "ggandor/leap.nvim",
  opts = {},
  config = function(cfg)
    local leap = require('leap')
    leap.setup(cfg)
    leap.create_default_mappings()
    vim.keymap.set({ 'n', 'x', 'o' }, 'ga', function()
      require('leap.treesitter').select()
    end)
  end
}
