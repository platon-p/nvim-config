return {
    'stevearc/conform.nvim',
    cmd = {"ConformInfo"},
    keys = {
        {
            "<leader>f",
            function()
                require 'conform'.format({ async = true })
            end,
            mode = ''
        }
    },
    opts = {
        formatters_by_ft = {
            python = { 'isort', 'black' },
            s = { "asm_fmt"}
        },
    },
}
