return {
  'tpope/vim-fugitive',
  config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
      vim.keymap.set("n", "<leader>gb", function() vim.cmd("Gblame") end)
      vim.keymap.set("n", "<leader>gd", function() vim.cmd("Git diff .") end)
      vim.keymap.set("n", "<leader>gl", function() vim.cmd("Git log") end)
      vim.keymap.set("n", "<leader>ga", function() vim.cmd("Git add .") end)
      vim.keymap.set("n", "<leader>gA", function() vim.cmd("Git add -A") end)
      vim.keymap.set("n", "<leader>gc", function() vim.cmd("Git commit") end)
      vim.keymap.set("n", "<leader>gp", function() vim.cmd("Git push") end)
      vim.keymap.set("n", "<leader>gP", function() vim.cmd("Git pull") end)
      vim.keymap.set("n", "<leader>gr", function() vim.cmd("Gread") end)
      vim.keymap.set("n", "<leader>gw", function() vim.cmd("Gwrite") end)
      vim.keymap.set("n", "<leader>gB", function() vim.cmd("GBrowse") end)
  end,
}
