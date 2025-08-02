local extr_args = {
  "--hidden", -- Search hidden files that are prefixed with `.`
  "-g", "!.git/",
  "-g", "!node_modules/",
  "-g", "!vendor"
}

return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    lazy = false,
    keys = function()
      local telescope = require "telescope.builtin"
      return {
        { "ff", telescope.find_files },
        { "fF", telescope.current_buffer_fuzzy_find },
        { "fb", telescope.builtin },
        { "fg", function() telescope.live_grep { additional_args = extr_args } end },

        { "gr", telescope.lsp_references },
        { "gd", telescope.lsp_definitions },
        { "gi", telescope.lsp_implementations },

        { "gt", function() require 'trouble.sources.telescope'.open() end },
      }
    end,
    opts = {
      extensions = {
        fzf1 = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      },
    },
    config = function(opts)
      local telescope = require('telescope')

      telescope.setup(opts)
      telescope.load_extension('ui-select')
      telescope.load_extension('fzf')
    end
  },
}
