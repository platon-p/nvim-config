local map = vim.api.nvim_set_keymap

-- nm
---@diagnostic disable-next-line
function nm(key, cmd)
    map('n', key, cmd, {noremap = true})
end

-- im
---@diagnostic disable-next-line
function im(key, cmd)
    map('i', key, cmd, {noremap = true})
end

-- vm
---@diagnostic disable-next-line
function vm(key, cmd)
    map('v', key, cmd, {noremap = true})
end

-- tm
---@diagnostic disable-next-line
function tm(key, cmd)
    map('t', key, cmd, {noremap = true})
end

