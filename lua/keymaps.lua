local map = vim.keymap.set
map("i", '<C-k>', '<escape>')

map("n", '<M-Down>', "<cmd>execute 'move .+' . v:count1<cr>==")
map("n", '<M-Up>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

map("n", 'gl', '<cmd>NvimTreeFocus<CR>')

map("n", '<leader>h', '<cmd>nohlsearch<CR>')
map("n", '<leader>c', '<cmd>!pbcopy < %<CR><CR>')
map("n", "<leader>fw", "<cmd>lua vim.diagnostic.open_float()<CR>")

--nm('<M-Enter>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
--im('<M-Enter>', '<cmd>lua vim.lsp.buf.code_action()<CR>')

