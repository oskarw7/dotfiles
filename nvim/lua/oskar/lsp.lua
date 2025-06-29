require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installes = {},
    handlers = {
    function(server_name)
        require('lspconfig')[server_name].setp({})
    end,
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end,
        { desc = "go to definition", buffer = event.buf })
        --
        -- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end,
        --   { desc = "display hover information", buffer = event.buf })
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>',
        { desc = "display hover information", buffer = event.buf })

        vim.keymap.set('n', '<leader>vws', '<cmd>Lspsaga finder<CR>',
        { desc = "view workspace symbol (find in workspace)", buffer = event.buf })

        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end,
        { desc = "open floating diagnostics window", buffer = event.buf })
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end,
        { desc = "go to next diagnostic", buffer = event.buf })
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end,
        { desc = "go to previous diagnostic", buffer = event.buf })
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end,
        { desc = "code action (?)", buffer = event.buf })
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end,
        { desc = "view references", buffer = event.buf })
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end,
        { desc = "rename variable", buffer = event.buf })
        vim.keymap.set({ 'n', 'i' }, '<C-h>', function() vim.lsp.buf.signature_help() end,
        { desc = "signature help", buffer = event.buf })
    end,
})
