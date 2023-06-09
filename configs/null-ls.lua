-- custom/configs/null-ls.lua
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- builtin names:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
    formatting.prettier, formatting.autoflake, formatting.clang_format,
    formatting.lua_format, 
    formatting.beautysh, -- Formatting
    lint.semgrep, lint.luacheck, -- Lint
    code_actions.shellcheck, -- Code actions
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end
    -- you can reuse a shared lspconfig on_attach callback here
}
