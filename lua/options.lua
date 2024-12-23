local opt = vim.opt
require("fold")

-----

opt.mouse = 'a'
opt.encoding = 'utf-8'

opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals

----- tabs -----

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

----- Appearance -----

vim.opt.colorcolumn = "80"
opt.pumheight = 10
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true

vim.cmd [[let g:gruvbox_invert_selection='0']]
vim.cmd [[colorscheme gruvbox]]
