return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    },
    config = function(_, opts)
        -- NOTE: Consider moving that to file which isn't lazy loaded
        vim.deprecate = function() end

        local notify = require("notify")
        notify.setup({
            background_colour = "#24273a", -- lub dowolny inny hex kolor
        })
        vim.notify = notify

        require("noice").setup(opts)

        vim.keymap.set("n", "<leader>nd", function()
            require("noice").cmd("dismiss")
        end, { desc = "Noice Dismiss" })
        vim.keymap.set("n", "<leader>nl", function()
            require("noice").cmd("last")
        end, { desc = "Noice Last Message" })
        vim.keymap.set("n", "<leader>nh", function()
            require("noice").cmd("history")
        end, { desc = "Noice History" })
    end,
}
