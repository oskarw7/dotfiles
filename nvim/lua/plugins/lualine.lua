return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local palette = require("catppuccin.palettes").get_palette("macchiato") or {}
        local mantle = palette.mantle or "#181825"
        local custom_theme = require("lualine.themes.catppuccin")
        local function set_section_bg(mode, section, bg_color)
            if custom_theme[mode] then
                if not custom_theme[mode][section] then
                    custom_theme[mode][section] = {}
                end
                custom_theme[mode][section].bg = bg_color
            end
        end
        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, mode in ipairs(modes) do
            set_section_bg(mode, "c", mantle)
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = custom_theme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },

                disabled_filetypes = {
                    statusline = {},
                    winbar = { "neo-tree", "TelescopePrompt" },
                },

                ignore_focus = { "neo-tree", "TelescopePrompt" },

                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,

                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {},
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
