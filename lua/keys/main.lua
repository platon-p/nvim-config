require('keys/alias')

im('<C-k>', '<escape>')
nm('<M-Up>', '<cmd>move -2<CR>')
nm('<M-Down>', '<cmd>move +1<CR>')

nm('gl', '<cmd>NvimTreeFocus<CR>')

nm('ff', '<cmd>Telescope find_files<CR>')
nm('fg', '<cmd>Telescope live_grep<CR>')
nm('fb', '<cmd>Telescope builtin<CR>')

nm('<leader>h', '<cmd>nohlsearch<CR>')
nm('<leader>c', '<cmd>!cat % | pbcopy<CR><CR>')

nm('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
nm('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nm('gf', '<cmd>lua vim.lsp.buf.format()<CR>')
nm('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

nm('<M-Enter>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
im('<M-Enter>', '<cmd>lua vim.lsp.buf.code_action()<CR>')

