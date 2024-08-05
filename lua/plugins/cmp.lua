local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require 'luasnip'

cmp.setup {
    autocomplete = false,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },                -- LSP 👄
        { name = 'nvim_lua' },                -- nvim lua api
        { name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
        { name = 'luasnip' },                 -- Luasnip 🐌
        { name = 'path' },                    -- Пути 🪤
        { name = "emoji" },                   -- Эмодзи 😳
    }, {}),
    formatting = {
        format = lspkind.cmp_format({
            -- show only symbol annotations
            mode = 'symbol',

            -- prevent the popup from showing more
            -- than provided characters (e.g 50 will not show more than 50 characters)
            maxwidth = 50,

            -- when popup menu exceed maxwidth, the truncated part
            -- would show ellipsis_char instead (must define maxwidth first)
            ellipsis_char = '...',
        })
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
        end,
    },

    -- Клавиши, которые будут взаимодействовать в nvim-cmp
    mapping = {
        -- Вызов меню автодополнения
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

        -- Используем <C-e> для того чтобы прервать автодополнение
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(), -- Прерываем автодополнение
            c = cmp.mapping.close(), -- Закрываем автодополнение
        }),

        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),

        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
}
