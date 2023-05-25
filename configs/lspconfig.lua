local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- server names:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "pylsp", "jdtls", "html", "tailwindcss"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

