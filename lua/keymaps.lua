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

map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })



--nm('<M-Enter>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
--im('<M-Enter>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
