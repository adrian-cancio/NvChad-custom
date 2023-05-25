local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            -- Check `:Mason` to show names
            ensure_installed = {
                "autoflake", "bash-language-server", "beautysh", "semgrep", "clang-format", "debugpy", "html-lsp",
                "jdtls", "luacheck", "luaformatter", "prettier",
                "python-lsp-server", "shellcheck", "tailwindcss-language-server"
            }
        }
    }, {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            -- Supported languages names:
            -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
            ensure_installed = {
                "java", "python", "javascript", "html", "css", "haskell",
                "markdown", "bash"
            }
        }

    }, {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    }, {
        "neovim/nvim-lspconfig",

        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            config = function() require "custom.configs.null-ls" end
        },

        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    }
}

return plugins
