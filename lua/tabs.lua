local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*.tsx',
    callback = function ()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
