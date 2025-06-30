return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- "mocha", "latte", "frappe", "macchiato"
      transparent_background = false,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
        },
        cmp = true,
        telescope = true,
        -- Add more integrations if needed
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
