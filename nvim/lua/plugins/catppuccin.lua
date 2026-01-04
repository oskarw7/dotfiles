return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato", -- "mocha", "latte", "frappe", "macchiato"
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    TabLineFill = { bg = colors.mantle },

                    BufferInactive = { bg = colors.mantle },
                    BufferInactiveSign = { bg = colors.mantle },
                    BufferInactiveMod = { bg = colors.mantle, fg = colors.yellow },

                    BufferVisible = { bg = colors.mantle },
                    BufferVisibleSign = { bg = colors.mantle },
                    BufferVisibleMod = { bg = colors.mantle, fg = colors.yellow },

                    BufferOffset = { bg = colors.mantle },
                }
            end,
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                },
                mason = true,
                cmp = true,
                telescope = true,
                gitsigns = true,
                alpha = true,
                barbar = true,
                harpoon = true,
                neotree = true,
                notify = true,
                noice = true,
                fzf = true,
                dap = true,
                dap_ui = true,
                lualine = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
