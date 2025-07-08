return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup()

        local builtin = require('telescope.builtin')
        -- Set your keymaps here
        vim.keymap.set('n', 'ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', {})
    end,
}
