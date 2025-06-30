return {
  "nvim-tree/nvim-web-devicons",
  lazy = false, -- load on startup
  config = function()
    require("nvim-web-devicons").setup {
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        },
      },
      color_icons = true, -- enable colored icons
      default = true,     -- enable default icons globally
      strict = true,      -- enable strict matching by filename/ext
      variant = "dark",   -- or "light", if you're using a light theme

      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        },
      },

      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        },
      },

      override_by_operating_system = {
        ["apple"] = {
          icon = "",
          color = "#A2AAAD",
          cterm_color = "248",
          name = "Apple",
        },
      }
    }
  end
}

