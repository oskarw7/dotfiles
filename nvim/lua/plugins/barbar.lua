return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- barbar options here if needed
  },
  config = function()
    require('barbar').setup()

    local opts = { noremap = true, silent = true }

    -- Move to previous/next buffer
    vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

    -- Re-order to previous/next
    vim.api.nvim_set_keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

    -- Goto buffer in position...
    vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

    -- Pin/unpin buffer
    vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

    -- Close buffer
    vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

    -- Pick buffer
    vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
  end,
}

