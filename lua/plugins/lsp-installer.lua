local lspinstaller = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

lspinstaller.setup {
    ensure_installed = "all"
}

-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
    -- Tier A
    'jdtls', 'gopls',
    -- 'kotlin-language-server',
    -- Tier B
    'pyright', 'rust_analyzer', 'tsserver', 'jsonls',

    -- Tier C
    'clangd', 'lua_ls',

    'nginx_language_server',
    --'docker_compose_language_service',
    "yamlls", "taplo"
}

vim.filetype.add {
    filename = {
        ['docker-compose.yaml'] = 'yaml.docker-compose'
    }
}

lspconfig.omnisharp.setup {
    capabilities = {
        semanticTokensProvider = nil,
    }
}

lspconfig.kotlin_language_server.setup {
    cmd = { "/Users/bibbob/tmp/kotlin-language-server/server/build/install/server/bin/kotlin-language-server" },
    capabilities = capabilities,
}

lspconfig.matlab_ls.setup {
    cmd = { "node", "/Users/bibbob/tmp/MATLAB-language-server/out/index.js", "--stdio" },
    capabilities = cmp_lsp.default_capabilities(),
    single_file_support = true,
}

lspconfig.sqlls.setup {
    single_file_support = true,
}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        on_init = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
        end,
    }
end
