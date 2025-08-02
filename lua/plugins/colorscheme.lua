return {
  {
    "morhetz/gruvbox",
    priority = 1000,
    config = function()
      vim.cmd [[let g:gruvbox_invert_selection='0']]
      vim.cmd [[colorscheme gruvbox]]
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
  },
  "sainnhe/everforest",
  "ayu-theme/ayu-vim",
  "doums/darcula",
  "ajmwagar/vim-deus",
  "mhartington/oceanic-next",
  "rebelot/kanagawa.nvim",
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "kepano/flexoki-neovim",
}
