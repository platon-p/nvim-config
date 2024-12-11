return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        lazy = false,
        keys = {
            { "ff", "<cmd>Telescope find_files<cr>" },
            { "fF", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
            { "fg", "<cmd>Telescope live_grep<cr>" },
            { "fb", "<cmd>Telescope<cr>" },

            { "gr", "<cmd>Telescope lsp_references<cr>" },
            { "gd", "<cmd>Telescope lsp_definitions<cr>" },
            { "gi", "<cmd>Telescope lsp_implementations<cr>" },
        },
        config = function()
            local telescope = require('telescope')

            telescope.setup {
                defaults = {
                    mappings = {
                        n = {
                            ["gt"] = require("trouble.sources.telescope").open
                        }
                    }
                },

                extensions = {
                    fzf = {
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
            }
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')
        end
    },
}
