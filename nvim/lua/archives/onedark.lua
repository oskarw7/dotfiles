return {
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup {
      -- Main options --
      style = 'dark',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
      transparent = false,        -- Show/hide background
      term_colors = true,         -- Change terminal colors to match the theme
      ending_tildes = false,      -- Show tildes (~) at end of buffer
      cmp_itemkind_reverse = false, -- Reverse item kind highlights in cmp menu

      -- Toggle theme style ---
      toggle_style_key = nil,     -- Keybind to toggle theme style (e.g., "<leader>ts")
      toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

      -- Change code style ---
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
      },

      -- Lualine options --
      lualine = {
        transparent = false,       -- Enable transparent background for lualine
      },

      -- Custom colors --
      colors = {},

      -- Custom highlights --
      highlights = {},

      -- Diagnostics configuration --
      diagnostics = {
        darker = true,             -- Use darker colors for diagnostics
        undercurl = true,          -- Use undercurl instead of underline for diagnostics
        background = true,         -- Use background color for diagnostics
      },
    }
  end,
}
