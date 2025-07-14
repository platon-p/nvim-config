return {
  {
    -- LSP SERVER MANAGEMENT
    'williamboman/mason.nvim',
    dependencies = "nvim-lspconfig",
    config = true,
    opts = {
      ensure_installed = {
        -- markup
        "jsonls", "taplo", "yamlls", "marksman",

        "gopls", "rust_analyzer",
        "lua_ls",
        "ts_ls",
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      -- Can't auto-install these as there is no mappings in mason-lspconfig.
      -- ◍ goimports
      -- ◍ goimports-reviser
      -- ◍ golangci-lint

      mason_lspconfig.setup()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      local servers = mason_lspconfig.get_installed_servers()

      local ignore = function(server_name) end

      local setup = function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_init = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
          end
        }
      end


      for i, v in ipairs(servers) do
        setup(v)
      end
    end
  },
}
