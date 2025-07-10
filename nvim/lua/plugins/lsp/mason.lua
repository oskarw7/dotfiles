return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "pyright",
                "clangd",
                "omnisharp",
                "rust_analyzer",
                "jdtls",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                -- Formatters / Linters
                "prettier", -- Web
                "stylua", -- Lua
                "isort",
                -- "black",
                "pylint", -- Python
                "eslint_d", -- JS
                "clang-format", -- C, C++
                "rustfmt", -- Rust
                "google-java-format", -- Java
                "cspell", -- C, C++
                "checkstyle", -- Java
                "bacon", -- Rust
            },
        })
    end,
}
