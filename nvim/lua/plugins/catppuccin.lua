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
        mason = true,
        cmp = true,
        telescope = true,
        gitsigns = true,
        alpha = true,
        barbar = true,
        harpoon = true,
        neotree = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
