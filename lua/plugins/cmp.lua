return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lua',     -- nvim lua api
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip', -- snippets

    'onsails/lspkind-nvim',     -- show kind of completion (function, snippet, ...)
    -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    -- 'hrsh7th/cmp-path',     -- source for system paths
    -- 'hrsh7th/cmp-emoji',    -- emoji
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require 'luasnip'
    local compare = cmp.config.compare

    cmp.setup {
      autocomplete = false,
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP 👄
        { name = 'nvim_lua' }, -- nvim lua api
        { name = 'luasnip' },  -- Luasnip 🐌
        { name = 'lazydev' }
        -- { name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
        -- { name = 'path' },     -- Пути 🪤
        -- { name = "emoji" },    -- Эмодзи 😳
      }, {}),
      sorting = {
        --priority_weight = 0.1,
        comparators = {
          compare.exact,
          compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
          cmp.config.compare.offset,
          cmp.config.compare.order,
        },
      },
      window = {
        documentation = {
          max_width = 50,
          max_height = 14,
        },
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
        end,
      },

      -- Клавиши, которые будут взаимодействовать в nvim-cmp
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),                          -- Прерываем автодополнение
          c = cmp.mapping.close(),                          -- Закрываем автодополнение
        }),

        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    }
  end
}
